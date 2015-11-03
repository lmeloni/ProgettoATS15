package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.AggiornaProfiloForm;
import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOCliente;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ristorante;
import pappaebuffa.model.entity.Utente;

public class AggiornaProfilo implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		AggiornaProfiloForm f = (AggiornaProfiloForm) form;
		
		try {

			
			if (((Utente) request.getSession().getAttribute("utente")).isCliente()) {
				DAOCliente dao=new DAOCliente();
				Cliente c = (Cliente) request.getSession().getAttribute("cliente");
				dao.update(c);
			}
			else{
				DAORistorante dao = new DAORistorante();
				Ristorante r = (Ristorante) request.getSession().getAttribute("ristorante");
				dao.update(r);
			}
			

			
			return "MostraRistorantiPerCategoria";
			
		} catch (DAOException e) {
			return "errore.jsp";
		}
		
	}

}
