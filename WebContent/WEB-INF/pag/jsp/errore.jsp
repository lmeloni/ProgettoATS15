<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>errore</title>
</head>
<%
//recupera la pagina a cui tornare:
String pagina = (String)session.getAttribute("pagina");
%>
<body bgcolor="yellow" text="red" >
<%@ include file="menu.jsp" %>
<h4>
	<b>
	Oooppsss.. qualcosa è andato storto:<br>
	${errore}
	</b>
</h4>
<br><br>
<a href="motore?azione=Vai&risorsa=${pagina}">indietro</a>
</body>
</html>