package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class DAORistorante extends DAO<Ristorante> {

	protected DAORistorante() throws DAOConnessioneException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<Ristorante> select() throws DAOException {
		ArrayList<Ristorante> listaRistornate  = new ArrayList<Ristorante>();
		
		String sql=" SELECT id,email,nome,categoria,indirizzo,citta,telefono "
				  + ",decrizione,orario_apertura,orario_chiusura, "
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
	
	
	

	private Ristorante componiEntity() throws SQLException {
		return   new Ristorante(res.getInt("id"), res.getString("email"), res.getString("nome")
				, res.getString("categoria"), res.getString("indirizzo"), res.getString("citta")
				, res.getString("telefono"), res.getString("descrizione"), res.getString("orarioApertura")
				, res.getString("orarioChiusura"));
		 
	}

	@Override
	public Ristorante select(int pk) throws DAOException {
		String sql="SELECT id,email,nome,categoria,indirizzo,citta,telefono "
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
		String sql="INSERT INTO RISTORANTE(email,nome,categoria,indirizzo,citta,telefono "
				+ ",descrizione,orario_apertura,orario_chiusura ) "
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		try(PreparedStatement pst = con.prepareStatement(sql, new String[] {"id"})) {
			//sostituire i marcatori ?:
			pst.setString(1, entity.getEmail());
			pst.setString(2, entity.getNome());
			pst.setString(3, entity.getCategoria());
			pst.setString(4, entity.getIndirizzo());
			pst.setString(5, entity.getCitta());
			pst.setString(6, entity.getTelefono());
			pst.setString(7, entity.getDescrizione());
			pst.setString(8, entity.getOrarioApertura());
			pst.setString(9, entity.getOrarioChiusura());
			
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
	

}
