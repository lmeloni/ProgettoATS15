package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;
import pappaebuffa.model.entity.Preparazione;

public class DAOAssociazione extends DAO<Associazione>{

	public DAOAssociazione() throws DAOConnessioneException {
		super();
	}

	@Override
	public ArrayList<Associazione> select() throws DAOException {
		ArrayList<Associazione> a  = new ArrayList<>();
		
		String sql="SELECT id_ordine,id_pietanza,quantita "
				+ "FROM associazione ";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				a.add(componiEntity()); //popola la ArrayList

			if(a.isEmpty())
				throw new DAOException("WARNING SELECT ALL: TABELLA VUOTA!");
			else
				return a;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	}

	private Associazione componiEntity() throws DAOException, SQLException {
		
			return new Associazione(new DAOOrdine().select(res.getInt("id_ordine")),
					new DAOPietanza().select(res.getInt("id_pietanza")), 
					res.getInt("quantita"));
	}

	@Override
	public Associazione select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<Associazione> selectByOrdine(int idOrdine) throws DAOException {
		ArrayList<Associazione> a  = new ArrayList<>();

		String sql="SELECT id_ordine,id_pietanza,quantita "
				+ "FROM associazione "
				+ "WHERE id_ordine = ? "
				/*+ "ORDER BY id_ordine "*/;
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idOrdine);
			
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				a.add(componiEntity()); //popola la ArrayList
			
			if(a.isEmpty())
				//throw new DAOException("WARNING SELECT by Ordine: TABELLA VUOTA!");
				return null;
			else
				return a;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT by Ordine. Causa: "+e.getMessage());
		}
	}
	
	@Override
	public int insert(Associazione associazione) throws DAOException {
		
		String sql="INSERT INTO associazione "
				+ "(id_ordine,id_pietanza,quantita) "
				+ "VALUES (?,?,?)";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			//sostituire i marcatori ?:
			pst.setInt(1, associazione.getOrdine().getId());
			pst.setInt(2, associazione.getPietanza().getId());
			pst.setInt(3, associazione.getQuantita());
			
			return pst.executeUpdate();

		} catch (SQLException e) {
			throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
		}
	}

	@Override
	public Associazione delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Associazione delete(int idOrdine, int idPietanza) throws DAOException {
		
		Associazione tuplaOld = select(idOrdine, idPietanza);

		String sql="DELETE FROM associazione WHERE id_ordine = ? AND id_pietanza = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idOrdine);
			pst.setInt(2, idPietanza);
			pst.executeUpdate(); //esegue la QUERY SQL così preparata!

			return tuplaOld;

		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE x PK=("+idOrdine+","+idPietanza+"). Causa: "+e.getMessage());
		}

	}
	
	public Associazione select(int idOrdine, int idPietanza) throws DAOException {
		
		String sql="SELECT id_ordine,id_pietanza,quantita "
				+ "FROM associazione "
				+ "WHERE id_ordine = ? AND id_pietanza = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idOrdine);
			pst.setInt(2, idPietanza);
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			if(res.next())
				return componiEntity();
			else
				throw new DAOException("WARNING SELECT x PK=("+idOrdine+","+idPietanza+") DATI NON TROVATI");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x PK=("+idOrdine+","+idPietanza+"). Causa: "+e.getMessage());
		}

	}

	@Override
	public String[] columnNames() {
		// TODO Auto-generated method stub
		return null;
	}
	public static void main(String[] args) {
		try {
			Associazione a = new Associazione(new DAOOrdine().select(15), 
									new DAOPietanza().select(1), 1);
			
			System.out.println("INSERT: " + new DAOAssociazione().insert(a));
			System.out.println("SELECT ALL: " + new DAOAssociazione().select());
			System.out.println("DELETE: " + 
					new DAOAssociazione().delete(a.getOrdine().getId(),
							a.getPietanza().getId()));
		} catch (DAOException e) {
			e.printStackTrace();
		}
	}

}
