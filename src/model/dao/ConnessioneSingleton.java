package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import model.dao.eccezioni.DAOConnessioneException;

final class ConnessioneSingleton {
	private static ConnessioneSingleton istanza;
	private Connection con;
	
	private ConnessioneSingleton() throws DAOConnessioneException {
		try {
			ResourceBundle rb = ResourceBundle.getBundle("model.info/infodb");
			
			Class.forName(rb.getString("driver"));
			
			con = DriverManager.getConnection(rb.getString("url")+"/"+rb.getString("db")
					, rb.getString("usr"), rb.getString("psw"));
			//System.out.println("\nCreo la connessione " + con);
		} catch (ClassNotFoundException | SQLException e) {
			throw new DAOConnessioneException("Errore nella connessione: " + e.getMessage());
		} catch (MissingResourceException e) {
			throw new DAOConnessioneException("Problemi con infodb.properties: " + e.getMessage());
		}
	}
	
	static ConnessioneSingleton getIstanza() throws DAOConnessioneException {
		if(istanza == null)
			istanza = new ConnessioneSingleton();
		
		return istanza;
	}

	Connection getCon() {
		return con;
	}
	
	static void close() throws SQLException {
		istanza.getCon().close();
		
		istanza = null;
	}
}
