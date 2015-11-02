package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class PietanzePerCategoriaForm extends Form {
	
	private String  categoria;
	
	//NON SERVE IL COSTRUTTORE: usa quello di DEFAULT della superclasse Form
	
	public String getCategoria() {
		return categoria;
	}

	
	public void parametri2campiForm() {
		this.categoria = super.request.getParameter("categoria");
	}
	
	@Override
	public boolean validazione() {
		
		if(nome==null || nome.isEmpty())
			super.errori.add(new Errore("nome", "obbligatorio"));
		
		if(eta==null || eta.isEmpty())
			super.errori.add(new Errore("eta", "obbligatorio"));
		
		try {Integer.parseInt(eta);} catch (NumberFormatException e) {
			super.errori.add(new Errore("eta", "immettere un numero!"));
		}
		
		return super.errori.size()==0 ? true:false; //SEMPRE!!!
	}
	

}
