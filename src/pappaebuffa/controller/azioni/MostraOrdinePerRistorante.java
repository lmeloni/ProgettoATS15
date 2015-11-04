package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class MostraOrdinePerRistorante implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
		try {
			DAOOrdine dao = new DAOOrdine();
	
			request.setAttribute("ordiniRistorante", dao.selectByRistorante(ristorante));
	
			return "showOrdiniRistorante.jsp";
		
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp"; 
		}

	}

}
