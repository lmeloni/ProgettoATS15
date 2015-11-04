package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class RecuperaCategorieRistoranti implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form)   {
		 
		try {
			DAORistorante dao = new DAORistorante();

			request.getSession().setAttribute("listaCategorie", dao.selectCategoria());
			
			return "homeUtente.jsp"; 
		
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		 
	}

}
