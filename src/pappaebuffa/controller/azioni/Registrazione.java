package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RegistrazioneForm;
import pappaebuffa.model.dao.DAO;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.entity.Cliente;

public class Registrazione implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		//recupera i dati dal form
		RegistrazioneForm f = (RegistrazioneForm) form;		

		//crea il cliente attraverso questi dati
		Cliente nuovoCliente = new Cliente(0, f.getNome(), f.getCognome(), f.getIndirizzo()
				, f.getCitta(), f.getTelefono(), f.getEmail(), f.getPassword());
		
		//inserire il cliente nel DB
		
		try {
			DAO<Cliente> dao = new DAOCliente();
			
			
			
		} catch (DAOConnessioneException e) {

		}
		return null;
	}

}
