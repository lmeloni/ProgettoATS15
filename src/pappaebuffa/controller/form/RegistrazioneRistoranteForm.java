package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;

public class RegistrazioneRistoranteForm extends Form {
	
	private String email;
	private String password;
	private String confermaPassword;
	private String nome;
	private String categoria;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String descrizione;
	private String orario_apertura;
	private String orario_chiusura;

	
	


	@Override
	public void parametri2campiForm() {
		this.email = super.request.getParameter("email");
		this.password = super.request.getParameter("password");
		this.confermaPassword = super.request.getParameter("confermaPassword");
		this.nome = super.request.getParameter("nome");
		this.categoria = super.request.getParameter("categoria");
		this.indirizzo = super.request.getParameter("indirizzo");
		this.citta = super.request.getParameter("citta");
		this.telefono = super.request.getParameter("telefono");
		this.descrizione = super.request.getParameter("descrizione");
		this.orario_apertura = super.request.getParameter("orario_apertura");
		this.orario_chiusura = super.request.getParameter("orario_chiusura");
		
	}

	
		public String getEmail() {
		return email;
	}


	public String getPassword() {
		return password;
	}
	
	public String getConfermaPassword() {
		return confermaPassword;
	}

	public String getNome() {
		return nome;
	}


	public String getCategoria() {
		return categoria;
	}


	public String getIndirizzo() {
		return indirizzo;
	}


	public String getCitta() {
		return citta;
	}


	public String getTelefono() {
		return telefono;
	}


	public String getDescrizione() {
		return descrizione;
	}


	public String getOrario_apertura() {
		return orario_apertura;
	}


	public String getOrario_chiusura() {
		return orario_chiusura;
	}


	@Override
	public boolean validazione() {
		
		if (email==null || email.isEmpty())
			super.errori.add(new Errore("email", "obbligatoria"));
		else if (! Utilita.validaEmail(email))
			super.errori.add(new Errore("email", "email formalmente errata"));
		
		if (password==null || password.isEmpty())
			super.errori.add(new Errore("password", "obbligatorio"));
		else if (! Utilita.validaPassword(password))
			super.errori.add(new Errore("password", "password formalmente errata:almeno 8 caratteri e includere numeri e lettere"));
		
		if (confermaPassword==null || confermaPassword.isEmpty())
			super.errori.add(new Errore("confermaPassword", "obbligatorio"));
		else
			if(!confermaPassword.equals(password))
				super.errori.add(new Errore("confermaPassword", "le password non corrispondono"));
			
		if (nome==null || nome.isEmpty())
			super.errori.add(new Errore("nome", "obbligatorio"));
		
		if (citta==null || citta.isEmpty())
			super.errori.add(new Errore("citta", "obbligatorio"));
		
		if (categoria==null || categoria.isEmpty())
			super.errori.add(new Errore("categoria", "obbligatorio"));
		
		if (indirizzo==null || indirizzo.isEmpty())
			super.errori.add(new Errore("indirizzo", "obbligatorio"));
		
		if (telefono==null || telefono.isEmpty())
			super.errori.add(new Errore("telefono", "obbligatorio"));
		
		if (orario_apertura==null || orario_apertura.isEmpty())
			super.errori.add(new Errore("orario_apertura", "obbligatorio"));
		
		if (orario_chiusura==null || orario_chiusura.isEmpty())
			super.errori.add(new Errore("orario_chiusura", "obbligatorio"));
		
		return super.errori.size()==0 ? true:false;
	
		}
	
}