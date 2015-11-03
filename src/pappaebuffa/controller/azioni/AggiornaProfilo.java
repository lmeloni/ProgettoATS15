package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;

public class AggiornaProfilo implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiornaProfiloForm f = (AggiornaProfiloForm) form;
		
		try {
			DAOCliente dao=new DAOCliente();
			
			//recupero il cliente dalla sessione:
			Cliente c = (Cliente) request.getSession().getAttribute("cliente");
			dao.update(c);
			
			return "RecuperaCategorieRistoranti";
			
		} catch (DAOException e) {
			return "errore.jsp";
		}
		
	}

}
