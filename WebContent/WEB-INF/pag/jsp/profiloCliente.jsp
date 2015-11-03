<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profiloCliente.jsp</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<hr>
<form action="motore" method="get" > <input type="hidden" name="azione" value="AggiornaProfilo" >
Email(non modificabile)<br>
	<input type="text" disabled name="email" value="${AggiornaProfiloForm.email}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Nome<br>
	<input type="text" name="nome" value="${AggiornaProfiloForm.nome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Cognome<br>
	<input type="text" name="cognome" value="${AggiornaProfiloForm.cognome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>	
Indirizzo<br>
	<input type="text" name="indirizzo" value="${AggiornaProfiloForm.indirizzo}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Città<br>
	<input type="text" name="citta" value="${AggiornaProfiloForm.citta}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Telefono<br>
	<input type="text" name="telefono" value="${AggiornaProfiloForm.telefono}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>	
Password<br>
	<input type="password" name="password" >	
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Conferma password<br>
	<input type="password" name="passwordConferma" >	
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
<br>	
<input type="submit" value="   Aggiorna   " > <br><br>
	
	
</form> 
</body>
</html>
