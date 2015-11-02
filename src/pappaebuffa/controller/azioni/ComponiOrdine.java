package pappaebuffa.controller.azioni;


import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOAssociazione;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Ristorante;

public class ComponiOrdine implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		// I dati sarebbe meglio recuperarli dal form, 
		// piuttosto che forzare il recupero dalla request
		
		int idOrdine = 0;
		Ordine ordine = new Ordine(0, (Cliente) request.getAttribute("cliente")
				, (Ristorante) request.getAttribute("ristorante"), null, 0.0, null);
		// Gestire i Timestamp e il totale dell'ordine...
		
		try {
			// Inserire l'ordine nel DB, per poterne recuperare l'id autogenerato...
			idOrdine = new DAOOrdine().insert(ordine);
			
			// Scorrere l'array di Stringhe che contiene gli id delle pietanze e, passando
			// per il DAOPietanza, costruire le associazioni fra l'ordine e le singole pietanze
			
			if(idOrdine > 0) {
				String[] idPietanze = request.getParameterValues("pietanza");
				DAOAssociazione dao = new DAOAssociazione();
				
				// Bisogna settare l'id dell'ordine in qualche modo,
				// altrimenti l'insert del DAOAssociazione darà errore
				ordine.setId(idOrdine);
				
				for (String idPietanza : idPietanze)
					dao.insert(new Associazione(ordine
							, new DAOPietanza().select(Integer.parseInt(idPietanza))
							, 1));
				// Bisogna gestire le porzioni multiple in qualche modo...
			} else {
				// CHE MINCHIA STA SUCCEDENDO??
				// Se l'ordine è stato inserito ma, per qualche motivo,
				// non siamo riusciti a recuperarne l'id...siamonnellammerda 
			}
		} catch (DAOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
