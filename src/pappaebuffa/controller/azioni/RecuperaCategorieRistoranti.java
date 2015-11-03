package pappaebuffa.controller.azioni;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class RecuperaCategorieRistoranti implements Azione {

	 

	@Override
	public String esegui(HttpServletRequest request, Form form)   {
		 
		 try {
			 DAORistorante dao = new DAORistorante();
			 ArrayList<String> select = new ArrayList<String>();
			select = dao.selectCategoria();
			request.setAttribute("post_it", select);
			
			return "ristorantiPerCategorie.jsp";
		
		} catch (DAOException e) {
			 
			return "errore.jsp";
		}
		 
		 
	}

}
