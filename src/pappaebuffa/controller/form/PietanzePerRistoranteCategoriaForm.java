package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class PietanzePerRistoranteCategoriaForm extends Form {
	
	private String  categoria;
	private int idRistorante;
	
	//NON SERVE IL COSTRUTTORE: usa quello di DEFAULT della superclasse Form
	
	public String getCategoria() {
		return categoria;
	}

	
	public int getId_ristorante() {
		return idRistorante;
	}


	public void parametri2campiForm() {
		this.categoria = super.request.getParameter("categoria");
		this.idRistorante = Integer.parseInt(super.request.getParameter("idRistorante"));
	}
	

}
