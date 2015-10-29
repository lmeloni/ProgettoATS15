package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RobertoForm;

public class Roberto implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il form relativo a questa Azione:
		RobertoForm f = (RobertoForm) form;
		
		f.setFeedback("msg feedback di Roberto: evviva! :-) ");
		
		//scelgo di salvare in request il Form (NB: questo passo è cmq SEMPRE svolto in Servlet!)
		request.setAttribute(f.getClass().getSimpleName(), f);
		
		return "robertopage.jsp";
	}

}
