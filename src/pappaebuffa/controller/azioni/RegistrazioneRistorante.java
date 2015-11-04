package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RegistrazioneForm;
import pappaebuffa.model.entity.Ristorante;

public class RegistrazioneRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		
		
		
		
		
		
		
		
		Ristorante ristorante = new Ristorante(0, null, null, null, null
				, null, null, null, null, null, null);
		return null;
	}

}
