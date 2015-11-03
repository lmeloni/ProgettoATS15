package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.PietanzePerRistoranteCategoriaForm;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.eccezioni.DAOException;

public class PietanzePerRistoranteCategoria implements Azione{

	

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
			
			 //recupero il form relativo a questa Azione:
				PietanzePerRistoranteCategoriaForm f = (PietanzePerRistoranteCategoriaForm) form;
				
				
				//scelgo di salvare in request il Form (NB: questo passo è cmq SEMPRE svolto in Servlet!)
			//	request.setAttribute(f.getClass().getSimpleName(), f);
				
				try {
					DAOPietanza dao = new DAOPietanza();
					
					// TODO Recuperare i dati necessari dal form... Usare questi dati
					// per selezionare le pietanze che rispettano il criterio...!
					// Queste pietanze vanno "passate" alla prossima pagina (come?)
					
					request.setAttribute("pietanze", dao.selectByRistoranteCategoria(f.getCategoria(), f.getIdRistorante()));
					
					return "PietanzePerCategoria.jsp";
				} catch (DAOException e) {
//					e.printStackTrace();
					return "errore.jsp"; // DA VERIFICARE
				}
	}

}
