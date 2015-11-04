package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloClienteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;

public class AggiornaProfiloCliente implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiornaProfiloClienteForm f = (AggiornaProfiloClienteForm) form;
		
		//creo il Cliente con i NUOVI dati provenienti dal form:
		Cliente cliente = new Cliente(f.getId(), f.getEmail(), f.getPassword(), 
			f.getNome(), f.getCognome(), f.getIndirizzo(), f.getCitta(), f.getTelefono());
		System.out.println(cliente);
		
		try {
			DAOCliente dao = new DAOCliente();
			dao.update(cliente);
			
			request.getSession().setAttribute("utente", cliente);
			
			return "homeUtente.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
