package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;

public class Vai implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
				return request.getParameter("risorsa");
	}

}
