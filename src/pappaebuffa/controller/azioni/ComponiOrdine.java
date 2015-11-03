package pappaebuffa.controller.azioni;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.ComponiOrdineForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOAssociazione;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Preparazione;

public class ComponiOrdine implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
	
		ArrayList<Integer> quantita = ((ComponiOrdineForm) form).getQuantita();
		
		try {
			double totaleOrdine = 0;
			int i=0;
			
			for(Pietanza pietanza : ((ComponiOrdineForm) form).getPietanze()){
				
				Preparazione p = new DAOPreparazione().select(((ComponiOrdineForm) form).getRistorante().getId(), pietanza.getId());
				totaleOrdine += p.getPrezzo() * quantita.get(i);
				i++;
			}
			
			Ordine ordine = new Ordine(0, (Cliente) request.getSession().getAttribute("utente")
					, ((ComponiOrdineForm) form).getRistorante()
					, null, totaleOrdine, null);
			// TODO Gestire i Timestamp e il totale dell'ordine...
			
			// Inserire l'ordine nel DB, per poterne recuperare l'id autogenerato...
			int idOrdine = new DAOOrdine().insert(ordine);
			
			// Scorrere l'array di Stringhe che contiene gli id delle pietanze e, passando
			// per il DAOPietanza, costruire le associazioni fra l'ordine e le singole pietanze
			
			if(idOrdine > 0) {

				DAOAssociazione dao = new DAOAssociazione();
				
				// Bisogna settare l'id dell'ordine in qualche modo,
				// altrimenti l'insert del DAOAssociazione darà errore
				
				ordine.setId(idOrdine);
				i=0;
				
				for (Pietanza pietanza : ((ComponiOrdineForm)form).getPietanze()){
					dao.insert(new Associazione(ordine
							, new DAOPietanza().select(pietanza.getId())
							, quantita.get(i)));
					i++;
				}
			}
			
			return "ordineRiuscito.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
