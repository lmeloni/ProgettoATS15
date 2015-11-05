package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class AggiungiPreparazionePerRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {

		try {
			DAOPietanza dao = new DAOPietanza();
			
			//metto in sessione la lista pietanze aggiornata
			request.getSession().setAttribute("listaPietanze", dao.select());
			
			return "aggiungiPreparazione.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
