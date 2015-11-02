package pappaebuffa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pappaebuffa.controller.azioni.Azione;
import pappaebuffa.controller.form.Form;

@WebServlet({ "/FrontServlet", "/motore" })
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String pathController;
	
	public FrontServlet() {
		super();
		this.pathController = "pappaebuffa.controller.";
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String risorsa = "errore.jsp";
		
		
		//CONTROLLER 1) Factory dei Form (con tecnica java 'reflection'):
		Form form = null;
		try {
			form = factoryForm(request); //potrebbe restiruire null ==> Azione senza Form
			System.out.println("\nForm creato: "+form);
		}
		catch (InstantiationException | IllegalAccessException e) {
			request.setAttribute("errore", "ANOMALIA Factory Form: "+e.getMessage()); 
		}
		
		
		//CONTROLLER 2) Factory delle azioni (con tecnica java 'reflection'):
		if(form==null || form.validazione()){
		//se Form non presente o la sua validazione è true allora proseguo in Azione
			try {
				Azione azione = factoryAzione(request);
				//esegue l'Azione:
				risorsa = azione.esegui(request, form);
				
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				request.setAttribute("errore", "ANOMALIA Factory Azione: "+e.getMessage()); 
			}
		}else
			risorsa = form.getPagina(); //rimane nella pagina da cui è partita la richiesta


		//CONTROLLER 3) Delega risorsa VIEW:
		String pathView = "/"; 
		if(risorsa.endsWith(".jsp")) //se pagina JSP
			pathView += "WEB-INF/pag/jsp/";
		
		getServletContext().getRequestDispatcher(pathView+risorsa).forward(request,response);
	
	} //fine metodo service(...) ==> fa la RESPONSE verso il client !!!


	private Form factoryForm(HttpServletRequest request) throws InstantiationException, IllegalAccessException {
		
		Form form = null;
		Class cf = null;
		try {
			cf = Class.forName(pathController+"form."+request.getParameter("azione")+"Form");
		} catch (ClassNotFoundException e) {
			//VOLUTAMENTE non gestisco l'eccezione e vado avanti!
			//significa che l'Azione NON prevede il Form
		} 
		
		if(cf != null){ //se il Form è stato trovato nel package allora lo istanzia!
			form = (Form) cf.newInstance();
			//imposta attributi essenziali del Form:
			form.setRequest(request);
			form.setPagina((String)request.getSession().getAttribute("pagina"));
			form.parametri2campiForm(); //valorizza attributi Form coi parametri JSP
			
			//a fini di validazione salvo SEMPRE in request il form in questione 
			//NB: etichettato col suo nome!
			request.setAttribute(form.getClass().getSimpleName(), form);
		}
		return form;
	}


	private Azione factoryAzione(HttpServletRequest request) throws ClassNotFoundException, InstantiationException, IllegalAccessException{

		Class ca = Class.forName(pathController+"azioni."+request.getParameter("azione"));
		
		return (Azione) ca.newInstance();
	}
	
}
