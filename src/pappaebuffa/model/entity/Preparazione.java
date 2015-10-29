package pappaebuffa.model.entity;

public class Preparazione {

	private Pietanza pietanza;
	private Ristorante ristorante;
	private double prezzo;
	private String note;
	
	public Preparazione(Pietanza pietanza, Ristorante ristorante,
			double prezzo, String note) {
		super();
		this.pietanza = pietanza;
		this.ristorante = ristorante;
		this.prezzo = prezzo;
		this.note = note;
	}

	public Pietanza getPietanza() {
		return pietanza;
	}

	public Ristorante getRistorante() {
		return ristorante;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public String getNote() {
		return note;
	}

	@Override
	public String toString() {
		return "\nPreparazione [pietanza=" + pietanza + ", ristorante="
				+ ristorante + ", prezzo=" + prezzo + ", note=" + note + "]";
	}
	
	
}
