package pappaebuffa.model;

public class Utilita {
	
	public static String crittografia(){
		return null;
	}
	
	public static boolean validaEmail(String email){
		return email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	}
	
	public static boolean validaPassword(String password){
		return password.matches("^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$");
	}
	
	
	
	
	
	
}
