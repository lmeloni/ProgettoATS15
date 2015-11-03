package pappaebuffa.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Ristorante;
import sun.security.action.GetIntegerAction;

public class DAOOrdine extends DAO<Ordine>{

	public DAOOrdine() throws DAOConnessioneException {
		super();
	}

	@Override
	public ArrayList<Ordine> select() throws DAOException {
		ArrayList<Ordine> listaOrdine  = new ArrayList<Ordine>();
		String sql=" SELECT id,id_cliente,id_ristorante,data,importo,data_ritiro "
				+ "FROM ordine "
				+ "ORDER BY id_cliente,id_ristorante,data_ritiro ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			while (res.next()) //scorre TUTTO il ResultSet
				listaOrdine.add( componiEntity() ); //popola la ArrayList

			if(listaOrdine.isEmpty())
				throw new DAOException("WARNING SELECT ALL: TABELLA VUOTA!");
			else
				return listaOrdine;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: "+e.getMessage());
		}
	}

	private Ordine componiEntity() throws DAOConnessioneException, SQLException, DAOException {
		return   new Ordine(res.getInt("id"), new DAOCliente().select(res.getInt("id_cliente"))
				,new DAORistorante().select(res.getInt("id_ristorante"))
				,res.getTimestamp("data"),res.getDouble("importo")
				,res.getTimestamp("data_ritiro"));		
	}
		
	

	@Override
	public Ordine select(int pk) throws DAOException {
		String sql="SELECT id,id_cliente,id_ristorante,data,importo,data_ritiro "
				+ "FROM ordine "
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
	
	public ArrayList<Ordine> selectByRistorante(Ristorante locale) throws DAOException {
		ArrayList<Ordine> lista = new ArrayList<Ordine>();
		String sql="SELECT id,id_cliente,id_ristorante,data,importo,data_ritiro "
				+ "FROM ordine "
				+ "WHERE id_ristorante = ? ";
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, locale.getId()); //sostituisco il marcatore
			res = pst.executeQuery(); //esegue la QUERY SQL così preparata!

			
			
			while(res.next()) 
				lista.add(componiEntity());
			if (lista.isEmpty())
				throw new DAOException("WARNING SELECT x PK="+locale.getId()+" DATI NON TROVATI");
			else
				return lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT x PK="+locale.getId()+". Causa: "+e.getMessage());
		}
		
	}

	@Override
	public int insert(Ordine entity) throws DAOException {
			boolean idValido = entity.getId() > 0;
			
			String sql="INSERT INTO ORDINE(id_cliente,id_ristorante,data,importo,data_ritiro "
					+(idValido ? ",id" : "")
					+ " ) VALUES (?,?,?,?,? "
					+(idValido ? ",?" : "")
					+ ")";
			try {
				PreparedStatement pst = con.prepareStatement(sql, new String[] {"id"});
				pst.setInt(1, entity.getCliente().getId());
				pst.setInt(2, entity.getRistorante().getId());
				pst.setTimestamp(3, 
						entity.getDataOrdine() == null ? 
								new Timestamp(System.currentTimeMillis()) : 
									entity.getDataOrdine());
				pst.setDouble(4, entity.getImportoTotale());
				pst.setTimestamp(5, entity.getDataRitiro());
				
				if(idValido)
					pst.setInt(6, entity.getId());

				return insertInto(pst);

			} catch (SQLException e) {
				throw new DAOException("ERRORE INSERT. Causa: "+e.getMessage());
			}
	}

	@Override
	public Ordine delete(int pk) throws DAOException {
		Ordine tuplaOld = select(pk); //recupera il Cliente prima di cancellarlo!

		String sql="DELETE FROM ORDINE WHERE id = ? ";
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

	public static void main(String[] args) throws ParseException {
		// SERVE PER TESTARE TUTTI I METODI DI QUESTO DAO!

		try {
			Cliente c = new Cliente(7, "ciarlotta87@gmail.com", "012d", "Lucia", "Contini", "Via Firenze,4", "Maracalagonis(CA)", "070789991");
			Ristorante r = new Ristorante(33, "basilio56@tiscali.it", "peb", "Da Basilio"
					, "ristorante", "Via Timavo,97"
					, "Selargius", "0709805261", null, "10:00", "23:00");
			Ordine o = new Ordine(15,c, r
					, new Timestamp(DateFormat.getDateInstance(DateFormat.SHORT).parse("02/11/2015").getTime())
					, 27.5, new Timestamp(DateFormat.getDateInstance(DateFormat.SHORT).parse("02/11/2015").getTime()) );

			DAOOrdine dao = new DAOOrdine();

			int id = dao.insert(o);
			
			System.out.println("\nCreate - insert()..: "+id+" (ID generata o meno)");

			System.out.println("\nRead - select()....: "+dao.select());
			System.out.println("\nRead - select(id)..: "+dao.select(id));

			
			System.out.println("\nDelete - delete(pk): "+dao.delete(id));
			
			System.out.println("\nRead-selectarray"+ dao.selectByRistorante(r));


		} catch (DAOException e) {
			System.out.println( e );
			e.printStackTrace();
		}

	}

	
	
	
}
