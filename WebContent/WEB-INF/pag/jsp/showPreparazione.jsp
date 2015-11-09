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

<form action="motore">
	<input type="hidden" name="azione" value="DominioPreparazioni">
	

	<c:if test="${scelta == 'aggiungi'}">
		<input type="hidden" name="scelta" value="aggiungi">
		Aggiungi elenco pietanze al tuo ristorante
		<br><br>
		<select class="form-control" name="idPietanza">
			<c:forEach var="pietanza" items="${listaPietanza}">
				<option value ="${pietanza.id}" >${pietanza.nome}</option>
			</c:forEach>
		</select><br>
		Oppure: <a href = "motore?azione=DominioCategoriaP">Aggiungi una nuova pietanza.</a>
		<br><br>
		<tr>
			<td align="right">Prezzo</td>
			<td><input type="text" name="prezzo" size="10" value=""></td>
		</tr>
		<tr><br><br>
			<td align="right">Note</td>&nbsp;&nbsp;&nbsp;
			<td><input type="text" name="note" size="10" value=""></td>
		</tr><br><br>
		
		<input class="btn btn-default" type="submit" value="Aggiungi Pietanza"> &nbsp; ${feedback}
	</c:if>


	<c:if test="${scelta == 'modifica'}">
		<input type="hidden" name="scelta" value="modifica">
		Modifica la pietanza del tuo ristorante
		<br>
		<select class="form-control" name="idPietanza">
			<c:forEach var="pietanza" items="${listaPietanza}">
				<c:forEach var="preparazione" items="${listaPreparazione}">
					<c:if test="${pietanza.id == preparazione.pietanza.id}">
								<option value ="${pietanza.id}" >${pietanza.nome} Prezzo: ${preparazione.prezzo} Note: ${preparazione.note}</option>
					</c:if>
				</c:forEach>
			</c:forEach>
		</select>
		<br><br>
		<tr>
			<td align="right">Prezzo</td>
			<td><input type="text" name="prezzo" size="10" value=""></td>
		</tr>
		<tr>
			<td align="right">Note</td>
			<td><input type="text" name="note" size="10" value=""></td>
		</tr>
		
		<input class="btn btn-default" type="submit" value="Modifica Pietanza"> &nbsp; ${feedback}
	
	</c:if>

	<c:if test="${scelta == 'cancella'}">
		<input type="hidden" name="scelta" value="cancella">
		Elenco pietanze per ristorante
		<br>
		<select class="form-control" name="idPietanza">
			<c:forEach var="pietanza" items="${listaPietanza}">
				<c:forEach var="preparazione" items="${listaPreparazione}">
					<c:if test="${pietanza.id == preparazione.pietanza.id}">
								<option value ="${pietanza.id}" >${pietanza.nome} Prezzo: ${preparazione.prezzo} Note: ${preparazione.note}</option>
					</c:if>
				</c:forEach>
			</c:forEach>
		</select>
		<br><br>
		
		<input class="btn btn-default" type="submit" value="Cancella preparazione"> &nbsp; ${feedback}
	</c:if>
	
</form>
</body>
</html>