package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;

public class LoginForm extends Form {
	
	private String utente;
	private String email;
	private String password;

	public String getUtente() {
		return utente;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	
	@Override
	public void parametri2campiForm()  {
		this.utente = super.request.getParameter("utente");
		this.email = super.request.getParameter("email");
		this.password = super.request.getParameter("password");
	}

	@Override
	public boolean validazione() {
		
		if(password==null || password.isEmpty())
			super.errori.add(new Errore("password", "obbligatorio"));
		
		if (email==null || email.isEmpty())
			super.errori.add(new Errore("email", "obbligatorio"));
		else if (! Utilita.validaEmail(email))
			super.errori.add(new Errore("email", "email formalmente errata"));
		else { //se email formalmente valida
			try {
				switch (utente) {
				case "cliente":
					DAOCliente daoCliente = new DAOCliente();
					daoCliente.login(email, password);	
					break;
			    case "ristorante":
			    	DAORistorante daoRistorante = new DAORistorante();
			    	daoRistorante.login(email, password);		
					break;
				default:
					super.errori.add(new Errore("utente", "specificare cliente | ristorante"));
				}
				
			} catch (DAOLoginException e) {
				super.errori.add(new Errore("email", e.getMessage()));
			} catch (DAOException e) {
				super.errori.add(new Errore("email", "problemi al DB! Per favore riprova più tardi.."));
			}
		}
		
		return super.errori.size()==0 ? true:false;
	}
	
	
	
	

}
