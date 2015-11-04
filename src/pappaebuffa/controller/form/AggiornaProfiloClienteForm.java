package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class AggiornaProfiloClienteForm extends Form {
	
	private int id; //non verrà mai modificato
	private String email; //non verrà mai modificato
	private String nome;
	private String cognome;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String password;
	private String passwordConferma;

	public AggiornaProfiloClienteForm() {
		super();
	}
	
	/**
	 * Costruttore usato unicamente nell'azione ProfiloCliente
	 */
	public AggiornaProfiloClienteForm(int id, String email, String nome, String cognome, String indirizzo,
			String citta, String telefono, String password) {
		super();
		this.id = id;
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
		this.password = password;
	}

	@Override
	public void parametri2campiForm() {
		this.id= Integer.parseInt(super.request.getParameter("id"));
		this.email=super.request.getParameter("email");
		this.nome=super.request.getParameter("nome");
		this.cognome=super.request.getParameter("cognome");
		this.indirizzo=super.request.getParameter("indirizzo");
		this.citta=super.request.getParameter("citta");
		this.telefono=super.request.getParameter("telefono");
		this.password=super.request.getParameter("password");
		this.passwordConferma=super.request.getParameter("passwordConferma");
	}
		
	public int getId() {
		return id;
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
		System.out.println("OK?");
		if (nome==null || nome.isEmpty())
			super.errori.add(new Errore("nome", "obbligatorio"));
		
		if (cognome==null || cognome.isEmpty())
			super.errori.add(new Errore("cognome", "obbligatorio"));
		
		if (indirizzo==null || indirizzo.isEmpty())
			super.errori.add(new Errore("indirizzo", "obbligatorio"));
		
		if (citta==null || citta.isEmpty())
			super.errori.add(new Errore("citta", "obbligatorio"));
		
		if(passwordConferma.equals(password) && password!=null && !password.isEmpty()){
			if (password.length()<8)
				super.errori.add(new Errore("password", "inserire almeno 8 caratteri"));
			if (passwordConferma.length()<8)
				super.errori.add(new Errore("passwordConferma", "inserire almeno 8 caratteri"));
		}
			
//		if (password==null || password.isEmpty())
//			super.errori.add(new Errore("password", "obbligatorio"));
//		if (password.length()<8)
//			super.errori.add(new Errore("password", "inserire almeno 8 caratteri"));
		
//		if (passwordConferma==null || passwordConferma.isEmpty())
//			super.errori.add(new Errore("passwordConferma", "obbligatorio"));
//		if (passwordConferma.length()<8)
//			super.errori.add(new Errore("passwordConferma", "inserire almeno 8 caratteri"));
		
		return super.errori.size()==0 ? true:false;
	}

}
