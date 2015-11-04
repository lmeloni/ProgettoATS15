<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profiloRistorante</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<hr>
<form action="motore" method="get" > <input type="hidden" name="azione" value="AggiornaProfiloRistorante" >
<input type="hidden" name="id" value="${AggiornaProfiloRistoranteForm.id}" >
Email(non modificabile)<br>
	<input type="text" disabled name="email" value="${AggiornaProfiloRistoranteForm.email}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Nome<br>
	<input type="text" name="nome" value="${AggiornaProfiloRistoranteForm.nome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Categoria<br>
	<input type="text" name="categoria" value="${AggiornaProfiloRistoranteForm.categoria}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='categoria'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>	
Indirizzo<br>
	<input type="text" name="indirizzo" value="${AggiornaProfiloRistoranteForm.indirizzo}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Città<br>
	<input type="text" name="citta" value="${AggiornaProfiloRistoranteForm.citta}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Telefono<br>
	<input type="text" name="telefono" value="${AggiornaProfiloRistoranteForm.telefono}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Descrizione<br>
	<input type="text" name="descrizione" value="${AggiornaProfiloRistoranteForm.descrizione}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='descrizione'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Orario apertura<br>
	<input type="text" name="orarioApertura" value="${AggiornaProfiloRistoranteForm.orarioApertura}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='orarioApertura'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Orario chiusura<br>
	<input type="text" name="orarioChiusura" value="${AggiornaProfiloRistoranteForm.orarioChiusura}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='orarioChiusura'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Password<br>
	<input type="password" name="password" >	
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Conferma password<br>
	<input type="password" name="passwordConferma" >	
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br><br>
<br>
<input type="submit" value="   Aggiorna   " > <br><br>
	
	
</form> 
</body>
</html>
