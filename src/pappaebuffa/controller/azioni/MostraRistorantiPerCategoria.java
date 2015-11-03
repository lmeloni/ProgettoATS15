package pappaebuffa.controller.azioni;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.MostraRistorantiPerCategoriaForm;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class MostraRistorantiPerCategoria implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		try {
			MostraRistorantiPerCategoriaForm f = (MostraRistorantiPerCategoriaForm) form;
			DAORistorante dao = new DAORistorante();
			ArrayList<Ristorante> arraylistRistorante = dao.selectByCategoria(f.getCategoria());
			
			request.setAttribute("ristoranti",arraylistRistorante );
			request.setAttribute("categorie",new DAOPietanza().selectCategoria());
			
			return "ristorantiPerCategorie.jsp";
		} catch (DAOException e) {
			e.printStackTrace();
			return "errore.jsp"; // VERIFICARE SE VA BENE
		}
	}




}
