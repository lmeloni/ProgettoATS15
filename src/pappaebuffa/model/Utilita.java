package pappaebuffa.model;

public class Utilita {
	
	public static String crittografia(){
		return null;
	}
	
	public static boolean validaEmail(String email){

		return email.matches("/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+.([a-zA-Z])+([a-zA-Z])");
	}

}
