package pappaebuffa.controller.azioni;


import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOAssociazione;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;
import pappaebuffa.model.entity.Ordine;

public class ComponiOrdine implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		// TODO I dati sarebbe meglio recuperarli dal form, 
		// piuttosto che forzare il recupero dalla request
		
		try {
			Ordine ordine = new Ordine(0, new DAOCliente().select(Integer.parseInt(request.getParameter("cliente")))
					, new DAORistorante().select(Integer.parseInt(request.getParameter("ristorante"))), null, 0.0, null);
			// TODO Gestire i Timestamp e il totale dell'ordine...
			
			// Inserire l'ordine nel DB, per poterne recuperare l'id autogenerato...
			int idOrdine = new DAOOrdine().insert(ordine);
			
			// Scorrere l'array di Stringhe che contiene gli id delle pietanze e, passando
			// per il DAOPietanza, costruire le associazioni fra l'ordine e le singole pietanze
			
			if(idOrdine > 0) {
				String[] idPietanze = request.getParameterValues("pietanza");
				DAOAssociazione dao = new DAOAssociazione();
				
				// Bisogna settare l'id dell'ordine in qualche modo,
				// altrimenti l'insert del DAOAssociazione dar� errore
				ordine.setId(idOrdine);
				
				for (String idPietanza : idPietanze)
					dao.insert(new Associazione(ordine
							, new DAOPietanza().select(Integer.parseInt(idPietanza))
							, 1));
				// TODO Bisogna gestire le porzioni multiple in qualche modo...
			} else {
				// CHE MINCHIA STA SUCCEDENDO??
				// Se l'ordine � stato inserito ma, per qualche motivo,
				// non siamo riusciti a recuperarne l'id...siamonnellammerda 
			}
		} catch (DAOException e) {
			e.printStackTrace();
		}

		return null;
	}

}