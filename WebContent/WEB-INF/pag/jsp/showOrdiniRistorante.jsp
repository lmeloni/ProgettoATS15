<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showOrdiniRistorante</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Ordini Ristorante</b>
<hr><br>
<b>Hai ${ordiniRistorante.size()} ordini:</b>
<br>
<table border="0" cellpadding="3" cellspacing="3" >
	<thead>
	<tr style="color: white; background-color: blue;"  >
		<th>Cliente</th>
		<th>Data ordine</th>
		<th>Data ritiro</th>
		<th align="right">Importo totale</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="ordine" items="${ordiniRistorante}">
	<tr style="color: purple;">
		<td>${ordine.cliente.nome}</td>
		<td>${ordine.getDataOrdineS()}</td>
		<td>${ordine.getDataRitiroS()}</td>
		<td align="right">${ordine.importoTotale}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>