package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ordine;

public class EvadiOrdine implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		int idOrdine = Integer.parseInt(request.getParameter("ordine"));
		
		try {
			DAOOrdine dao = new DAOOrdine();
			Ordine ordine = dao.select(idOrdine);
			
			ordine.setEvaso(true);
			dao.update(ordine);
			
			return "ordineEvaso.jsp";
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			
			return "errore.jsp";
		}
	}

}
