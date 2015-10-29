package pappaebuffa.model.entity;

public class Pietanza {
	private int id;
	private String nome;
	private String categoria;
	private double prezzo;
	private String descrizione;
	
	public Pietanza(int id, String nome, String categoria,
			double prezzo, String descrizione) {
		this.id = id;
		this.nome = nome;
		this.categoria = categoria;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
	}

	
	public int getId() {
		return id;
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
				+ ", id=" + id + "]";
	}
}
