<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@ include file="bootstrap.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>showOrdiniRistorante</title>
	</head>
	<body>
		<%@ include file="_top.jsp"%>
		<%@ include file="menu.jsp"%>
		<b>Ordini Ristorante</b><hr>
		<h5>Hai ${ordiniRistorante.size()} ordini, di seguito quelli non ancora evasi:</h5>
		<table class="table">
			<thead>
				<tr>
					<th>Cliente</th>
					<th>Data ordine</th>
					<th>Data ritiro</th>
					<th align="right">Importo totale</th>
					<th colspan="2"></th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach var="ordine" items="${ordiniRistorante}">
					<c:if test="${ordine.evaso==false}">
						<tr>
							<td>${ordine.cliente.nome}</td>
							<td>${ordine.getDataOrdineS()}</td>
							<td>${ordine.getDataRitiroS()}</td>
							<td align="right">${ordine.importoTotale} Euro</td>
							<td>
								<form action="motore">
									<input type="hidden" name="azione" value="PietanzeAssociate">
									<input type="hidden" name="ordine" value="${ordine.id}">
									<input type="submit" value="Vedi associazioni">
								</form>
							</td>
							<td>
								<form action="motore">
									<input type="hidden" name="azione" value="EvadiOrdine">
									<input type="hidden" name="ordine" value="${ordine.id}">
									<input type="submit" value="Evadi ordine">
								</form>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	
	</body>
</html>
