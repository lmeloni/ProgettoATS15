<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showPreparazione</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>

	${feedback}
	<table class="table">
			<thead>
				<tr>
					<th>Pietanza </th>
					<th>Prezzo</th>
					<th>Note</th>
					<th>Azione</th>
				</tr>
			</thead>
	
			<tbody>
			
				<c:forEach var="pietanza" items="${listaPietanza}">
				<form action="motore"><input type="hidden" name="azione" value="DominioPreparazioni">
									<input type="hidden" name="scelta" value="modifica">
						<c:forEach var="preparazione" items="${listaPreparazione}">
							<c:if test="${pietanza.id == preparazione.pietanza.id}">
								<tr>
										<td><input type="hidden" name="idPietanza" value="${pietanza.id}"></td>
										<td> ${pietanza.nome} </td>
										<td><input type="text" name="prezzo" value="${preparazione.prezzo}">  </td>
										<td><input type="text" name="note" value="${preparazione.note}"> </td>
										<td> <input class="btn btn-default" type="submit" value="Modifica Pietanza"></td>
								</tr>
							</c:if>
						</c:forEach>
				</form>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>