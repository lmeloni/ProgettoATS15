package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class RobertoForm extends Form {
	
	private String altezza;
	private String bellezza;

	public String getAltezza() {
		return altezza;
	}

	public String getBellezza() {
		return bellezza;
	}

	@Override
	public void parametri2campiForm()  {
		this.altezza=super.request.getParameter("altezza");
		this.bellezza=super.request.getParameter("bellezza");
	}

	@Override
	public boolean validazione() {
		
		if(altezza==null || altezza.isEmpty())
			super.errori.add(new Errore("altezza", "obbligatorio"));
		
		if(bellezza==null || bellezza.isEmpty())
			super.errori.add(new Errore("bellezza", "obbligatorio"));
		
		return super.errori.size()==0 ? true:false;
	}
	
	
	
	

}
