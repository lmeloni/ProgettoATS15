package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;

public class DAOPietanza extends DAO<Pietanza>{

	public DAOPietanza() throws DAOConnessioneException {
		super();
	}

	@Override
	public ArrayList<Pietanza> select() throws DAOException {
		ArrayList<Pietanza> lista = new ArrayList<Pietanza>();

		String sql="SELECT id,nome,categoria,descrizione "
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

		String sql="SELECT id,nome,categoria,descrizione "
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
	
	public Pietanza selectByCategoria(String categoria) throws DAOException {
		String sql="SELECT  id,nome,categoria,descrizione "
				+ "FROM pietanza "
				+ "WHERE categoria = ? "
				+ "ORDER BY nome ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, categoria); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			if(res.next()) 
				return componiEntity(); 
			else
				throw new DAOException("WARNING SELECT x CATEGORIA="+categoria+" DATI NON TROVATI");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x CATEGORIA="+categoria+". Causa: "+e.getMessage());
		}

	}
	
	public ArrayList<Pietanza> selectByRistoranteCategoria(String categoria, int idRistorante) throws DAOException {
		ArrayList<Pietanza> lista = new ArrayList<Pietanza>();
		String sql="SELECT  p.id,p.nome,p.categoria,p.descrizione "
				+ "FROM pietanza p, preparazione "
				+ "WHERE p.id = id_pietanza AND id_ristorante=? AND p.categoria=? "
				+ "ORDER BY p.categoria,p.nome ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1,idRistorante); //sostituisco il marcatore
			pst.setString(2,categoria);
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			while(res.next()) 
				lista.add(componiEntity());
			
			if (lista.isEmpty())
				throw new DAOException("WARNING SELECT x CATEGORIA="+categoria+" DATI NON TROVATI");
			else	
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x CATEGORIA="+categoria+". Causa: "+e.getMessage());
		}

	}	

	private Pietanza componiEntity() throws SQLException {
		return new Pietanza(res.getInt("id")
				, res.getString("nome")
				, res.getString("categoria")
				, res.getString("descrizione") );
	}

	@Override
	public int insert(Pietanza pietanza) throws DAOException {
		boolean idValido = pietanza.getId() > 0;

		String sql="INSERT INTO PIETANZA (nome,categoria,descrizione"
			+(idValido ? ",id" : "")
			+") VALUES(?,?,?"
			+(idValido ? ",?" : "")
			+")";
		
		try(PreparedStatement pst = con.prepareStatement(sql, new String[]{"id"})) {
			//sostituire i marcatori ?:
			pst.setString(1, pietanza.getNome());
			pst.setString(2, pietanza.getCategoria());
			pst.setString(3, pietanza.getDescrizione());
			
			if(idValido)
				pst.setInt(4, pietanza.getId());

			return super.insertInto(pst); //genera la PK via SEQUENCE ORACLE

		} catch (SQLException e) {
			throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
		}
	}

	@Override
	public Pietanza delete(int id) throws DAOException {
		Pietanza tuplaOld = select(id); //recupera il Pietanza prima di cancellarlo!

		String sql="DELETE FROM PIETANZA WHERE id = ? ";
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

	public ArrayList<String> selectCategoria() throws DAOException {
		ArrayList<String> lista = new ArrayList<String>();

		String sql="SELECT nome "
				+ "FROM CATEGORIA_PIETANZA "
				+ "ORDER BY 1 ";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				lista.add(res.getString("nome")) ; //popola la ArrayList

			if(lista.isEmpty())
				throw new DAOException("WARNING SELECT ALL: DATI NON TROVATI");
			else
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}

	}

	public ArrayList<String> selectCategoriaByRistorante(int idRistorante) throws DAOException {
		ArrayList<String> lista = new ArrayList<String>();

		String sql="select distinct categoria "
			+ "from pietanza p join preparazione on p.id=id_pietanza "
			+ "where id_ristorante = ? "
			+ "order by 1 ";
		
		try(PreparedStatement pst = con.prepareStatement(sql)){
			pst.setInt(1, idRistorante);
			
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!
			
			while (res.next()) //scorre TUTTO il ResultSet
				lista.add(res.getString("categoria")) ; //popola la ArrayList

			if(lista.isEmpty())
				throw new DAOException("WARNING SELECT Categoria By Ristorante: DATI NON TROVATI");
			else
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT Categoria By Ristorante. Causa: "+e.getMessage());
		}

	}
	
	/**
	 * restituisce tutte le pietanze preparate dalidRistorante 
	 * @param idRistorante
	 * @return
	 * @throws DAOException
	 */
	public ArrayList<Pietanza> selectByRistorante( int idRistorante) throws DAOException {
		ArrayList<Pietanza> lista = new ArrayList<Pietanza>();
		String sql="SELECT  p.id,p.nome,p.categoria,p.descrizione ,pre.note,pre.prezzo "
				+ "FROM pietanza p, preparazione pre "
				+ "WHERE p.id = pre.id_pietanza AND pre.id_ristorante=? "
				+ "ORDER BY p.categoria,p.nome ";;
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1,idRistorante); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			while(res.next()) 
				lista.add(componiEntity());
			
			if (lista.isEmpty())
				throw new DAOException("WARNING Il RISTORANTE="+idRistorante+" NON PREPARA NESSUNA PIETANZA");
			else	
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x RISTORANTE="+idRistorante+". Causa: "+e.getMessage());
		}

	}	

	/**
	 * restituisce tutte le pietanze che non vengono preparate dal idRistorante 
	 * @param idRistorante
	 * @return
	 * @throws DAOException
	 */
	public ArrayList<Pietanza> selectByNotRistorante( int idRistorante) throws DAOException {
		ArrayList<Pietanza> lista = new ArrayList<Pietanza>();
		String sql="SELECT  p.id,p.nome,p.categoria,p.descrizione "
				+" FROM pietanza p "
				+" WHERE p.id not in ( SELECT  pi.id "
				+" 					   FROM pietanza pi, preparazione "
				+" 					   WHERE pi.id = preparazione.id_pietanza AND id_ristorante = ?) ";
				
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1,idRistorante); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL cos� preparata!

			while(res.next()) 
				lista.add(componiEntity());
			
			if (lista.isEmpty())
				throw new DAOException("WARNING Il RISTORANTE="+idRistorante+" NON PREPARA NESSUNA PIETANZA");
			else	
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x RISTORANTE="+idRistorante+". Causa: "+e.getMessage());
		}

	}	
	
	public static void main(String[] args) {
		// SERVE PER TESTARE TUTTI I METODI DI QUESTO DAO!

		Pietanza l1 = new Pietanza(0,"zucchero","Pizza dolce","buonissima");
		try {

			DAOPietanza dao = new DAOPietanza();

//			int id = dao.insert(l1);
//			System.out.println("\nCreate - insert()..: "+id+" (ID generata o meno)");
//
//			System.out.println("\nRead - select()....: "+dao.select());
//			System.out.println("\nRead - select(id)..: "+dao.select(id));
//
//			System.out.println("\nDelete - delete(pk): "+dao.delete(id));
//
//			System.out.println("\nRead_selectByCategoria()....: "+dao.selectByCategoria("Primo"));
			System.out.println("\nRead_selectByRistoranteCategoria()....: "+dao.selectByRistoranteCategoria("Bevande",1));

		} catch (DAOException e) {
			System.out.println( e );
			e.printStackTrace();
		}

	}

	
	
	@Override
	public Pietanza update(Pietanza entity) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}
	

}
