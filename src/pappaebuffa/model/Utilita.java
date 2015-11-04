package pappaebuffa.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
	
	public static boolean validaTelefono(String telefono) {
		return telefono.matches("\\+(9[976]\\d|8[987530]\\d|6[987]\\d|5[90]\\d|42\\d|3[875]\\d|"+
								"2[98654321]\\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|"+
								"4[987654310]|3[9643210]|2[70]|7|1)\\d{1,14}$");
	}
	
	public static Timestamp stringToTimestamp(String data) throws ParseException{
		
		return new Timestamp(new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(data.replace('T', ' ')).getTime());
		
	}
	
	public static Timestamp stringToTimestamp(String orario, Timestamp dataOrdine){
		
		String[] elementiOrario = orario.split(":");
		
		Timestamp nuovo = (Timestamp) dataOrdine.clone();
		
		nuovo.setHours(Integer.parseInt(elementiOrario[0]));
		nuovo.setMinutes(Integer.parseInt(elementiOrario[1]));
		
		return nuovo;
	}
	
	public static String timestampToString(Timestamp data) throws ParseException{
		return data == null ? "N.D." : new SimpleDateFormat("dd-MM-yyyy hh:mm").format(new Date(data.getTime()));
	}
	public static void main(String[] args) throws ParseException {
		System.out.println(timestampToString(stringToTimestamp("2015-11-11T15:12")));
	}
}
