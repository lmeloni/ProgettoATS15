package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RecuperoPasswordForm;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;

public class RecuperoPassword implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		RecuperoPasswordForm f = (RecuperoPasswordForm) form;
		try {
			DAOCliente dao = new DAOCliente();
			f.setFeedback("OK, password recuperata: "+dao.recuperaPassword(f.getEmail()));
			
			return f.getPagina();
			
		} catch (DAOLoginException e) {
			f.setFeedback("Spiacenti, email non registrata!");
			return f.getPagina();
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
	}
	

}
