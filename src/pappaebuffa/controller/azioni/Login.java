package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.azioni.Azione;
import pappaebuffa.controller.bean.Errore;
import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.LoginForm;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;


public class Login implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		LoginForm f = (LoginForm) form;
		request.removeAttribute(form.getClass().getSimpleName());
		
		try {
			DAOCliente dao = new DAOCliente();
			
			//salvo l'oggetto cliente in sessione:
			request.getSession().setAttribute("cliente", dao.login(f.getEmail(), f.getPassword()));
			
			return "homeCategoria.jsp";
			
		} catch (DAOException e) {
			return "errore.jsp";
		}
		
	}

}
