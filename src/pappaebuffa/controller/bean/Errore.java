package pappaebuffa.controller.bean;

public class Errore {
	
	private String param;
	private String errmsg;
	
	public Errore(String param, String errmsg) {
		this.param = param;
		this.errmsg = errmsg;
	}

	public String getParam() {
		return param;
	}

	public String getErrmsg() {
		return errmsg;
	}

	@Override
	public String toString() {
		return "Errore [param=" + param + ", errmsg=" + errmsg + "]";
	}
	
}
