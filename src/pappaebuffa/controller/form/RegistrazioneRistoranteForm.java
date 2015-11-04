package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;

public class RegistrazioneRistoranteForm extends Form {
	
	private String email;
	private String password;
	private String passwordConferma;
	private String nome;
	private String categoria;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String descrizione;
	private String orarioApertura;
	private String orarioChiusura;

	
	


	@Override
	public void parametri2campiForm() {
		this.email = super.request.getParameter("email");
		this.password = super.request.getParameter("password");
		this.passwordConferma = super.request.getParameter("passwordConferma");
		this.nome = super.request.getParameter("nome");
		this.categoria = super.request.getParameter("categoria");
		this.indirizzo = super.request.getParameter("indirizzo");
		this.citta = super.request.getParameter("citta");
		this.telefono = super.request.getParameter("telefono");
		this.descrizione = super.request.getParameter("descrizione");
		this.orarioApertura = super.request.getParameter("orarioApertura");
		this.orarioChiusura = super.request.getParameter("orarioChiusura");
		
	}

	
		public String getEmail() {
		return email;
	}


	public String getPassword() {
		return password;
	}
	
	public String getPasswordConferma() {
		return passwordConferma;
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


	public String getOrarioApertura() {
		return orarioApertura;
	}


	public String getOrarioChiusura() {
		return orarioChiusura;
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
		
		if (passwordConferma==null || passwordConferma.isEmpty())
			super.errori.add(new Errore("passwordConferma", "obbligatorio"));
		else
			if(!passwordConferma.equals(password))
				super.errori.add(new Errore("passwordConferma", "le password non corrispondono"));
			
		if (nome==null || nome.isEmpty())
			super.errori.add(new Errore("nome", "obbligatorio"));
		
		if (citta==null || citta.isEmpty())
			super.errori.add(new Errore("citta", "obbligatorio"));
		
		if (indirizzo==null || indirizzo.isEmpty())
			super.errori.add(new Errore("indirizzo", "obbligatorio"));
		
		if (telefono==null || telefono.isEmpty())
			super.errori.add(new Errore("telefono", "obbligatorio"));
		
		if (orarioApertura==null || orarioApertura.isEmpty())
			super.errori.add(new Errore("orarioApertura", "obbligatorio"));
		
		if (orarioChiusura==null || orarioChiusura.isEmpty())
			super.errori.add(new Errore("orarioChiusura", "obbligatorio"));
		
		return super.errori.size()==0 ? true:false;
	
		}
	
}