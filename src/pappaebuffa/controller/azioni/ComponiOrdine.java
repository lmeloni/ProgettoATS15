package pappaebuffa.controller.azioni;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.ComponiOrdineForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.Utilita;
import pappaebuffa.model.dao.DAOAssociazione;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Associazione;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Preparazione;
import pappaebuffa.model.entity.Ristorante;

public class ComponiOrdine implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il form in questione:
		ComponiOrdineForm cof = (ComponiOrdineForm) form;
	
		ArrayList<Integer> quantita = cof.getQuantita();
		Ristorante r = cof.getRistorante();
		
		int i=0;
		double totaleOrdine = 0;
		if(request.getParameter("totaleParziale") != null && !request.getParameter("totaleParziale").isEmpty())
			totaleOrdine = Double.parseDouble(request.getParameter("totaleParziale"));
		
		try {
			DAOPreparazione daop = new DAOPreparazione();
			
			for(Pietanza pietanza : cof.getPietanze()){
				Preparazione p = daop.select(r.getId(), pietanza.getId());
				totaleOrdine += p.getPrezzo() * quantita.get(i);
				i++;
			}
			
			Timestamp dataRitiro = Utilita.stringToTimestamp(request.getParameter("ordinedatetime"));
			Timestamp dataAttuale = new Timestamp(new Date().getTime());
			Timestamp orarioApertura = Utilita.stringToTimestamp(r.getOrarioApertura(), dataRitiro);
			Timestamp orarioChiusura = Utilita.stringToTimestamp(r.getOrarioChiusura(), dataRitiro);

			if (dataRitiro == null || dataRitiro.compareTo(dataAttuale) < 0 
					|| orarioApertura.compareTo(dataRitiro) > 0 
					|| orarioChiusura.compareTo(dataRitiro) < 0){
				throw new DAOException("Data ritiro non valida!");
			}
			
			String ordineEsistente = request.getParameter("idOrdine");
			Ordine ordine = null;
			int idOrdine = 0;
			
			if(ordineEsistente != null && !ordineEsistente.isEmpty()) {
				idOrdine = Integer.parseInt(ordineEsistente);
				ordine = new DAOOrdine().select(idOrdine);
			}else {
				Cliente cliente = (Cliente) request.getSession().getAttribute("utente");
				ordine = new Ordine(0, cliente, r, null, totaleOrdine, dataRitiro, false);
				//inserire l'ordine nel DB, per poterne recuperare l'id autogenerato...
				idOrdine = new DAOOrdine().insert(ordine);
			}
			
			// Scorrere l'array di Stringhe che contiene gli id delle pietanze e, passando
			// per il DAOPietanza, costruire le associazioni fra l'ordine e le singole pietanze
			
			if(idOrdine > 0) {

				DAOAssociazione dao = new DAOAssociazione();
				
				//Bisogna settare l'id dell'ordine in qualche modo,
				//altrimenti l'insert del DAOAssociazione darà errore
				
				ordine.setId(idOrdine);
				i=0;
				
				for (Pietanza pietanza : cof.getPietanze()){
					dao.insert(new Associazione(ordine
							, new DAOPietanza().select(pietanza.getId())
							, quantita.get(i)));
					i++;
				}
			}
			
			String finalizzato = request.getParameter("finalizzato");
			
			if(finalizzato != null && finalizzato.equalsIgnoreCase("on")) {
				request.setAttribute("totaleOrdine", totaleOrdine);
				request.setAttribute("associazioni", new DAOAssociazione().selectByOrdine(idOrdine));
				return "ordineRiuscito.jsp";
			}else{
				request.setAttribute("totaleParziale", totaleOrdine);
				request.setAttribute("idOrdine", idOrdine);
				return "motore?azione=OrdineTemp";
			}
			
		} catch (DAOException | ParseException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
