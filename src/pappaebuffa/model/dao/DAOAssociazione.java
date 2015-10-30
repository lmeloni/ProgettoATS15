package pappaebuffa.model.dao;

import java.util.ArrayList;

import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;

public class DAOAssociazione extends DAO<Associazione>{

	public DAOAssociazione() throws DAOConnessioneException {
		super();
	}

	@Override
	public ArrayList<Associazione> select() throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Associazione select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Associazione entity) throws DAOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Associazione delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] columnNames() {
		// TODO Auto-generated method stub
		return null;
	}

}
