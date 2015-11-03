package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloClienteForm;
import pappaebuffa.controller.form.AggiornaProfiloRistoranteForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ristorante;

public class AggiornaProfiloRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiornaProfiloRistoranteForm f = (AggiornaProfiloRistoranteForm) form;
		
		//creo il Ristorante con i NUOVI dati provenienti dal form:
		Ristorante ristorante = new Ristorante(f.getId(), f.getEmail(), f.getPassword(), 
			f.getNome(), f.getCategoria(), f.getIndirizzo(), f.getCitta(), f.getTelefono()
			, f.getDescrizione(), f.getOrarioApertura(), f.getOrarioChiusura());
		
		try {
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
