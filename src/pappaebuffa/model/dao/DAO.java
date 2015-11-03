package pappaebuffa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public abstract class DAO<T> {
	
	protected Connection con;
	protected ResultSet res;
	
	/**
	 * Ottiene la connessione al DB e permette di utilizzare i metodi CRUD
	 * @throws DAOConnessioneException
	 */
	protected DAO() throws DAOConnessioneException{ //COSTRUTTORE DEFAULT
		con = ConnessioneSingleton.getIstanza().getCon();
	//	System.out.println("\nOK Connessione ==> "+con);	
	}
	
	public void chiudiConnessione() throws DAOConnessioneException {
		ConnessioneSingleton.getIstanza().chiudiCon();
	}
	
	
	public DAO getIstanza(T entita) throws DAOException {
		DAO dao;
		//istanziare il DAOxxx() opportuno con factory tecnica reflection:
		switch(entita.getClass().getSimpleName()) { 
		case "entita1":	 dao = null;  break;
		case "entita2":	 dao = null;  break;
		case "entita3":	 dao = null;  break;
		default:
			throw new DAOException
			("ANOMALIA Factory DAO: entità '"+entita+"' non prevista!");
		}
		return dao;
	}
	
	
	public int insertInto(PreparedStatement pst) throws SQLException {
		int newKey = -1;
		pst.executeUpdate(); 
		try (ResultSet rs = pst.getGeneratedKeys()) {
			if(rs.next())
				newKey = rs.getInt(1);
		}
		return newKey;
	}
	
	
	//metodi astratti per il C.R.U.D.:
	
	public abstract ArrayList<T> select() throws DAOException;
	public abstract T select(int pk) throws DAOException;
	public abstract int insert(T entity) throws DAOException;
	public abstract T delete(int pk) throws DAOException;

	
	public abstract String[] columnNames();


	
}
