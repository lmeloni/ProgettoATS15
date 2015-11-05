package pappaebuffa.controller.form;

import pappaebuffa.controller.bean.Errore;

public class AggiungiPreparazioneForm extends Form {

	private int idPietanza;
	private String prezzo;
	private String note;
	
	@Override
	public void parametri2campiForm() {
		this.idPietanza = Integer.parseInt(super.request.getParameter("idPietanza"));
		this.prezzo = super.request.getParameter("prezzo");
		this.note = super.request.getParameter("note");
	}

	public int getIdPietanza() {
		return idPietanza;
	}
	public String getPrezzo() {
		return prezzo;
	}
	public String getNote() {
		return note;
	}

	@Override
	public boolean validazione() {
		
		try {
			Double.parseDouble(request.getParameter("prezzo"));
		} catch (NumberFormatException e) {
			super.errori.add(new Errore("prezzo", "formalmente errato: solo cifre e punto decimale"));
		}
		
		return super.errori.size()==0 ? true:false;
	}
	
	

}
