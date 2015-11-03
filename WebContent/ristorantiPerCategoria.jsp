<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="motore" method="post">
	<input type="hidden" name="azione" value="MostraRistorantiPerCategoria" />
	<h3>SELEZIONA LA CATEGORIA</h3><br><hr>
<select name="categoria">
	<option value="Ristorante"> Ristorante</option>
	<option value="Pizzeria">	Pizzeria</option>
	<option value="Paninoteca"> Paninoteca</option>
	<option value="Creperia">   Creperia</option>
	<option value="Tipico">		Tipico</option>
	<option value="Cinese">		Cinese</option>
	<option value="Giapponese"> Giapponese</option>
	<option value="Messicano">  Messicano</option>
	
</select>	
	<input type="submit" value =" VAI "> 

</form>

</body>
</html>