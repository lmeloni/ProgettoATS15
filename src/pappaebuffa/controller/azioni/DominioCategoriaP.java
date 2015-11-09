package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Utente;

public class DominioCategoriaP implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form)   {
		 
		try {
			DAOPietanza dao = new DAOPietanza();

			request.getSession().setAttribute("listaCategorie", dao.selectCategoria());
//			Utente u = (Utente) request.getSession().getAttribute("utente");
//			
//			if(u==null)
//				return "registrazioneRistorante.jsp";
//			else
//				return "homeUtente.jsp"; 
			return "aggiungiPietanza.jsp";
		
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		 
	}

}
