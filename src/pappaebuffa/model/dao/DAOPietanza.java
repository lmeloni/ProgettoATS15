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
	}

	@Override
	public ArrayList<Pietanza> select() throws DAOException {
	ArrayList<Pietanza> lista = new ArrayList<Pietanza>();
		
		String sql="SELECT id,nome,categoria,prezzo,descrizione "
				+ "FROM PIETANZA "
				+ "ORDER BY categoria,nome ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
		
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				lista.add( componiEntity() ); //popola la ArrayList
			
			if(lista.isEmpty())
				throw new DAOException("WARNING SELECT ALL: DATI NON TROVATI");
			else
				return lista;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	
	}

	@Override
	public Pietanza select(int id) throws DAOException {
	
		String sql="SELECT id,nome,categoria,prezzo,descrizione "
				+ "FROM PIETANZA "
				+ "WHERE id = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, id); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			if(res.next()) 
				return componiEntity(); 
			else
				throw new DAOException("WARNING SELECT x ID="+id+" DATI NON TROVATI");
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x ID="+id+". Causa: "+e.getMessage());
		}
	}

	private Pietanza componiEntity() throws SQLException {
		return new Pietanza(res.getInt("id")
				 , res.getString("nome")
				 , res.getString("categoria")
				 , res.getDouble("prezzo")
				 , res.getString("descrizione") );
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
		Pietanza tuplaOld = select(id); //recupera il Pietanza prima di cancellarlo!
		
		String sql="DELETE FROM PIETANZA WHERE id= ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, id); //sostituisco il marcatore
			pst.executeQuery(); //esegue la QUERY SQL cos� preparata!
			
			return tuplaOld;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE x id="+id+". Causa: "+e.getMessage());
		}
	}

	@Override
	public String[] columnNames() {
		return new String[] {"id","nome","categoria","prezzo","descrizione"};
	}
	
	public static void main(String[] args) {
		// SERVE PER TESTARE TUTTI I METODI DI QUESTO DAO!
		
		Pietanza l1 = new Pietanza(0,"zucchero","crepe dolce",5.00,"buonissima");
		try {
			
			DAOPietanza dao = new DAOPietanza();

			int id = dao.insert(l1);
			System.out.println("\nCreate - insert()..: "+id+" (ID generata o meno)");
			
			System.out.println("\nRead - select()....: "+dao.select());
			System.out.println("\nRead - select(id)..: "+dao.select(id));

			
		//	System.out.println("\nDelete - delete(pk): "+dao.delete(pk));
			
	
			
		} catch (DAOException e) {
			System.out.println( e );
			e.printStackTrace();
		}
		
	}
	

	
}
