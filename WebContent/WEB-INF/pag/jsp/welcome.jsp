<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PeB|welcome</title>
</head>
<body>
<%@ include file="_top.jsp" %>

<%@ include file="menu.jsp" %>

HOME PAGE PAPPAeBUFFA
<hr>

PROVA FORM:
<form action="motore"> <input type="hidden" name="azione" value="Prova" >
	
	nome <input type="text" name="nome" value="${ProvaForm.nome}" ><br>
	eta <input type="text" name="eta" value="${ProvaForm.eta}" ><br>
	<br>
	<input type="submit" value="  OK   " >
	<br>
	${ProvaForm.errori[0].errmsg}<br>
	${ProvaForm.errori[1].errmsg}<br>
</form>
<hr>
<br>
PROVA HREF:<br>
<a href="motore?azione=ProvaHref&nome=Cagliari&eta=1200" >vai con hyperlink</a>

</body>
</html>
