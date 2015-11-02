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

FORM LOGIN:
<form action="motore">
	<input type="hidden" name="azione" value="Login" >
	
	EMAIL <input type="text" name="email" value="${LoginForm.email}" ><br>
	PASSWORD <input type="text" name="password" value="${LoginForm.password}" ><br>
	<input type="submit" value="   LOGIN   " >
</form>
<hr>

PROVA HREF:<br>
<a href="motore?azione=ProvaHref&nome=Cagliari&eta=1200" >vai con hyperlink</a>

</body>
</html>
