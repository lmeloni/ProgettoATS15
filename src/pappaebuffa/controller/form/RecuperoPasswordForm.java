package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;

public class RecuperoPasswordForm extends Form {
	
	private String utente;
	private String email;
	
	public String getUtente() {
		return utente;
	}
	public String getEmail() {
		return email;
	}
	
	@Override
	public void parametri2campiForm() {
		this.email=super.request.getParameter("email");
	}
	
	@Override
	public boolean validazione() {
		
		if (email==null || email.isEmpty())
			super.errori.add(new Errore("email", "obbligatorio"));
		else {				
			if (! Utilita.validaEmail(email))
				super.errori.add(new Errore("email", "email formalmente errata"));
		}
		
		return super.errori.size()==0 ? true:false;
	}
}
