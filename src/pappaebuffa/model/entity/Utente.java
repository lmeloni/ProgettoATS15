package pappaebuffa.model.entity;

public abstract class Utente {
	
	protected int id;
	protected String email;
	protected String password;
	protected String nome;
	protected String indirizzo;
	protected String citta;
	protected String telefono;
	
	protected Utente(int id, String email, String password, String nome,
			String indirizzo, String citta, String telefono) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
	}
	
	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
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
		return "id=" + id + ", email=" + email + ", password=" + password + 
				", nome=" + nome + ", indirizzo=" + indirizzo + ", citta=" + citta
				+ ", telefono=" + telefono;
	}
	
	public abstract boolean isCliente();
	
}
