package pappaebuffa.model.entity;

public class Pietanza {
	
	private String nome;
	private String categoria;
	private double prezzo;
	private String descrizione;
	
	public Pietanza(int idPietanza, String nome, String categoria,
			double prezzo, String descrizione) {
		this.idPietanza = idPietanza;
		this.nome = nome;
		this.categoria = categoria;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
	}

	private int idPietanza;
	public int getIdPietanza() {
		return idPietanza;
	}
	public String getNome() {
		return nome;
	}
	public String getCategoria() {
		return categoria;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	
	@Override
	public String toString() {
		return "\nPietanza [nome=" + nome + ", categoria=" + categoria
				+ ", prezzo=" + prezzo + ", descrizione=" + descrizione
				+ ", idPietanza=" + idPietanza + "]";
	}
}
