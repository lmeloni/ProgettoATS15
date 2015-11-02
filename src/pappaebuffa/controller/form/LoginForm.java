package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;

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
		
		if (! Utilita.validaEmail(email))
			super.errori.add(new Errore("email", "email formalmente errata"));
		
		try {
			DAOCliente dao = new DAOCliente();
			dao.login(email, password);
		} catch (DAOLoginException e) {
			super.errori.add(new Errore("email", e.getMessage()));
		} catch (DAOException e) {
			super.errori.add(new Errore("email", "problemi al DB, riprovare pi� tardi!"));
		}
		
		return super.errori.size()==0 ? true:false;
	}
	
	
	
	

}
