package pappaebuffa.controller.azioni;


import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.ComponiOrdineForm;
import pappaebuffa.model.dao.DAOAssociazione;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.entity.Preparazione;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Pietanza;

public class ComponiOrdine implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
	
		ArrayList<Integer> quantita = ((ComponiOrdineForm) form).getQuantita();
		
		try {
//			for(Pietanza pietanza : ((ComponiOrdineForm) form).getPietanze()){
//				Preparazione p = new Preparazione(((ComponiOrdineForm) form).getRistorante(), pietanza, pietanza.getId());
//				
//			}
			
			double totaleOrdine = 0;
			
			
			for (int numeroPorzioni : quantita){
//				totaleOrdine = totaleOrdine + (numeroPorzioni * p.getPrezzo());
				
			}
			Ordine ordine = new Ordine(0, (Cliente) request.getSession().getAttribute("cliente")
					, ((ComponiOrdineForm) form).getRistorante()
					, (Timestamp) null, totaleOrdine, (Timestamp) null);
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
				int i=0;
				
				for (Pietanza pietanza : ((ComponiOrdineForm)form).getPietanze()){
					dao.insert(new Associazione(ordine
							, new DAOPietanza().select(pietanza.getId())
							, quantita.get(i)));
					i++;
				}
	
			}
			
		} catch (DAOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
