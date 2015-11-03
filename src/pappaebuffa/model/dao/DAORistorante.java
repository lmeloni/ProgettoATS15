package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.dao.eccezioni.DAOLoginException;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ristorante;

public class DAORistorante extends DAO<Ristorante> {

	public DAORistorante() throws DAOConnessioneException {
		super();
	}

	@Override
	public ArrayList<Ristorante> select() throws DAOException {
		ArrayList<Ristorante> listaRistornate  = new ArrayList<Ristorante>();

		String sql=" SELECT id,email,password,nome,categoria,indirizzo,citta,telefono "
				+ ",descrizione,orario_apertura,orario_chiusura "
				+ "FROM ristorante "
				+ "ORDER BY categoria,citta,nome ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				listaRistornate.add( componiEntity() ); //popola la ArrayList

			if(listaRistornate.isEmpty())
				throw new DAOException("WARNING SELECT ALL: TABELLA VUOTA!");
			else
				return listaRistornate;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	}




	private Ristorante componiEntity() throws SQLException, DAOConnessioneException, DAOException {
		return   new Ristorante(res.getInt("id"), res.getString("email"), res.getString("password"), res.getString("nome")
				, res.getString("categoria"), res.getString("indirizzo"), res.getString("citta")
				, res.getString("telefono"), res.getString("descrizione"), res.getString("orario_apertura")
				, res.getString("orario_chiusura"));

	}

	@Override
	public Ristorante select(int pk) throws DAOException {
		String sql="SELECT id,email,password,nome,categoria,indirizzo,citta,telefono "
				+ ",descrizione,orario_apertura,orario_chiusura "
				+ "FROM ristorante "
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


	public ArrayList<Ristorante> selectByCategoria(String categoria) throws DAOException {
		ArrayList<Ristorante> listarist = new ArrayList<Ristorante>();
		String sql="SELECT id,email,password,nome,categoria,indirizzo,citta,telefono "
				+ ",descrizione,orario_apertura,orario_chiusura "
				+ "FROM ristorante "
				+ "WHERE categoria = ? ";
		
//		String sql="SELECT nome "
//				+ "FROM ristorante "
//				+ "WHERE categoria = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, categoria); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!
			while (res.next())  // scorre il result set
			
			listarist.add( componiEntity() );// popola

			if(listarist.isEmpty())
				throw new DAOException("WARNING SELECT per CATEGORIA : TABELLA VUOTA!");
			else
				return listarist; 
			 
			 

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT per CATEGORIA="+categoria+". Causa: "+e.getMessage());
		}

	}
	
	@Override
	public int insert(Ristorante entity) throws DAOException {
		boolean idValido = entity.getId() > 0;
		
		String sql="INSERT INTO RISTORANTE(email,password,nome,categoria,indirizzo,citta,telefono "
				+ ",descrizione,orario_apertura,orario_chiusura"
				+(idValido ? ",id" : "")
				+ " ) VALUES (?,?,?,?,?,?,?,?,?,?"
				+(idValido ? ",?" : "")
				+ ")";
		
		try(PreparedStatement pst = con.prepareStatement(sql, new String[] {"id"})) {
			//sostituire i marcatori ?:
			pst.setString(1, entity.getEmail());
			pst.setString(2, entity.getNome());
			pst.setString(3, entity.getPassword());
			pst.setString(4, entity.getCategoria());
			pst.setString(5, entity.getIndirizzo());
			pst.setString(6, entity.getCitta());
			pst.setString(7, entity.getTelefono());
			pst.setString(8, entity.getDescrizione());
			pst.setString(9, entity.getOrarioApertura());
			pst.setString(10, entity.getOrarioChiusura());
			
			if(idValido)
				pst.setInt(11, entity.getId());

			return insertInto(pst);

		} catch (SQLException e) {
			throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
		}
	}

	@Override
	public Ristorante delete(int pk) throws DAOException {
		Ristorante tuplaOld = select(pk); //recupera il Cliente prima di cancellarlo!

		String sql="DELETE FROM RISTORANTE WHERE id = ? ";
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
		// TODO Auto-generated method stub
		return null;
	}
 
	public ArrayList<String> selectCategoria() throws DAOException {
		
		ArrayList<String> listaCategoria  = new ArrayList<String>();

		String sql=" SELECT nome "
				+ "FROM categoria_ristorante ";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				listaCategoria.add(res.getString("nome")); //popola la ArrayList

			if(listaCategoria.isEmpty())
				throw new DAOException("WARNING SELECT ALL: TABELLA VUOTA!");
			else
				return listaCategoria;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	}
    public Ristorante update(Ristorante ristorante) throws DAOException{
		
		Ristorante tuplaOld = select(ristorante.getId()); //recupera ristorante prima di aggiornarlo!
		
		String sql="UPDATE RISTORANTE "
				+ "SET PASSWORD=?,NOME=?,CATEGORIA=?,INDIRIZZO=?,CITTA=?,TELEFONO=?, DESCRIZIONE=?, ORARIO_APERTURA=?, "
				+ "ORARIO_CHIUSURA=? "
				+ "WHERE ID = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			//sostituire i marcatori ?:			
			pst.setString(1, ristorante.getPassword());
			pst.setString(2, ristorante.getNome());
			pst.setString(3, ristorante.getCategoria());
			pst.setString(4, ristorante.getIndirizzo());
			pst.setString(5, ristorante.getCitta());
			pst.setString(6, ristorante.getTelefono());
			pst.setString(7, ristorante.getDescrizione());
			pst.setString(8, ristorante.getOrarioApertura());
			pst.setString(9, ristorante.getOrarioChiusura());
			pst.setInt(10, ristorante.getId());
			pst.executeUpdate(); //esegue la QUERY SQL così preparata!
			
			return tuplaOld;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE x PK="+ristorante.getId()+". Causa: "+e.getMessage());
		}
	}
	

	public static void main(String[] args) {
		// SERVE PER TESTARE TUTTI I METODI DI QUESTO DAO!

		try {
			Ristorante r = new Ristorante(0,"basilio56@tiscali.it","peb",
					"Da Basilio","Ristorante","via Timavo 97","Selargius",
					"0709805261",null,"10:00","23:00");

			DAORistorante dao = new DAORistorante();

			int id = dao.insert(r);
			System.out.println("\nCreate - insert()..: "+id+" (ID generata o meno)");

			System.out.println("\nRead - select()....: "+dao.select());
			System.out.println("\nRead - select(id)..: "+dao.select(id));


			System.out.println("\nDelete - delete(pk): "+dao.delete(id));
			
			System.out.println("\nRead - selectByCategoria(categoria): "+dao.selectByCategoria("Ristorante"));

			System.out.println("\nSeleziona categorie" + dao.selectCategoria());


		} catch (DAOException e) {
			System.out.println( e );
			e.printStackTrace();
		}

	}
	
	public Ristorante login(String email,String password) throws DAOException, DAOLoginException {
		String sql="SELECT id,email,password,nome,categoria,indirizzo,citta,telefono,descrizione,orario_apertura,orario_chiusura "
				+ "FROM RISTORANTE "
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
	
	
}
