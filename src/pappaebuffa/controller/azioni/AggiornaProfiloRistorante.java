package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloRistoranteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;
import pappaebuffa.model.entity.Utente;

public class AggiornaProfiloRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiornaProfiloRistoranteForm f = (AggiornaProfiloRistoranteForm) form;
		
		//creo il Ristorante con i NUOVI dati provenienti dal form:
		Ristorante ristorante = new Ristorante(f.getId(), f.getEmail(), f.getPassword(), 
			f.getNome(), f.getCategoria(), f.getIndirizzo(), f.getCitta(), f.getTelefono(),
			f.getDescrizione(), f.getOrarioApertura(), f.getOrarioChiusura());
		
		try {
			if(ristorante.getId() != ((Utente) request.getSession().getAttribute("utente")).getId())
				throw new DAOException("Stai cercando di modificare un profilo che non è il tuo!");
			DAORistorante dao = new DAORistorante();
			dao.update(ristorante);
			
			request.getSession().setAttribute("utente", ristorante);
			
			return "homeUtente.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}

}
