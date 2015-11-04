package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class DominioPreparazioni implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
		try {
			DAOPietanza dao = new DAOPietanza();
						
			//metto in sessione la lista preparazione aggiornata
			request.getSession().setAttribute("listaPreparazioni", dao.selectByRistorante(ristorante.getId()));
			
			return "showPreparazione.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
