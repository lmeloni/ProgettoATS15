package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class ModificaPreparazionePerRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il Ristorante (utente) dalla sessione:
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");

		try {
			DAOPietanza dao = new DAOPietanza();

			request.setAttribute("listaPietanze", dao.selectByRistorante(ristorante.getId()));
			
			return "showModificaPreparazione.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
