package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiungiPietanzaForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Ristorante;

public class AggiungiPietanza implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiungiPietanzaForm f = (AggiungiPietanzaForm) form;
		
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
//		String nome request.getAttribute("nome" );
//		String request.getAttribute("categoria" );
//		String request.getAttribute("nome" );
		try {
			DAOPietanza daoPietanza = new DAOPietanza();
			Pietanza pietanza = new Pietanza(0, f.getNome(), f.getCategoria(), f.getDescrizione());
			
			daoPietanza.insert(pietanza);
//			daoPietanza.selectCategoria();
			request.getSession().setAttribute("listaCategorie",  daoPietanza.selectCategoria());

			request.setAttribute("scelta", "aggiungi");
			
			f.setFeedback("OK, pietanza aggiunta nel menù.");
			
			return "motore?azione=DominioPreparazioni&scelta=aggiungi";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
