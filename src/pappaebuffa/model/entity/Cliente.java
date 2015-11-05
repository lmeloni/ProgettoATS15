package pappaebuffa.model.entity;


public class Cliente extends Utente implements Comparable<Cliente> {
	
	private String cognome;
	
	public Cliente(int id, String email, String password, String nome,
			String cognome, String indirizzo, String citta, String telefono) {
		super(id, email, password, nome, indirizzo, citta, telefono);
		this.cognome = cognome;
	}

	public String getCognome() {
		return cognome;
	}

	@Override
	public String toString() {
		return "\nCliente [" + super.toString() + ", cognome=" + cognome + "]";
	}
	@Override
	public int compareTo(Cliente altro) {
		//criterio di ordinamento citta,nome,cognome,datareg
		return (citta+nome+cognome).compareTo
				(altro.citta+altro.nome+altro.cognome);
		
	}

	@Override
	public boolean isCliente() {
		return true;
	}
}
