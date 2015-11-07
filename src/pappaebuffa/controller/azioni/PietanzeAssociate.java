package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOAssociazione;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class PietanzeAssociate implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		int idOrdine = Integer.parseInt(request.getParameter("ordine"));
		
		try {
			request.setAttribute("associazioni", new DAOAssociazione().selectByOrdine(idOrdine));
			
			return "pietanzeAssociate.jsp";
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			
			return "errore.jsp";
		}
	}

}
