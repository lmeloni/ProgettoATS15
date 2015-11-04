package pappaebuffa.controller.azioni;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;

import pappaebuffa.model.entity.Ristorante;

public class ModificaPreparazionePerRistorante implements Azione {


	@Override
	public String esegui(HttpServletRequest request, Form form) {
		ArrayList<Pietanza> listaPietanze =null;
		try {
			listaPietanze= new DAOPietanza()
			.selectByRistorante(((Ristorante)request.getSession().getAttribute("utente")).getId());
			request.setAttribute("listaPietanze", listaPietanze);
		} catch (DAOConnessioneException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "showModificaPreparazione.jsp";
	}

}
