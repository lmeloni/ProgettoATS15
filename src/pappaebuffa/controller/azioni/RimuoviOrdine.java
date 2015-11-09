package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.dao.DAOOrdine;
import pappaebuffa.model.entity.Cliente;

public class RimuoviOrdine implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		int idOrdine = Integer.parseInt(request.getParameter("ordine"));

		try {
			DAOOrdine dao = new DAOOrdine();
			request.setAttribute("annullaOrdini", dao.deleteSeNonEvaso(idOrdine));

			return "showOrdiniCliente.jsp";

		} catch (Exception e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
	}

}
