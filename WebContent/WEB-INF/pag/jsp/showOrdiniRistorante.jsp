<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showOrdiniRistorante</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<b>Lista degli ordini:</b>
<br>
<br>
<table border="0" cellpadding="5" cellspacing="5" style="color: maroon;">
	<thead>
	<tr>
		<th>Cliente</th>
		<th>Data ordine</th>
		<th>Data ritiro</th>
		<th align="right">Importo totale</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="ordine" items="${ordiniRistorante}">
	<tr>
		<td>${ordine.cliente.nome}</td>
		<td>${ordine.dataOrdine}</td>
		<td>${ordine.dataRitiro}</td>
		<td align="right">${ordine.importoTotale}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>