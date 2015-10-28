package pappabuffa.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import pappabuffa.model.dao.eccezioni.DAOConnessioneException;

class ConnessioneSingleton {
	
	private static ConnessioneSingleton istanza;
	private Connection con;
	
	private ConnessioneSingleton() throws DAOConnessioneException{
		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver"); //master class del Driver Oracle
//			con = DriverManager.getConnection
//			("jdbc:oracle:thin:@localhost:1521/orcl", "scott", "tiger");
			
			ResourceBundle rb = ResourceBundle.getBundle("model/info/infodb");
			Class.forName( rb.getString("driver") );
			con = DriverManager.getConnection
				(rb.getString("url")+"/"+rb.getString("db")
				,rb.getString("usr")
				,rb.getString("psw"));
			
		} catch (ClassNotFoundException | SQLException e) {
			throw new DAOConnessioneException
			("ERRORE CONNESSIONE AL DB! "+e.getMessage());
		} catch (MissingResourceException e){
			throw new DAOConnessioneException
			("infodb.properties SBAGLIATO! "+e.getMessage());
		}
	}

	static ConnessioneSingleton getIstanza() throws DAOConnessioneException {
		//algoritmo 'singleton':
		if(istanza==null)
			istanza = new ConnessioneSingleton();
		
		return istanza;
	}
	
	Connection getCon() {
		return con;
	}

	void chiudiCon() throws DAOConnessioneException {
		try {
			con.close();
		} catch (SQLException e) {
			throw new DAOConnessioneException
			("ERRORE chiusura connessione! Causa: "+e.getMessage());
		}
		istanza = null; //annulla questo oggetto di tipo ConnessioneSingleton
	}

}
