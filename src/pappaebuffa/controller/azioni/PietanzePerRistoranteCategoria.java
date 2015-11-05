package pappaebuffa.controller.azioni;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.PietanzePerRistoranteCategoriaForm;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAOPreparazione;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;

public class PietanzePerRistoranteCategoria implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
			
		//recupero il form relativo a questa Azione:
		PietanzePerRistoranteCategoriaForm f = (PietanzePerRistoranteCategoriaForm) form;
				
		try {
			DAOPietanza daoPietanza = new DAOPietanza();
			ArrayList<Pietanza> arraylistPietanza = daoPietanza.selectByRistoranteCategoria(f.getCategoria(), f.getIdRistorante());
			
			DAOPreparazione daoPreparazione = new DAOPreparazione();
			ArrayList<Double> prezzi = new ArrayList<>();
			
			for (Pietanza pietanza : arraylistPietanza) {
				prezzi.add(daoPreparazione.select(f.getIdRistorante(), pietanza.getId()).getPrezzo());
			}
			
			request.setAttribute("ordinedatetime", request.getParameter("ordinedatetime"));
			request.setAttribute("prezzi", prezzi);
			request.setAttribute("idOrdine", request.getParameter("idOrdine"));
			request.setAttribute("totaleParziale", request.getParameter("totaleParziale"));
			request.setAttribute("pietanze", arraylistPietanza);
		
			return "pietanzePerCategoria.jsp";
					
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp"; 
		}
	}

}
