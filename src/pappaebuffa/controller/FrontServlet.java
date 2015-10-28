package pappaebuffa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pappaebuffa.controller.azioni.Azione;
import pappaebuffa.controller.form.Form;

@WebServlet({ "/FattoriaServlet", "/motore" })
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String path = "pappaebuffa.controller.";
		String risorsa = "errore.jsp";
		
		//CONTROLLER - Factory dei Form (con tecnica java 'reflection'):
		Form form = null;
		try {
			Class c = Class.forName(path+"form."+request.getParameter("azione")+"Form");
			form = (Form) c.newInstance();
			form.setRequest(request);
			form.setPagina((String)request.getSession().getAttribute("pagina"));
			
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			request.setAttribute("errore", "ANOMALIA Factory Form: "+e.getMessage()); 
		}
		
		//CONTROLLER - Factory delle azioni (con tecnica java 'reflection'):
		//se la validazione del Form è true allora vado in Azione
		if(form.validazione()){ 
			Azione azione = null;
			try {
				Class c = Class.forName(path+"azioni."+request.getParameter("azione"));
				azione = (Azione) c.newInstance();
				risorsa = azione.esegui(request);
				
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				request.setAttribute("errore", "ANOMALIA Factory Azione: "+e.getMessage()); 
			}
		}
		
		//CONTROLLER - delega VIEW:
		getServletContext().getRequestDispatcher("/"+risorsa).forward(request,response);
	}

}
