package pappaebuffa.controller.azioni;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class MostraRistorantiPerCategoria implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		ArrayList<Ristorante> arraylistRistorante=null;
		try {
			DAORistorante dao = new DAORistorante();
			
			arraylistRistorante = dao.selectByCategoria(request.getParameter("ricerca_ristoranti"));
			request.setAttribute("arraylistRistorante",arraylistRistorante );
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//TODO restituire la stringa contente la pagina jsp
		//di destinazione
		return "ShowRistoranti.jsp";
	}




}
