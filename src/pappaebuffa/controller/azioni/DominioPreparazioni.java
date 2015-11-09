package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiungiPreparazioneForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Preparazione;
import pappaebuffa.model.entity.Ristorante;

public class DominioPreparazioni implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		int idPietanza =0;
		//recupero il Ristorante (utente) dalla sessione:
		Ristorante ristorante = (Ristorante) request.getSession().getAttribute("utente");
		//recupero la scelta del ristorante 
		String scelta = request.getParameter("scelta");
		
		if(request.getParameter("idPietanza")!=null){
			idPietanza = Integer.parseInt("0"+request.getParameter("idPietanza"));
		}
			
		
		try {
			DAOPreparazione daoPreparazione= new DAOPreparazione();
			DAOPietanza daoPietanza = new DAOPietanza();
			
			//carico la lista delle pietanze aggiornate
			switch (scelta) {
			case "aggiungi":
				if(idPietanza>0){
					//recupero i parametri
					Pietanza pietanza = daoPietanza.select(idPietanza);
					double prezzo = Double.parseDouble("0"+request.getParameter("prezzo"));
					String note = ""+request.getParameter("note");
					Preparazione preparazione = new Preparazione(ristorante, pietanza, prezzo,note);
					daoPreparazione.insert(preparazione);
					request.setAttribute("feedback", "OK, pietanza aggiunta nel menù (aggiunta Preparazione)");
				}
				//metto in sessione la lista delle pietanze che non fa il ristorante
				request.getSession().setAttribute("listaPietanza", daoPietanza.selectByNotRistorante(ristorante.getId()));
				request.setAttribute("scelta", "aggiungi");
				break;
			case "modifica":
				if(idPietanza>0){
					Pietanza pietanza = daoPietanza.select(idPietanza);
					double prezzo = Double.parseDouble("0"+request.getParameter("prezzo"));
					String note = ""+request.getParameter("note");
					Preparazione preparazione = new Preparazione(ristorante, pietanza, prezzo,note);
					daoPreparazione.update(preparazione);
					request.setAttribute("feedback", "modifica alla preparazione della pietanza avvenuta con successo");
				}
				//metto in sessione la lista preparazione aggiornata
				request.getSession().setAttribute("listaPietanza", daoPietanza.selectByRistorante(ristorante.getId()));
				request.getSession().setAttribute("listaPreparazione", daoPreparazione.selectByRistorante(ristorante.getId()));
				request.setAttribute("scelta", "modifica");	
				return "modificaPreparazione.jsp";
			case "cancella":
				if(idPietanza>0){
					daoPreparazione.delete(ristorante.getId(), idPietanza);
					request.setAttribute("feedback", "OK, pietanza cancellata dal tuo menù");
				}
				//metto in sessione la lista preparazione aggiornata
				request.getSession().setAttribute("listaPietanza", daoPietanza.selectByRistorante(ristorante.getId()));
				request.getSession().setAttribute("listaPreparazione", daoPreparazione.selectByRistorante(ristorante.getId()));
				request.setAttribute("scelta", "cancella");	
				return "modificaPreparazione.jsp";
			default:
				break;
			}
			
			return "showPreparazione.jsp";
			
		} catch (DAOException | NumberFormatException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
