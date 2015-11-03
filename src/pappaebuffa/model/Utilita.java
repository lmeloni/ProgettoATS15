package pappaebuffa.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Utilita {
	
	public static String crittografia(String password){
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes("UTF-8"));
			return new String(md.digest());
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
//			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean validaEmail(String email){
		return email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	}
	
	public static boolean validaPassword(String password){
		return password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$");
	}
}
