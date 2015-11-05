package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiungiPreparazioneForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Preparazione;
import pappaebuffa.model.entity.Ristorante;

public class AggiungiPreparazione implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiungiPreparazioneForm f = (AggiungiPreparazioneForm) form;

		//recupero il Ristorante (utente) dalla sessione:
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
		
		try {
			DAOPietanza daoPietanza = new DAOPietanza();
			Pietanza pietanza = daoPietanza.select(f.getIdPietanza());
			
			double prezzo = Double.parseDouble(f.getPrezzo());
			Preparazione preparazione = new Preparazione(ristorante, pietanza, prezzo, f.getNote());
			
			DAOPreparazione daoPreparazione = new DAOPreparazione();
			daoPreparazione.insert(preparazione);
			
			f.setFeedback("OK, pietanza aggiunta nel menù (aggiunta Preparazione)");
			
			return "aggiungiPreparazione.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
			
	}

}
