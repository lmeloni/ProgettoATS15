package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.ProvaForm;

public class Prova implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il form relativo a questa Azione:
		ProvaForm f = (ProvaForm)form;
		
		//MODEL:
		//invocazione dei metodi delle classi model sempre in try-catch
		
		f.setFeedback("eventuale messaggio di feedback da mostrare nella pagina di risposta");
		
		//scelgo di salvare in request il Form (NB: questo passo è cmq SEMPRE svolto in Servlet!)
		request.setAttribute(f.getClass().getSimpleName(), f);

		return "provaDaForm.jsp";
	}

}
