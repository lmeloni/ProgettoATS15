<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pietanze associate</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Pietanze associate</b>
<hr><br>
<table class="table">
	<thead>
	<tr >
		<th>Categoria</th>
		<th>Nome</th>
		<th>Quantità</th>
		<th></th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="associazione" items="${associazioni}">
	<tr>
		<td>${associazione.pietanza.categoria}</td>
		<td>${associazione.pietanza.nome}</td>
		<td>${associazione.quantita}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>