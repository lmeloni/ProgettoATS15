package pappaebuffa.model.entity;

public class Pietanza {
	
	private int id;
	private String nome;
	private String categoria;
	private String descrizione;
	
	public Pietanza(int id, String nome, String categoria, String descrizione) {
		this.id = id;
		this.nome = nome;
		this.categoria = categoria;
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
	public String getDescrizione() {
		return descrizione;
	}

	@Override
	public String toString() {
		return "Pietanza [id=" + id + ", nome=" + nome + ", categoria="
				+ categoria + ", descrizione=" + descrizione + "]";
	}

}
