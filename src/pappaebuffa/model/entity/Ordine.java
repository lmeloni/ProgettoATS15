package pappaebuffa.model.entity;

import java.sql.Timestamp;

public class Ordine {

	private int id;
	private Cliente cliente;
	private Ristorante ristorante;
	private Timestamp dataOrdine;
	private double importoTotale;
	private Timestamp dataRitiro;
	
	public Ordine(int id, Cliente cliente, Ristorante ristorante,
			Timestamp dataOrdine, double importoTotale, Timestamp dataRitiro) {
		this.id = id;
		this.cliente = cliente;
		this.ristorante = ristorante;
		this.dataOrdine = dataOrdine;
		this.importoTotale = importoTotale;
		this.dataRitiro = dataRitiro;
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

	public Timestamp getDataOrdine() {
		return dataOrdine;
	}

	public double getImportoTotale() {
		return importoTotale;
	}

	public Timestamp getDataRitiro() {
		return dataRitiro;
	}

	@Override
	public String toString() {
		return "\nOrdine [id=" + id + ", cliente=" + cliente + ", ristorante="
				+ ristorante + ", dataOrdine=" + dataOrdine
				+ ", importoTotale=" + importoTotale + ", dataRitiro="
				+ dataRitiro + "]";
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
