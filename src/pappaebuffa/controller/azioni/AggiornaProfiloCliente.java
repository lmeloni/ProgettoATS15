package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloClienteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Utente;

public class AggiornaProfiloCliente implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiornaProfiloClienteForm f = (AggiornaProfiloClienteForm) form;
		
		//recupero l'utente dalla sessione:
		Utente utente = (Utente) request.getSession().getAttribute("utente");
		
		//creo il Cliente con i NUOVI dati provenienti dal form:
		Cliente cliente = new Cliente(f.getId(), f.getEmail(), f.getPassword(), 
			f.getNome(), f.getCognome(), f.getIndirizzo(), f.getCitta(), f.getTelefono());
		
		if(utente.getId() != cliente.getId()){
			request.setAttribute("errore", "Stai cercando di modificare un profilo che non è il tuo!");
			return "errore.jsp";
		}
		
		try {
			DAOCliente dao = new DAOCliente();
			dao.update(cliente);
			
			request.getSession().setAttribute("utente", cliente);
			
			return "homeUtente.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
