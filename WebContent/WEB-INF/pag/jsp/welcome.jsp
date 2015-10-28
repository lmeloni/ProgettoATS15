<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>P&B|welcome</title>
</head>
<body>
HOME PAGE PAPPA & BUFFA
<hr>
PROVA FORM:
<form action="motore">
	<input type="hidden" name="azione" value="Prova" ><br>
	<input type="text" name="nome" ><br>
	<input type="text" name="eta" ><br>
	<input type="submit" value="  OK   " >
</form>
<hr>
PROVA HREF:
<a href="motore?nome=Cagliari&eta=1200" ></a>

</body>
</html>
