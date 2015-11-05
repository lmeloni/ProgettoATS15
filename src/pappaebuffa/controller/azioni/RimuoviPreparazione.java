package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class RimuoviPreparazione implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
		int idPietanza = Integer.parseInt(request.getParameter("idPietanza"));
		
		try {
			DAOPreparazione dao1 = new DAOPreparazione();
			DAOPietanza dao2 = new DAOPietanza();
			
			dao1.delete(ristorante.getId(), idPietanza);
			
			//metto in sessione la lista preparazione aggiornata
			request.getSession().setAttribute("listaPreparazioni", dao2.selectByRistorante(ristorante.getId()));
			
			request.setAttribute("feedback", "Eliminazione della pietanza effetuata");
			
			return "showPreparazione.jsp";
			
		} catch ( DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
			
	}

}
