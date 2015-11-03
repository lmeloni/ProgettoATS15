package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloClienteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.entity.Cliente;

public class ProfiloCliente implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il cliente (utente) dalla sessione:
		Cliente c = (Cliente) request.getSession().getAttribute("utente");
		
		//popolo il form che mostrer� i dati da modificare:
		AggiornaProfiloClienteForm apf = new AggiornaProfiloClienteForm(c.getId(), c.getEmail(), 
				c.getNome(), c.getCognome(), c.getIndirizzo(), 
				c.getCitta(), c.getTelefono(), c.getPassword());
		
		//salvo in sessione il form che servir� alla pagina profiloCliente
		request.getSession().setAttribute("AggiornaProfiloForm", apf);
		
		return "profiloCliente.jsp";
	}

}
