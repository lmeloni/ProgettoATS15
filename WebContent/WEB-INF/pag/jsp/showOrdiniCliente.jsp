<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showOrdiniCliente</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Ordini Cliente</b>
<hr><br>
<b>Hai ${ordiniCliente.size()} ordini:</b>
<br>

<table class="table">
	
	<thead>
	<tr >
		<th>Ristorante</th>
		<th>Data ordine</th>
		<th>Data ritiro</th>
		<th align="right">Importo totale</th>
	</tr>
	</thead>
	
	<tbody>
		
		
			<c:forEach var="ordine" items="${ordiniCliente}">
				<tr>
					<td>${ordine.ristorante.nome}</td>		
					<td>${ordine.getDataOrdineS()}</td>
					<td>${ordine.getDataRitiroS()}</td>
					<td align="right">${ordine.importoTotale}</td>
					<form action="motore" method="post">
						<c:if test="${ordine.evaso==true}">
						<td><input class="btn btn-default" type="submit" value="  Elimina Ordine  "></td>
					</c:if>
						<input type="hidden" name="azione" value="RimuoviOrdine" />
						<input type="hidden" name="ordine" value="${ordine.id}">
					</form>
				</tr>
			</c:forEach>
		
	</tbody>
</table>


</body>
</html>