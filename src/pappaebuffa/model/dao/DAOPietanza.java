package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;




import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;

public class DAOPietanza extends DAO<Pietanza>{

	protected DAOPietanza() throws DAOConnessioneException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<Pietanza> select() throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pietanza select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Pietanza pietanza) throws DAOException {
		
		String sql="INSERT INTO PIETANZA (nome,categoria,prezzo,descrizione) "
				+ "VALUES(?,?,?,?)";
		try(PreparedStatement pst = con.prepareStatement(sql, new String[]{"id"})) {
			//sostituire i marcatori ?:
			pst.setString(1, pietanza.getNome());
			pst.setString(2, pietanza.getCategoria());
			pst.setDouble(3, pietanza.getPrezzo());
			pst.setString(4, pietanza.getDescrizione());
			
			return super.insertInto(pst); //genera la PK via SEQUENCE ORACLE
		
		} catch (SQLException e) {
			throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
		}
	}

	@Override
	public Pietanza delete(int id) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] columnNames() {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
