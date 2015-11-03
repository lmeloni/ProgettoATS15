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
		
		Cliente c = new Cliente(id, email, password, nome, cognome, indirizzo, citta, telefono)
		
		try {
			DAOCliente dao=new DAOCliente();
			//recupero il cliente dalla sessione:
			Cliente c = (Cliente) request.getSession().getAttribute("utente");
			dao.update(c);
			
			return "MostraRistorantiPerCategoria";
			
		} catch (DAOException e) {
			return "errore.jsp";
		}
		
	}

}
