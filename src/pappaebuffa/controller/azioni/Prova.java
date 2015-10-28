package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.ProvaForm;

public class Prova implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il form relativo a questa Azione:
		ProvaForm f = (ProvaForm)form;
		
		request.setAttribute("form", f);

		return "uscita.jsp";
	}

}
