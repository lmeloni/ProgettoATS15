package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Preparazione;

public class DAOPreparazione extends DAO<Preparazione> {

	public DAOPreparazione() throws DAOConnessioneException {
		super();
	}

	@Override
	public ArrayList<Preparazione> select() throws DAOException {
		ArrayList<Preparazione> r  = new ArrayList<>();

		String sql="SELECT id_ristorante,id_pietanza,prezzo,note "
				+ "FROM preparazione "
				/*+ "ORDER BY id_pietanza "*/;
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				r.add(componiEntity()); //popola la ArrayList

			if(r.isEmpty())
				throw new DAOException("WARNING SELECT ALL: TABELLA VUOTA!");
			else
				return r;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	}

	@Override
	public Preparazione select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Preparazione> selectByRistorante(int idRistorante) throws DAOException {
		ArrayList<Preparazione> r  = new ArrayList<>();

		String sql="SELECT id_ristorante,id_pietanza,prezzo,note "
				+ "FROM preparazione "
				+ "WHERE id_ristorante = ? "
				/*+ "ORDER BY id_pietanza "*/;
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idRistorante);
			
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				r.add(componiEntity()); //popola la ArrayList
			
			//potrei fare direttamente return r...
			if(r.isEmpty())
				//throw new DAOException("WARNING SELECT by Ristorante: TABELLA VUOTA!");
				return null;
			else
				return r;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT by Ristorante. Causa: "+e.getMessage());
		}

	}

	public double selectPrezzoByPietanzaRistorante(int idPietanza, int idRistorante) throws DAOException {
		String sql="SELECT prezzo "
				+ "FROM preparazione "
				+ "WHERE id_pietanza = ? AND id_ristorante = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idPietanza);
			pst.setInt(2, idRistorante);
			
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			if(res.next()) //scorre TUTTO il ResultSet
				return res.getDouble("prezzo");
			else
				throw new DAOException("WARNING SELECT Prezzo by Ristorante & Pietanza: TABELLA VUOTA!");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT Prezzo by Ristorante & Pietanza. Causa: "+e.getMessage());
		}

	}

	private Preparazione componiEntity() throws DAOException, SQLException {
		return new Preparazione(new DAORistorante().select(res.getInt("id_ristorante")),
				new DAOPietanza().select(res.getInt("id_pietanza")), 
				res.getDouble("prezzo"), res.getString("note"));
	}

	@Override
	public int insert(Preparazione preparazione) throws DAOException {
		String sql="INSERT INTO preparazione "
				+ "(id_ristorante,id_pietanza,prezzo,note) "
				+ "VALUES (?,?,?,?)";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			//sostituire i marcatori ?:
			pst.setInt(1, preparazione.getRistorante().getId());
			pst.setInt(2, preparazione.getPietanza().getId());
			pst.setDouble(3, preparazione.getPrezzo());
			pst.setString(4, preparazione.getNote());
			
			return pst.executeUpdate();

		} catch (SQLException e) {
			throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
		}
	}

	@Override
	public Preparazione delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	public void delete(int idRistorante, int idPietanza) throws DAOException {
		Preparazione tuplaOld = select(idRistorante, idPietanza);

		String sql="DELETE FROM preparazione WHERE id_ristorante = ? AND id_pietanza = ?";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idRistorante);
			pst.setInt(2, idPietanza);
			pst.executeUpdate(); //esegue la QUERY SQL così preparata!

		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE x PK=("+idRistorante+","+idPietanza+"). Causa: "+e.getMessage());
		}

	}
	
	public void update(Preparazione preparazione) throws DAOException{
		
		//verifichiamo che la tupla preparazione esista
		Preparazione tuplaOld =null;
		try {
			tuplaOld = select( preparazione.getRistorante().getId(), preparazione.getPietanza().getId());
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new DAOException("ERRORE select x PK=("+preparazione.getRistorante().getId()+","+preparazione.getPietanza().getId()+"). Causa: "+e.getMessage());
		}
		
		String sql="UPDATE PREPARAZIONE " 
				+ "SET PREZZO = ?, NOTE = ? "
				+ "WHERE id_ristorante = ? AND id_pietanza = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setDouble(1, preparazione.getPrezzo());
			pst.setString(2, preparazione.getNote());
			pst.setInt(3, preparazione.getRistorante().getId());
			pst.setInt(4, preparazione.getPietanza().getId());
			pst.executeUpdate(); //esegue la QUERY SQL così preparata!
		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE x PK=("+preparazione.getRistorante().getId()+","+preparazione.getPietanza().getId()+"). Causa: "+e.getMessage());
		}
	}


	public Preparazione select(int idRistorante, int idPietanza) throws DAOException {
		String sql="SELECT id_ristorante,id_pietanza,prezzo,note "
				+ "FROM preparazione "
				+ "WHERE id_ristorante = ? AND id_pietanza = ?";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idRistorante);
			pst.setInt(2, idPietanza);
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			if(res.next())
				return componiEntity();
			else
				throw new DAOException("WARNING SELECT x PK=("+idRistorante+","+idPietanza+") DATI NON TROVATI");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x PK=("+idRistorante+","+idPietanza+"). Causa: "+e.getMessage());
		}

	}
	
	public String[] columnNames() {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		try {
			Preparazione p = new Preparazione(new DAORistorante().select(1), 
									new DAOPietanza().select(2), 12.5, null);
			
			System.out.println("INSERT: " + new DAOPreparazione().insert(p));
			System.out.println("SELECT ALL: " + new DAOPreparazione().select());
//			System.out.println("DELETE: " + 
//					new DAOPreparazione().delete(p.getRistorante().getId(),
//							p.getPietanza().getId()));
		} catch (DAOException e) {
			e.printStackTrace();
		}
	}

}
