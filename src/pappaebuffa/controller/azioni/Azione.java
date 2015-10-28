package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;

public interface Azione {
	
	String esegui(HttpServletRequest request, Form form);

}
