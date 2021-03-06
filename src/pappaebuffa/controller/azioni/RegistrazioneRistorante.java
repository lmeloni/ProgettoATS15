package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RegistrazioneRistoranteForm;
import pappaebuffa.model.dao.DAO;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class RegistrazioneRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {

		//recupera i dati dal form
		RegistrazioneRistoranteForm f = (RegistrazioneRistoranteForm) form;
		
		Ristorante ristorante = new Ristorante(0, f.getEmail(), f.getNome(), f.getPassword(), 
				   f.getCategoria(), f.getIndirizzo(), f.getCitta(), f.getTelefono(),
				   f.getDescrizione(), f.getOrarioApertura(), f.getOrarioChiusura());
		
		try {
			DAO<Ristorante> dao = new DAORistorante();			
			dao.insert(ristorante);
			
			f.setFeedback("La tua registrazione � andata buon fine... Buon lavoro!");
			
			return "login.jsp";
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
	}		 

}
