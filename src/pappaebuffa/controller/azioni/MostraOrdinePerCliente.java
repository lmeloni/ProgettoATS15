package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;

public class MostraOrdinePerCliente implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		Cliente cliente = (Cliente) request.getSession().getAttribute("utente");
		try {
			DAOOrdine dao = new DAOOrdine();
	
			request.setAttribute("ordiniCliente", dao.selectByCliente(cliente));
	
			return "showOrdiniCliente.jsp";
		
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp"; 
		}
	
	}

}
