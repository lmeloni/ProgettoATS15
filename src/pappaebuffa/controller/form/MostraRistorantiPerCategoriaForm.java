package pappaebuffa.controller.form;

public class MostraRistorantiPerCategoriaForm extends Form {

	private String categoria;
	
	@Override
	public void parametri2campiForm() {
		categoria = request.getParameter("categoria");
	}

	public String getCategoria() {
		return categoria;
	}

	@Override
	public boolean validazione() {
		// TODO Auto-generated method stub
		return true;
	}
}
