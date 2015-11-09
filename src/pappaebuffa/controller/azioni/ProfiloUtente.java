package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloClienteForm;
import pappaebuffa.controller.form.AggiornaProfiloRistoranteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ristorante;
import pappaebuffa.model.entity.Utente;

public class ProfiloUtente implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero l'utente dalla sessione(verifica login cliente):
		Utente utente = (Utente) request.getSession().getAttribute("utente");

		if(utente==null){
			request.setAttribute("errore", "ERRORE - DEVI ESSERE LOGGATO PER ACCEDERE A QUESTA PAGINA");
			return "errore.jsp"; 
		}
		
		if(utente.isCliente()) {
			//recupero il Cliente (utente) dalla sessione:
			Cliente c = (Cliente) utente;
			
			//popolo il form che mostrerà i dati da modificare:
			AggiornaProfiloClienteForm fc = new AggiornaProfiloClienteForm(c.getId(), c.getEmail(), 
					c.getNome(), c.getCognome(), c.getIndirizzo(), 
					c.getCitta(), c.getTelefono(), c.getPassword());
			
			//salvo in sessione il form che servirà alla pagina profiloCliente
			request.setAttribute("AggiornaProfiloClienteForm", fc);
			
			return "profiloCliente.jsp";
		} else {
			//recupero il Ristorante (utente) dalla sessione:
			Ristorante r = (Ristorante) utente;
			
			//popolo il form che mostrerà i dati da modificare:
			AggiornaProfiloRistoranteForm fr = new AggiornaProfiloRistoranteForm(r.getId(), r.getEmail(), 
					r.getNome(), r.getCategoria(), r.getIndirizzo(), 
					r.getCitta(), r.getTelefono(), r.getDescrizione(), 
					r.getOrarioApertura(), r.getOrarioChiusura(), r.getPassword());
			
			//salvo in sessione il form che servirà alla pagina profiloCliente
			request.setAttribute("AggiornaProfiloRistoranteForm", fr);
			
			return "profiloRistorante.jsp";
		}
	}

}
