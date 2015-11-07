package pappaebuffa.model.entity;

import java.sql.Timestamp;
import java.text.ParseException;

import pappaebuffa.model.Utilita;

public class Ordine {

	private int id;
	private Cliente cliente;
	private Ristorante ristorante;
	private Timestamp dataOrdine;
	private double importoTotale;
	private Timestamp dataRitiro;
	private boolean evaso;
	
	public Ordine(int id, Cliente cliente, Ristorante ristorante, Timestamp dataOrdine
			, double importoTotale, Timestamp dataRitiro, boolean evaso) {
		this.id = id;
		this.cliente = cliente;
		this.ristorante = ristorante;
		this.dataOrdine = dataOrdine;
		this.importoTotale = importoTotale;
		this.dataRitiro = dataRitiro;
		this.evaso = evaso;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public Ristorante getRistorante() {
		return ristorante;
	}

	public String getDataOrdineS() throws ParseException {
		return Utilita.timestampToString(dataOrdine);
	}

	public Timestamp getDataOrdine() {
		return dataOrdine;
	}

	public double getImportoTotale() {
		return importoTotale;
	}

	public String getDataRitiroS() throws ParseException {
		return Utilita.timestampToString(dataRitiro);
	}

	public Timestamp getDataRitiro() {
		return dataRitiro;
	}
	public void setEvaso(boolean evaso) {
		this.evaso = evaso;
	}
	public boolean getEvaso() {
		return evaso;
	}

	@Override
	public String toString() {
		return "\nOrdine [id=" + id + ", cliente=" + cliente + ", ristorante="
				+ ristorante + ", dataOrdine=" + dataOrdine
				+ ", importoTotale=" + importoTotale + ", dataRitiro=" + dataRitiro + 
				", evaso=" + evaso + "]";
	}

	
}
