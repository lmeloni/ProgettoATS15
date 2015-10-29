package pappaebuffa.model.entity;


public class Cliente implements Comparable<Cliente> {
	private int id;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String indirizzo;
	private String citta;
	private String telefono;
	
	public Cliente(int idCliente, String email, String password, String nome,
			String cognome, String indirizzo, String citta, String telefono) {
		super();
		this.id = idCliente;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
	}
	
	public int getIdCliente() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getNome() {
		return nome;
	}

	public String getCognome() {
		return cognome;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public String getCitta() {
		return citta;
	}

	public String getTelefono() {
		return telefono;
	}

	@Override
	public String toString() {
		return "\nCliente [idCliente=" + id + ", email=" + email
				+ ", password=" + password + ", nome=" + nome + ", cognome="
				+ cognome + ", indirizzo=" + indirizzo + ", citta=" + citta
				+ ", telefono=" + telefono + "]";
	}
	@Override
	public int compareTo(Cliente altro) {
		//criterio di ordinamento citta,nome,cognome,datareg
		return (citta+nome+cognome).compareTo
				(altro.citta+altro.nome+altro.cognome);
		
	}
}
