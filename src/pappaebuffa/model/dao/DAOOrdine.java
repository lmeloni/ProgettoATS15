package pappaebuffa.model.dao;

import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ordine;

public class DAOOrdine extends DAO<Ordine>{

	protected DAOOrdine() throws DAOConnessioneException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<Ordine> select() throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Ordine select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Ordine entity) throws DAOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Ordine delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] columnNames() {
		// TODO Auto-generated method stub
		return null;
	}

}
