package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloClienteForm;
import pappaebuffa.controller.form.AggiornaProfiloRistoranteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ristorante;

public class ProfiloRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		//recupero il ristorante (utente) dalla sessione:
		Ristorante r = (Ristorante) request.getSession().getAttribute("utente");
		
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
