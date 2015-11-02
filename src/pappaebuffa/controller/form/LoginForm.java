package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class LoginForm extends Form {
	
	private String email;
	private String password;

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	@Override
	public void parametri2campiForm()  {
		this.email=super.request.getParameter("email");
		this.password=super.request.getParameter("password");
	}

	@Override
	public boolean validazione() {
		
		if(email==null || email.isEmpty())
			super.errori.add(new Errore("email", "obbligatorio"));
		
		if(password==null || password.isEmpty())
			super.errori.add(new Errore("password", "obbligatorio"));
		
		if (! email.matches("/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+.([a-zA-Z])+([a-zA-Z])"))
			super.errori.add(new Errore("email", "email formalmente errata"));
		
		
			
		
		return super.errori.size()==0 ? true:false;
	}
	
	
	
	

}
