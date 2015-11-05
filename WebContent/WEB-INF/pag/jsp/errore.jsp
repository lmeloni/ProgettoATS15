<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>errore</title>
</head>
<body bgcolor="yellow" text="red" >
<%@ include file="menu.jsp" %>
<h4>
	<b>
	${errore}
	</b>
</h4>
<br>
<a href="motore?azione=Vai&risorsa=${pagina}">indietro</a>
</body>
</html>