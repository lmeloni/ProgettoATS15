package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.RegistrazioneForm;
import pappaebuffa.controller.form.RegistrazioneRistoranteForm;
import pappaebuffa.model.dao.DAO;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOConnessioneException;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Ristorante;

public class RegistrazioneRistorante implements Azione {

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		// recupera i dati dal form
		
		RegistrazioneRistoranteForm r = (RegistrazioneRistoranteForm) form;
		Ristorante ristorante = new Ristorante(0, r.getEmail(), r.getPassword(), r.getNome(), 
				   r.getCategoria(), r.getIndirizzo(), r.getCitta(), r.getTelefono(),
				   r.getDescrizione(), r.getOrarioApertura(), r.getOrarioChiusura());
		
		
		try {
			DAO<Ristorante> dao = new DAORistorante();			
			dao.insert(ristorante);
			r.setFeedback("La tua registrazione è andata buon fine...Buon lavoro!");
			return "login.jsp";
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return "errore.jsp";
		}
		
		
	}		 

}
