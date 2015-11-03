package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;
import pappaebuffa.model.entity.Cliente;

public class DAOCliente extends DAO<Cliente> {

	public DAOCliente() throws DAOConnessioneException {
		super();
	}

	
	public Cliente login(String email,String password) throws DAOException, DAOLoginException {
		String sql="SELECT id,email,password,nome,cognome,indirizzo,citta,telefono "
				+ "FROM CLIENTE "
				+ "WHERE email = ? "
				+ "  AND password = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, email); 
			pst.setString(2, password); 
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			if(res.next()) 
				return componiEntity(); 
			else
				throw new DAOLoginException("l'email o la password sono errati");

		} catch (SQLException e) {
			throw new DAOException("ERRORE LOGIN x email="+email+". Causa: "+e.getMessage());
		}
	}
	
	public String recuperaPassword(String email) throws DAOException, DAOLoginException {
		String sql="SELECT DISTINCT password "
				+ "FROM CLIENTE "
				+ "WHERE email = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, email); 			
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			if(res.next()) 
				return res.getString(1); 
			else
				throw new DAOLoginException("email non trovata");

		} catch (SQLException e) {
			throw new DAOException("ERRORE RECUPERA PASSWORD x email="+email+". Causa: "+e.getMessage());
		}
	}
	
	/**
	 * ottiene TUTTI i clienti presenti in tabella CLIENTE, 
	 * ordinati per nome,cognome,citta
	 * @return ArrayList<Cliente> lista del entity bean Cliente
	 * @throws DAOException
	 */
	@Override
	public ArrayList<Cliente> select() throws DAOException {
		ArrayList<Cliente> lista = new ArrayList<Cliente>();
		String sql="SELECT id,email,password,nome,cognome,indirizzo,citta,telefono "
				+ "FROM CLIENTE "
				+ "ORDER BY nome,cognome,citta ";

		try(PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				lista.add( componiEntity() ); //popola la ArrayList

			if(lista.isEmpty())
				throw new DAOException("WARNING SELECT ALL: TABELLA VUOTA!");
			else
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	}
	/**
	 * ottiene entity bean Cliente corrispondente al valore di PK in argomento
	 * @param pk corrispondente al id del cliente in tabella CLIENTE
	 * @return entity bean Cliente
	 * @throws DAOException
	 */

	@Override
	public Cliente select(int pk) throws DAOException {
		String sql="SELECT id,email,password,nome,cognome,indirizzo,citta,telefono "
				+ "FROM CLIENTE "
				+ "WHERE id = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, pk); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			if(res.next()) 
				return componiEntity(); 
			else
				throw new DAOException("WARNING SELECT x PK="+pk+" DATI NON TROVATI");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x PK="+pk+". Causa: "+e.getMessage());
		}
	}
	/**
	 * inserisce una tupla in tabella CLIENTE. 
	 * NB: se la PK del entity bean Cliente è <= 0 allora viene generata la PK
	 * altrimenti comanda il valore di PK specificato nel bean.
	 * @param entity (entity bean Cliente)
	 * @return intero della PK (generata o meno)
	 * @throws DAOException
	 */
	@Override
	public int insert(Cliente entity) throws DAOException {
		boolean idValido = entity.getId() > 0;
		
		String sql="INSERT INTO CLIENTE (email,password,nome,cognome,indirizzo,citta,telefono"
				+(idValido ? ",id" : "")
				+") VALUES(?,?,?,?,?,?,?"
				+(idValido ? ",?" : "")
				+")";
		
		try(PreparedStatement pst = con.prepareStatement(sql, new String[] {"id"})) {
			//sostituire i marcatori ?:
			pst.setString(1, entity.getEmail());
			pst.setString(2, entity.getPassword());
			pst.setString(3, entity.getNome());
			pst.setString(4, entity.getCognome());
			pst.setString(5, entity.getIndirizzo());
			pst.setString(6, entity.getCitta());
			pst.setString(7, entity.getTelefono());
			
			if(idValido)
				pst.setInt(8, entity.getId());
			
			return insertInto(pst);

		} catch (SQLException e) {
			throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
		}

	}
	/**
	 * cancella la tupla corrispondente all'id (PK) del cliente in argomento
	 * e restituisce l'entity bean Cliente del cliente prima della cancellazione. 
	 * @param pk corrispondente all'id del cliente da cancellare in tab CLIENTE
	 * @return entity bean Cliente del cliente prima della cancellazione
	 * @throws DAOException
	 */
	@Override
	public Cliente delete(int pk) throws DAOException {
		Cliente tuplaOld = select(pk); //recupera il Cliente prima di cancellarlo!

		String sql="DELETE FROM CLIENTE WHERE id = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, pk); //sostituisco il marcatore
			pst.executeQuery(); //esegue la QUERY SQL così preparata!

			return tuplaOld;

		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE x PK="+pk+". Causa: "+e.getMessage());
		}
	}

	@Override
	public String[] columnNames() {
		return new String[] {
				"id",
				"email",
				"password",
				"nome",
				"cognome",
				"indirizzo",
				"citta",
				"recapito"
		};
	}

	private Cliente componiEntity() throws SQLException {
		return new Cliente(res.getInt("id")
				, res.getString("email")
				, res.getString("password")
				, res.getString("nome")
				, res.getString("cognome")
				, res.getString("indirizzo")
				, res.getString("citta")
				, res.getString("telefono"));
	}

	public Cliente update(Cliente cliente) throws DAOException{
		
		Cliente tuplaOld = select(cliente.getId()); //recupera cliente prima di aggiornarlo!
		
		String sql="UPDATE CLIENTE "
				+ "SET PASSWORD=?,NOME=?,COGNOME=?,INDIRIZZO=?,CITTA=?,TELEFONO=? "
				+ "WHERE ID = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			//sostituire i marcatori ?:			
			pst.setString(1, cliente.getPassword());
			pst.setString(2, cliente.getNome());
			pst.setString(3, cliente.getCognome());
			pst.setString(4, cliente.getIndirizzo());
			pst.setString(5, cliente.getCitta());
			pst.setString(6, cliente.getTelefono());
			pst.setInt(7, cliente.getId());
			pst.executeUpdate(); //esegue la QUERY SQL così preparata!
			
			return tuplaOld;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE x PK="+cliente.getId()+". Causa: "+e.getMessage());
		}
	}
	public static void main(String[] args) {
		// SERVE PER TESTARE TUTTI I METODI DI QUESTO DAO!

		Cliente c1 = new Cliente(0, "ciarlotta87@gmail.com", "012d", "Lucia", "Contini", "Via Firenze,4", "Maracalagonis(CA)", "070789991");
		
		try {
			DAOCliente dao = new DAOCliente();
			int pk = dao.insert(c1);
			Cliente c2 = new Cliente(pk, "ciarlotta87@gmail.com", "012d", "Federica", "Contini", "Via Firenze,4", "Maracalagonis(CA)", "070789991");
			
			System.out.println("\nCreate - insert()..: "+pk+" (PK generata o meno)");
			System.out.println("\nRead - select()....: "+dao.select());
			System.out.println("\nRead - select(pk)..: "+dao.select(pk));
			
			System.out.println("\nUpdate ..."+dao.update(c2));
			System.out.println("\nDelete - delete(pk)....: "+dao.delete(pk));
		} catch (DAOException e) {
			System.out.println( e );
			e.printStackTrace();
		}

	}

}
