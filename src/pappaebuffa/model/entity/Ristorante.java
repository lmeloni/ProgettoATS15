package pappaebuffa.model.entity;


public class Ristorante extends Utente {
	
	private String categoria;
	private String descrizione;
	private String orarioApertura;
	private String orarioChiusura;
	
	public Ristorante(int id, String email, String password, String nome,
			String categoria, String indirizzo, String citta, String telefono,
			String descrizione, String orarioApertura, String orarioChiusura) {
		super(id, email, password, nome, indirizzo, citta, telefono);
		this.categoria = categoria;
		this.descrizione = descrizione;
		this.orarioApertura = orarioApertura;
		this.orarioChiusura = orarioChiusura;
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

	@Override
	public String toString() {
		return "\nRistorante [" + super.toString() + ", categoria=" + categoria + 
				", descrizione=" + descrizione + ", orarioApertura=" + orarioApertura + 
				", orarioChiusura=" + orarioChiusura + "]";
	}

	public String getPassword() {
		return password;
	}

	@Override
	public boolean isCliente() {
		return false;
	}

}
