package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.LoginForm;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class Login implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		LoginForm f = (LoginForm) form;
		
		
		try {
			switch (f.getUtente()) {
			case "cliente":
				DAOCliente dao = new DAOCliente();
				//salvo l'oggetto cliente in sessione:
				request.getSession().setAttribute("utente", dao.login(f.getEmail(), f.getPassword()));
				return "homeCliente.jsp";	

		    case "ristorante":
		    	DAORistorante daoRistorante = new DAORistorante();
				//salvo l'oggetto cliente in sessione:
				request.getSession().setAttribute("utente", daoRistorante.login(f.getEmail(), f.getPassword()));
				return "homeRistorante.jsp";	

			default:
				return "errore.jsp";
			}
			
			
			
		} catch (DAOException e) {
			return "errore.jsp";
		}
		
	}

}
