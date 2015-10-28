package pappaebuffa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pappaebuffa.controller.azioni.Azione;

@WebServlet({ "/FattoriaServlet", "/motore" })
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String risorsa = null;
		
		//recupera pagina JSP dalla quale proviene la richiesta:
		//request.getSession().getAttribute("pagina");

		//CONTROLLER - Factory dei Form (con tecnica java 'reflection'):
		try {
			Class c = Class.forName("pappaebuffa.controller.form."+request.getParameter("azione")+"Form");
			c.newInstance();
			
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			request.setAttribute("errore", "Factory Azione: "+e.getMessage()); 
			risorsa = "errore.jsp";
		}
		
		//CONTROLLER - Factory delle azioni (con tecnica java 'reflection'):
		Azione azione = null;
		try {
			Class c = Class.forName("pappaebuffa.controller.azioni."+request.getParameter("azione"));
			azione = (Azione) c.newInstance();
			
			risorsa = azione.esegui(request);
			
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			request.setAttribute("errore", "Factory Azione: "+e.getMessage()); 
			risorsa = "errore.jsp";
		}
		
		//CONTROLLER - delega VIEW:
		getServletContext().getRequestDispatcher("/"+risorsa).forward(request,response);
	}

}
