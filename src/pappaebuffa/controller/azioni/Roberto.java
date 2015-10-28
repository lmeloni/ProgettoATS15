package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RobertoForm;

public class Roberto implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		RobertoForm f = (RobertoForm) form;
		
		request.setAttribute("formRoberto", f);
		
		return "robertopage.jsp";
	}

}
