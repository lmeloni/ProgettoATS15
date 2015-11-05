package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class DominioPietanze implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		String funzione = request.getParameter("funzione");

		try {
			DAOPietanza dao = new DAOPietanza();
			
			//metto in sessione la lista pietanze aggiornata
			request.getSession().setAttribute("listaPietanze", dao.select());
			
			switch (funzione) {
			case "1": return "aggiungiPreparazione.jsp";
			case "2": return "showModificaPreparazione.jsp";
			default:
				request.setAttribute("errore", "ANOMALIA in azione 'DominioPietanze': funzione '"+funzione+"' non prevista!");
				return "errore.jsp";
			}
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
