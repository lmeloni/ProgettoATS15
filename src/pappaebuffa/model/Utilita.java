package pappaebuffa.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;

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
		return password.matches("^(?=.*[a-z])(?=.*\\d)[a-zA-Z\\d]{8,}$");
	}
	
	public static Timestamp stringToTimestamp(String data) throws ParseException{
		
		return new Timestamp(DateFormat.getDateInstance(DateFormat.LONG).parse(data).getTime());
		
	}
	
	public static String timestampToString(Timestamp data) throws ParseException{
		return DateFormat.getDateInstance(DateFormat.LONG).format(new Date(data.getTime()));
		
	}
}
