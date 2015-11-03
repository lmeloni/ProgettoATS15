<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="motore" method="post" >
	<input type="hidden" name="azione" value="PietanzePerRistoranteCategoria" />
	Seleziona il Ristorante <br />
<select name="idRistorante">
	<option value="1" >1</option>
	<option value="2" >2</option>
	<option value="3" >3</option>
</select>
<br />
	Seleziona la categoria del pasto <br />
<select name="categoria">
	<option value="Antipasto" >Antipasto</option>
	<option value="Bevande" >Bevande</option>
	<option value="Contorno" >Contorno</option>
</select>
<br />
<input type="submit" value="  VAI ALLA LISTA  "/>
</form>
<br />
<br />
	
	
	
</body>
</html>