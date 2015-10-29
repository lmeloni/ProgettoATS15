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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Ristorante entity) throws DAOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Ristorante delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] columnNames() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
