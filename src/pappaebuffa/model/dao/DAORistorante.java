package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
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



		} catch (DAOException e) {
			System.out.println( e );
			e.printStackTrace();
		}

	}


}
