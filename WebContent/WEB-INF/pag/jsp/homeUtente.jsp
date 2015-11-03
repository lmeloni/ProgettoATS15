<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HomeCategoria</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
pagina HomeCategoria
<hr>
Benvenuto 

<c:if test="${utente.isCliente()==false}"> <c:out value="ristoratore "/> </c:if>
<a href="motore?azione=ProfiloRistorante" >${utente.nome}</a> <br>


</body>
</html>