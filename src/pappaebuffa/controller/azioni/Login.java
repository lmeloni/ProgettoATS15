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
				DAOCliente daoCliente = new DAOCliente();
				request.getSession().setAttribute("utente", daoCliente.login(f.getEmail(), f.getPassword()));
				return "motore?azione=RecuperaCategorieRistoranti";
			case "ristorante":
		    	DAORistorante daoRistorante = new DAORistorante();
				request.getSession().setAttribute("utente", daoRistorante.login(f.getEmail(), f.getPassword()));
				return "homeUtente.jsp";
			default:
				request.setAttribute("errore", "UTENTE '"+f.getUtente()+"' NON PREVISTO!");
				return "errore.jsp";
			}
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}

	}

}
