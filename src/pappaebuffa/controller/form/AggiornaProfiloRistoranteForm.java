package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class AggiornaProfiloRistoranteForm extends Form {
	
	private int id; //non verrà mai modificato
	private String email; //non verrà mai modificato
	private String nome;
	private String categoria;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String password;
	private String passwordConferma;
	private String descrizione;
	private String orarioApertura;
	private String orarioChiusura;

	public AggiornaProfiloRistoranteForm() {
		super();
	}


	/**
	 * Costruttore usato unicamente nell'azione ProfiloCliente
	 */
	public AggiornaProfiloRistoranteForm(int id, String email, String nome, String categoria, String indirizzo,
			String citta, String telefono, String password, String descrizione, String orarioApertura, String orarioChiusura) {
		super();
		this.id = id;
		this.email = email;
		this.nome = nome;
		this.categoria=categoria;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
		this.password = password;
		this.descrizione=descrizione;
		this.orarioApertura=orarioApertura;
		this.orarioChiusura=orarioChiusura;
	}

	@Override
	public void parametri2campiForm() {
		this.id= Integer.parseInt(super.request.getParameter("id"));
		this.email=super.request.getParameter("email");
		this.nome=super.request.getParameter("nome");
		this.categoria=super.request.getParameter("categoria");
		this.indirizzo=super.request.getParameter("indirizzo");
		this.citta=super.request.getParameter("citta");
		this.telefono=super.request.getParameter("telefono");
		this.password=super.request.getParameter("password");
		this.passwordConferma=super.request.getParameter("passwordConferma");
		this.descrizione=super.request.getParameter("descrizione");
		this.orarioApertura=super.request.getParameter("orarioApertura");
		this.orarioChiusura=super.request.getParameter("orarioChiusura");
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
	public void setPassword (String password) {
		this.password = password;
	}
	public String getPasswordConferma() {
		return passwordConferma;
	}
	public String getNome() {
		return nome;
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
		
		if (categoria==null || categoria.isEmpty())
			super.errori.add(new Errore("categoria", "obbligatorio"));
		
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
//		
//		if (passwordConferma==null || passwordConferma.isEmpty())
//			super.errori.add(new Errore("passwordConferma", "obbligatorio"));
//		else
//			if(!passwordConferma.equals(password))
//				super.errori.add(new Errore("passwordConferma", "le password non corrispondono"));
		
		//niente controlli per descrizione che può essere null
		
		if (orarioApertura==null || orarioApertura.isEmpty())
			super.errori.add(new Errore("orarioApertura", "obbligatorio"));
		
		if (orarioChiusura==null || orarioChiusura.isEmpty())
			super.errori.add(new Errore("orarioChiusura", "obbligatorio"));
		
		return super.errori.size()==0 ? true:false;
	}

	public String getCategoria() {
		return categoria;
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

}
