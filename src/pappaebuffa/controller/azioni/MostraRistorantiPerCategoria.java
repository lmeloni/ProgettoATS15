package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.MostraRistorantiPerCategoriaForm;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class MostraRistorantiPerCategoria implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		MostraRistorantiPerCategoriaForm f = (MostraRistorantiPerCategoriaForm) form;
		try {
			request.setAttribute("ristoranti", new DAORistorante().selectByCategoria(f.getCategoria()));
			
			
			return "showRistoranti.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp"; 
		}
	}




}
