package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.entity.Cliente;

public class ProfiloCliente implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il cliente dalla sessione:
		Cliente c = (Cliente) request.getSession().getAttribute("cliente");
		
		AggiornaProfiloForm apf= new AggiornaProfiloForm(c.getEmail(), c.getNome(), c.getCognome(), c.getIndirizzo(), 
				c.getCitta(), c.getTelefono(), c.getPassword());
		
		//salvo in sessione il form che servirà alla pagina profiloCliente
		request.getSession().setAttribute("AggiornaProfiloForm", apf);
		
		
		return "profiloCliente.jsp";
	}

}
