package pappaebuffa.model.entity;


public class Ristorante {
	private int id;
	private String email;
	private String password;
	private String nome;
	private String categoria;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String descrizione;
	private String orarioApertura;
	private String orarioChiusura;
	//private ArrayList<Preparazione> preparazioni;
	
	public Ristorante(int id, String email, String password, String nome,
			String categoria, String indirizzo, String citta, String telefono,
			String descrizione, String orarioApertura, String orarioChiusura/*,
			ArrayList<Preparazione> preparazioni*/) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.categoria = categoria;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
		this.descrizione = descrizione;
		this.orarioApertura = orarioApertura;
		this.orarioChiusura = orarioChiusura;
		/*this.preparazioni = preparazioni;
	}
	
	public Ristorante(int id, String email, String password, String nome,
			String categoria, String indirizzo, String citta, String telefono,
			String descrizione, String orarioApertura, String orarioChiusura) {
		this(id, email, password, nome, categoria, indirizzo, citta, telefono,
				descrizione, orarioApertura, orarioChiusura, null);*/
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
	public String toString() {
		return "\nRistorante [id=" + id + ", email=" + email
				+ ", nome=" + nome + ", categoria=" + categoria
				+ ", indirizzo=" + indirizzo + ", citta=" + citta
				+ ", telefono=" + telefono + ", descrizione=" + descrizione
				+ ", orarioApertura=" + orarioApertura + ", orarioChiusura="
				+ orarioChiusura + "]";
	}

	public String getPassword() {
		return password;
	}

	/*public ArrayList<Preparazione> getPreparazioni() {
		return preparazioni;
	}*/

}
