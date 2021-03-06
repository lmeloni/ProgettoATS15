package pappaebuffa.controller.form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.bean.Errore;

public abstract class Form {
	
	protected HttpServletRequest request;
	protected String pagina;
	protected String feedback;
	protected ArrayList<Errore> errori;
	
	//necessario il costruttore di DEFAULT:
	public Form(){
		errori = new ArrayList<Errore>();
	}
	
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setPagina(String pagina) {
		this.pagina = pagina;
	}
	public String getPagina() {
		return pagina;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getFeedback() {
		return feedback;
	}

	public ArrayList<Errore> getErrori() {
		return errori;
	}


	/**
	 * metodo che si occupa di validare i parametri dal form jsp
	 * da mettere in OVERRIDE nelle sottoclassi Form
	 * @return boolean (true = validazione OK | false = validazione KO)
	 */
	public boolean validazione() {
		return true;
	}
	
	/**
	 * metodo astratto che deve valorizzare tutti i campi della sottoclasse Form
	 * con i parametri della querystring presenti sulla request.
	 * NB: obbliga OVERRIDE nelle sottoclassi Form
	 */
	public abstract void parametri2campiForm();

}
