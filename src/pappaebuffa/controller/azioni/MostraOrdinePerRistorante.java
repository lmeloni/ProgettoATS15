package pappaebuffa.controller.azioni;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Ristorante;

public class MostraOrdinePerRistorante implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		try {
//		MostraOrdinePerRistoranteForm f=(MostraOrdinePerRistoranteForm) form;
		
		DAOOrdine dao = new DAOOrdine();
		ArrayList<Ordine> arraylistOrdine = dao.selectByRistorante((Ristorante)request.getSession().getAttribute("utente"));
		
		request.setAttribute("ordiniRistorante", arraylistOrdine);

		return "showOrdiniRistorante.jsp";
	} catch (DAOException e) {
		e.printStackTrace();
		return "errore.jsp"; // VERIFICARE SE VA BENE
	}

	}

}
