package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;

public class Logout implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		request.getSession().removeAttribute("utente");
		return "login.jsp";
	}

}
