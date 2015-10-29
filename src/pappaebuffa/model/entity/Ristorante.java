package pappaebuffa.model.entity;

public class Ristorante {
	private int idRistorante;
	private String email;
	private String nome;
	private String categoria;
	private String indirizzo;
	private String citta;
	private String telefono;
	private String descrizione;
	private String orarioApertura;
	private String orarioChiusura;
	
	public Ristorante(int idRistorante, String email, String nome,
			String categoria, String indirizzo, String citta, String telefono,
			String descrizione, String orarioApertura, String orarioChiusura) {
		super();
		this.idRistorante = idRistorante;
		this.email = email;
		this.nome = nome;
		this.categoria = categoria;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
		this.descrizione = descrizione;
		this.orarioApertura = orarioApertura;
		this.orarioChiusura = orarioChiusura;
	}

	public int getIdRistorante() {
		return idRistorante;
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
		return "\nRistorante [idRistorante=" + idRistorante + ", email=" + email
				+ ", nome=" + nome + ", categoria=" + categoria
				+ ", indirizzo=" + indirizzo + ", citta=" + citta
				+ ", telefono=" + telefono + ", descrizione=" + descrizione
				+ ", orarioApertura=" + orarioApertura + ", orarioChiusura="
				+ orarioChiusura + "]";
	}

}
