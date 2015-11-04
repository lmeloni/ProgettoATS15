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
		
		//recupero l'utente dalla sessione:
		Utente u = (Utente) request.getSession().getAttribute("utente");

		if(u.isCliente()) {
			Cliente c = (Cliente) u;
			//popolo il form che mostrerà i dati da modificare:
			AggiornaProfiloClienteForm apf = new AggiornaProfiloClienteForm(c.getId(), c.getEmail(), 
					c.getNome(), c.getCognome(), c.getIndirizzo(), 
					c.getCitta(), c.getTelefono(), c.getPassword());
			
			//salvo in sessione il form che servirà alla pagina profiloCliente
			request.setAttribute("AggiornaProfiloClienteForm", apf);
			
			
			return "profiloCliente.jsp";
		} else {
			//recupero il ristorante (utente) dalla sessione:
			Ristorante r = (Ristorante) u;
			
			//popolo il form che mostrerà i dati da modificare:
			AggiornaProfiloRistoranteForm apf = new AggiornaProfiloRistoranteForm(r.getId(), r.getEmail(), 
					r.getNome(), r.getCategoria(), r.getIndirizzo(), 
					r.getCitta(), r.getTelefono(), r.getPassword(), 
					r.getDescrizione(), r.getOrarioApertura(), r.getOrarioChiusura());
			
			//salvo in sessione il form che servirà alla pagina profiloCliente
			request.setAttribute("AggiornaProfiloRistoranteForm", apf);
			
			return "profiloRistorante.jsp";
		}
	}

}
