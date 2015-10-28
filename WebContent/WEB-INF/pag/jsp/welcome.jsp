<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PeB|welcome</title>
</head>
<body>
<%@ include file="_top.jsp" %>
HOME PAGE PAPPAeBUFFA
<hr>
PROVA FORM:
<form action="motore">
	<input type="hidden" name="azione" value="Prova" >
	
	nome <input type="text" name="nome" value="${form.nome}" ><br>
	eta <input type="text" name="eta" value="${form.eta}" ><br>
	<input type="submit" value="  OK   " >
</form>
<hr>

Form Roberto:<br>
<form action="motore">
	<input type="hidden" name="azione" value="Roberto" >
	
	altezza <input type="text" name="altezza" value="${formRoberto.altezza}" ><br>
	bellezza <input type="text" name="bellezza" value="${formRoberto.bellezza}" ><br>
	<input type="submit" value="  VAI!!   " >
</form>
<hr>
PROVA HREF:<br>
<a href="motore?azione=ProvaHref&nome=Cagliari&eta=1200" >vai con hyperlink</a>

</body>
</html>
