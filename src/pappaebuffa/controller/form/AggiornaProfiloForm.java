package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class AggiornaProfiloForm extends Form {
	
	private String nome;
	private String cognome;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String password;
	private String passwordConferma;


	
	@Override
	public void parametri2campiForm() {
		this.nome=super.request.getParameter("nome");
		this.cognome=super.request.getParameter("cognome");
		this.indirizzo=super.request.getParameter("indirizzo");
		this.citta=super.request.getParameter("citta");
		this.telefono=super.request.getParameter("telefono");
		this.password=super.request.getParameter("password");
		this.passwordConferma=super.request.getParameter("passwordConferma");
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
	public String getCognome() {
		return cognome;
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

	@Override
	public boolean validazione() {
		
		if (nome==null || nome.isEmpty())
			super.errori.add(new Errore("nome", "obbligatorio"));
		
		if (cognome==null || cognome.isEmpty())
			super.errori.add(new Errore("cognome", "obbligatorio"));
		
		if (indirizzo==null || indirizzo.isEmpty())
			super.errori.add(new Errore("indirizzo", "obbligatorio"));
		
		if (citta==null || citta.isEmpty())
			super.errori.add(new Errore("citta", "obbligatorio"));
		
		if (password==null || password.isEmpty())
			super.errori.add(new Errore("password", "obbligatorio"));
		
		if (passwordConferma==null || passwordConferma.isEmpty())
			super.errori.add(new Errore("passwordConferma", "obbligatorio"));
		else
			if(!passwordConferma.equals(password))
				super.errori.add(new Errore("passwordConferma", "le password non corrispondono"));
		
		return super.errori.size()==0 ? true:false;
	}

}
