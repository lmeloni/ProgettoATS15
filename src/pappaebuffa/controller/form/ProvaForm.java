package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class ProvaForm extends Form {
	
	private String nome;
	private String eta;
	
	//SERVE COSTRUTTORE DEFAULT!:
	//DEVE impostare tutti gli attributi coi parametri della querystring
	public ProvaForm() {
		super();
		this.nome = super.request.getParameter("nome");
		this.eta = super.request.getParameter("eta");
	}
	
	public String getNome() {
		return nome;
	}

	public String getEta() {
		return eta;
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
