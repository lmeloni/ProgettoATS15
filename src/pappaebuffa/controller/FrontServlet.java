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

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String pathController = "pappaebuffa.controller.";
		String pathView 	  = "/WEB-INF/pag/jsp/";
		String risorsa 		  = "errore.jsp";
		
		//CONTROLLER - Factory dei Form (con tecnica java 'reflection'):
		Form form = null;
		Class cf = null;
		try {
			cf = Class.forName(pathController+"form."+request.getParameter("azione")+"Form");
		} catch (ClassNotFoundException e) {
		} 
		
		if(cf != null){ //se il Form è stato trovato allora lo istanzia!
			try {
				form = (Form) cf.newInstance();
				//imposta attributi essenziali del Form:
				form.setRequest(request);
				form.setPagina((String)request.getSession().getAttribute("pagina"));
				form.parametri2campiForm();
				
				//salvo SEMPRE in request il form in questione (etichettato col suo nome!):
				request.setAttribute(form.getClass().getSimpleName(), form);
				
			}
			catch (InstantiationException | IllegalAccessException e) {
				request.setAttribute("errore", "ANOMALIA Factory Form: "+e.getMessage()); 
			}
		}
		
		//CONTROLLER - Factory delle azioni (con tecnica java 'reflection'):
		//se Form non presente o la sua validazione è true allora proseguo in Azione
		if(form==null || form.validazione()){ 
			Azione azione = null;
			try {
				Class ca = Class.forName(pathController+"azioni."+request.getParameter("azione"));
				azione = (Azione) ca.newInstance();
				//esegue l'Azione:
				risorsa = azione.esegui(request, form);
				
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				request.setAttribute("errore", "ANOMALIA Factory Azione: "+e.getMessage()); 
			}
		}else{
			if(! form.validazione())        //se validazione ha trovato errori
				risorsa = form.getPagina(); //rimane nella pagina da cui è partita la richiesta
		}
			

		//CONTROLLER - delega VIEW:
		getServletContext().getRequestDispatcher(pathView+risorsa).forward(request,response);
	}

}
