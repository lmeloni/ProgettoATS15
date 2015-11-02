package pappaebuffa.model.entity;

public class Preparazione {

	private Ristorante ristorante;
	private Pietanza pietanza;
	private double prezzo;
	private String note;
	
	public Preparazione(Ristorante ristorante, Pietanza pietanza,
			double prezzo, String note) {
		this.ristorante = ristorante;
		this.pietanza = pietanza;
		this.prezzo = prezzo;
		this.note = note;
	}

	public Ristorante getRistorante() {
		return ristorante;
	}

	public Pietanza getPietanza() {
		return pietanza;
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
