package pappaebuffa.controller.form;

import java.util.ArrayList;
import pappaebuffa.model.dao.DAOPietanza;
import pappaebuffa.model.dao.DAORistorante;
import pappaebuffa.model.dao.eccezioni.DAOException;
import pappaebuffa.model.entity.Pietanza;
import pappaebuffa.model.entity.Ristorante;

public class ComponiOrdineForm extends Form{

	private Ristorante ristorante;
	private ArrayList<Pietanza> pietanze;
	private ArrayList<Integer> quantita;
	
	
	
	public Ristorante getRistorante() {
		return ristorante;
	}



	public ArrayList<Pietanza> getPietanze() {
		return pietanze;
	}



	public ArrayList<Integer> getQuantita() {
		return quantita;
	}
	
	@Override
	public void parametri2campiForm() {
		
		try {
			this.ristorante = new DAORistorante().select(Integer.parseInt(request.getParameter("ristorante")));
			pietanze = new ArrayList<Pietanza>();
			quantita = new ArrayList<Integer>();
			
			DAOPietanza d = new DAOPietanza();
			String[] idPietanze = request.getParameterValues("pietanza");
			for(String pietanza : idPietanze) {
				int id = Integer.parseInt(pietanza);
				pietanze.add(d.select(id));
				int q = Integer.parseInt(request.getParameter("quantita"+id));
				quantita.add(q);
			}
			
		} catch (NumberFormatException | DAOException e) {
			e.printStackTrace();
		}
	}
}
