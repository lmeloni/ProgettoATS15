package pappaebuffa.controller.azioni;


import javax.servlet.http.HttpServletRequest;

import pappaebuffa.controller.form.Form;
import pappaebuffa.model.entity.Cliente;
import pappaebuffa.model.entity.Ordine;
import pappaebuffa.model.entity.Ristorante;

public class ComponiOrdine implements Azione{

	@Override
	public String esegui(HttpServletRequest request, Form form) {
		
		Ordine o = new Ordine(0, (Cliente) request.getAttribute("cliente"), (Ristorante) request.getAttribute("ristorante"),
				null, 0.0, null);
		return null;
	}

}
