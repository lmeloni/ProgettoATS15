package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;

public class LoginForm extends Form {
	
	
	private String utente;
	private String email;
	private String password;

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}
	
	public String getUtente() {
		return utente;
	}

	@Override
	public void parametri2campiForm()  {
		this.utente=super.request.getParameter("utente");
		this.email=super.request.getParameter("email");
		this.password=super.request.getParameter("password");
	}

	@Override
	public boolean validazione() {
		
		if (email==null || email.isEmpty())
			super.errori.add(new Errore("email", "obbligatorio"));
		else {
			if(password==null || password.isEmpty())
				super.errori.add(new Errore("password", "obbligatorio"));
			else if (! Utilita.validaEmail(email))
				super.errori.add(new Errore("email", "email formalmente errata"));
			else {
				//TODO switch case se l'utente è un cliente o un ristorante
				try {
					DAOCliente dao = new DAOCliente();
					dao.login(email, password);	
					
				} catch (DAOLoginException e) {
					super.errori.add(new Errore("email", e.getMessage()));
				} catch (DAOException e) {
					super.errori.add(new Errore("email", "problemi al DB, riprovare più tardi!"));
				}
			}
		}
		
		return super.errori.size()==0 ? true:false;
	}
	
	
	
	

}
