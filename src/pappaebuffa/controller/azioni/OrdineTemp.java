package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class OrdineTemp implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		try {
			request.setAttribute("ristorante", request.getParameter("ristorante"));
			request.setAttribute("ordinedatetime", request.getParameter("ordinedatetime"));
			request.setAttribute("categorie", new DAOPietanza().selectCategoriaByRistorante(Integer.parseInt(request.getParameter("ristorante"))));
			request.setAttribute("idOrdine", request.getAttribute("idOrdine"));
			
			return "ordineTemp.jsp";
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
	}

}
