package pappaebuffa.model.entity;

import java.util.ArrayList;

import com.sun.jmx.snmp.Timestamp;

public class Ordine {

	private int id;
	private Cliente cliente;
	private Ristorante ristorante;
	private Timestamp dataOrdine;
	private double importoTotale;
	private Timestamp dataRitiro;
	private ArrayList<Pietanza> pietanzeOrdinate;
	private ArrayList<Integer> porzioni;
	
	public Ordine(int id, Cliente cliente, Ristorante ristorante,
			Timestamp dataOrdine, double importoTotale, Timestamp dataRitiro,
			ArrayList<Pietanza> pietanzeOrdinate, ArrayList<Integer> porzioni) {
		super();
		this.id = id;
		this.cliente = cliente;
		this.ristorante = ristorante;
		this.dataOrdine = dataOrdine;
		this.importoTotale = importoTotale;
		this.dataRitiro = dataRitiro;
		this.pietanzeOrdinate = pietanzeOrdinate;
		this.porzioni = porzioni;
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

	public ArrayList<Pietanza> getPietanzeOrdinate() {
		return pietanzeOrdinate;
	}

	public ArrayList<Integer> getPorzioni() {
		return porzioni;
	}

	@Override
	public String toString() {
		return "\nOrdine [id=" + id + ", cliente=" + cliente + ", ristorante="
				+ ristorante + ", dataOrdine=" + dataOrdine
				+ ", importoTotale=" + importoTotale + ", dataRitiro="
				+ dataRitiro + ", pietanzeOrdinate=" + pietanzeOrdinate
				+ ", porzioni=" + porzioni + "]";
	}
	
	
}
