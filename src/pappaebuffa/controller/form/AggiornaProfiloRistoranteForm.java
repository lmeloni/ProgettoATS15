package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;
import pappaebuffa.model.Utilita;

public class AggiornaProfiloRistoranteForm extends Form {
	
	private int id; //non verrà mai modificato
	private String email; //non verrà mai modificato
	private String nome;
	private String categoria;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String descrizione;
	private String orarioApertura;
	private String orarioChiusura;
	private String password;
	private String passwordConferma;

	public AggiornaProfiloRistoranteForm() {
		super();
	}

	/**
	 * Costruttore usato unicamente nell'azione ProfiloCliente
	 */
	public AggiornaProfiloRistoranteForm(int id, String email, String nome, String categoria, 
			String indirizzo, String citta, String telefono, String descrizione, 
			String orarioApertura, String orarioChiusura, String password) {
		super();
		this.id = id;
		this.email = email;
		this.nome = nome;
		this.categoria=categoria;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
		this.descrizione=descrizione;
		this.orarioApertura=orarioApertura;
		this.orarioChiusura=orarioChiusura;
		this.password = password;
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
		this.descrizione=super.request.getParameter("descrizione");
		this.orarioApertura=super.request.getParameter("orarioApertura");
		this.orarioChiusura=super.request.getParameter("orarioChiusura");
		this.password=super.request.getParameter("password");
		this.passwordConferma=super.request.getParameter("passwordConferma");
	}
		
	public int getId() {
		return id;
	}
	public String getEmail() {
		return email;
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
	public String getPassword() {
		return password;
	}
	public String getPasswordConferma() {
		return passwordConferma;
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
		
		if (telefono==null || telefono.isEmpty())
			super.errori.add(new Errore("telefono", "obbligatorio"));
		else if (! Utilita.validaTelefono(telefono))
			super.errori.add(new Errore("telefono", "formalmente errato: solo numeri, +, - e spazi"));
		
		if (orarioApertura==null || orarioApertura.isEmpty())
			super.errori.add(new Errore("orarioApertura", "obbligatorio"));
		
		if (orarioChiusura==null || orarioChiusura.isEmpty())
			super.errori.add(new Errore("orarioChiusura", "obbligatorio"));
		
		if (password==null || password.isEmpty())
			super.errori.add(new Errore("password", "obbligatorio"));
		else if (! Utilita.validaPassword(password))
			super.errori.add(new Errore("password", "formalmente errata: almeno 8 caratteri e includere numeri e lettere"));
		
		if (passwordConferma==null || passwordConferma.isEmpty())
			super.errori.add(new Errore("passwordConferma", "obbligatorio"));
		else
			if(!passwordConferma.equals(password))
				super.errori.add(new Errore("passwordConferma", "le password non corrispondono"));
		
		return super.errori.size()==0 ? true:false;
	}

}
