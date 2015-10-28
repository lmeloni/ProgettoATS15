package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class ProvaForm extends Form {
	
	private String nome;
	private String eta;
	
	//NON SERVE IL COSTRUTTORE!!!: userà quello di DEFAULT!
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEta() {
		return eta;
	}
	public void setEta(String eta) {
		this.eta = eta;
	}
	
	@Override
	public boolean validazione() {
		
		if(nome==null || nome.isEmpty())
			errori.add(new Errore("nome", "obbligatorio"));
		
		if(eta==null || eta.isEmpty())
			errori.add(new Errore("eta", "obbligatorio"));
		
		try {Integer.parseInt(eta);} catch (NumberFormatException e) {
			errori.add(new Errore("eta", "immettere un numero!"));
		}
		
		return errori.size()==0 ? true:false;
	}
	
}
