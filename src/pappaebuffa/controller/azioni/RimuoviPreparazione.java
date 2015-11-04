package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

/**
 * rimuove la tupla della tabella preparazione passando l'id pietanza e get id ristorante
 * @author Lucia ,Gianluca
 */
public class RimuoviPreparazione implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form)  {
		try {
			DAOPreparazione dao= new DAOPreparazione();
			int idPietanza = Integer.parseInt( (String) request.getParameter("idPietanza"));
			Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
			int idRistorante = ristorante.getId();
			dao.delete(idRistorante, idPietanza);
			return "welcome.jsp";
			
		} catch ( DAOException e) {
			request.setAttribute("errore", e.getMessage());
		}
			return "errore.jsp";
	}

}
