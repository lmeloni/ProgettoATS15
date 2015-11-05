package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Preparazione;
import pappaebuffa.model.entity.Ristorante;

/**
 * rimuove la tupla della tabella preparazione passando l'id pietanza e get id ristorante
 * @author Lucia ,Gianluca
 */
public class ModificaPreparazione implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero i valori dalla jsp aggiungiPreparazionePerRistorante
		int idPietanza = Integer.parseInt( (String) request.getParameter("idPietanza"));
		double prezzo = Double.parseDouble( (String) "0"+request.getParameter("prezzo"));
		String note = request.getParameter("note");
		
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
		
		try {
			DAOPietanza dao1 = new DAOPietanza();
			Pietanza pietanza = dao1.select(idPietanza);
			
			Preparazione preparazione = new Preparazione(ristorante, pietanza, prezzo, note);
			
			DAOPreparazione dao2 = new DAOPreparazione();
			dao2.update(preparazione);
			
			return "homeUtente.jsp";
			
		} catch ( DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
			
	}

}
