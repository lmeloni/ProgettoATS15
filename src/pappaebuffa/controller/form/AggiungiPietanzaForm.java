package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class AggiungiPietanzaForm extends Form {

	private int id;
	private String nome;
	private String categoria;
	private String descrizione;
	
	@Override
	public void parametri2campiForm() {
		
		this.id = 0;//Integer.parseInt(super.request.getParameter("id"));
		this.nome = super.request.getParameter("nome");
		this.categoria = super.request.getParameter("categoria");
		this.descrizione = super.request.getParameter("descrizione");
		
	}

	public int getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public String getCategoria() {
		return categoria;
	}

	public String getDescrizione() {
		return descrizione;
	}
	
	@Override
	public boolean validazione() {
		
		if (nome==null || nome.isEmpty())
			super.errori.add(new Errore("nome", "obbligatorio"));
		
		return super.errori.size()==0 ? true:false;
	}
}
