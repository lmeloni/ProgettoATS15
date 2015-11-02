package pappaebuffa.controller.azioni;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.controller.form.PietanzePerRistoranteCategoriaForm;
import pappaebuffa.controller.form.RobertoForm;

public class PietanzePerRistoranteCategoria implements Azione{

	

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
			
			 //recupero il form relativo a questa Azione:
				PietanzePerRistoranteCategoriaForm f = (PietanzePerRistoranteCategoriaForm) form;
				
				
				//scelgo di salvare in request il Form (NB: questo passo è cmq SEMPRE svolto in Servlet!)
				request.setAttribute(f.getClass().getSimpleName(), f);
				
		
		
		
		return "PietanzePerCategoria.jsp";
	}

}
