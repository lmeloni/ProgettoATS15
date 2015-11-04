package pappaebuffa.controller.azioni;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
	
		ArrayList<Integer> quantita = ((ComponiOrdineForm) form).getQuantita();
		
		try {
			double totaleOrdine = 0;
			int i=0;
			
			Ristorante r = ((ComponiOrdineForm) form).getRistorante();
			
			for(Pietanza pietanza : ((ComponiOrdineForm) form).getPietanze()){
				
				Preparazione p = new DAOPreparazione().select(r.getId(), pietanza.getId());
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
				throw new DAOException("Data ritiro non valida.");
			}
			
			Ordine ordine = new Ordine(0, (Cliente) request.getSession().getAttribute("utente")
					, r, null, totaleOrdine, dataRitiro );
			
			// Inserire l'ordine nel DB, per poterne recuperare l'id autogenerato...
			int idOrdine = new DAOOrdine().insert(ordine);
			
			// Scorrere l'array di Stringhe che contiene gli id delle pietanze e, passando
			// per il DAOPietanza, costruire le associazioni fra l'ordine e le singole pietanze
			
			if(idOrdine > 0) {

				DAOAssociazione dao = new DAOAssociazione();
				
				// Bisogna settare l'id dell'ordine in qualche modo,
				// altrimenti l'insert del DAOAssociazione darà errore
				
				ordine.setId(idOrdine);
				i=0;
				
				for (Pietanza pietanza : ((ComponiOrdineForm)form).getPietanze()){
					dao.insert(new Associazione(ordine
							, new DAOPietanza().select(pietanza.getId())
							, quantita.get(i)));
					i++;
				}
			}
			
			return "ordineRiuscito.jsp";
			
		} catch (DAOException | ParseException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
