package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Ristorante;

public class RimuoviPreparazione implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		try {
			DAOPreparazione dao= new DAOPreparazione();
			Pietanza p = new DAOPietanza().select(1) ;
			Ristorante r = new DAORistorante().select(0);
			dao.delete(r.getId(), p.getId());
			
			return "welcome.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
