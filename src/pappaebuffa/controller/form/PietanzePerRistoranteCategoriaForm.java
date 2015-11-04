package pappaebuffa.controller.form;

public class PietanzePerRistoranteCategoriaForm extends Form {
	
	private String  categoria;
	private int idRistorante;
	
	//NON SERVE IL COSTRUTTORE: usa quello di DEFAULT della superclasse Form
	
	public String getCategoria() {
		return categoria;
	}

	public int getIdRistorante() {
		return idRistorante;
	}

	public void parametri2campiForm() {
		this.categoria = request.getParameter("categoria");
		this.idRistorante = Integer.parseInt(request.getParameter("ristorante"));
	}
	
	
	

}
