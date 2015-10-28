package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;

public class ProvaHref implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//NON recupero nessun form! Prelevo i parametri direttamenti da request
				
		request.setAttribute("nome", request.getParameter("nome"));
		request.setAttribute("eta" , request.getParameter("eta"));
		
		return "provaDaHref.jsp";
	}

}
