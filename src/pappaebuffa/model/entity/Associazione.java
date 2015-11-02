package pappaebuffa.model.entity;

public class Associazione {
	private Ordine ordine;
	private Pietanza pietanza;
	private int quantita;
	
	public Associazione(Ordine ordine, Pietanza pietanza, int quantita) {
		this.ordine = ordine;
		this.pietanza = pietanza;
		this.quantita = quantita;
	}

	public Ordine getOrdine() {
		return ordine;
	}

	public Pietanza getPietanza() {
		return pietanza;
	}

	public int getQuantita() {
		return quantita;
	}

	@Override
	public String toString() {
		return "Associazione [ordine=" + ordine + ", pietanza="
				+ pietanza + ", quantita=" + quantita + "]";
	}
}
