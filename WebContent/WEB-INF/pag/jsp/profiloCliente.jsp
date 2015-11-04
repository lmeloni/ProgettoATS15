<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profiloCliente</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<hr>
<form action="motore" method="get" >
<input type="hidden" name="azione" value="AggiornaProfiloCliente" >
<input type="hidden" name="id" value="${AggiornaProfiloClienteForm.id}" >
Email <br>
	<input type="text" disabled name="email" value="${AggiornaProfiloClienteForm.email}" >
	<font size="2">(Associata al profilo, impossibile modificarla)</font><br>
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	
Nome (*)<br>
	<input type="text" name="nome" value="${AggiornaProfiloClienteForm.nome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br><br>
	
Cognome (*)<br>
	<input type="text" name="cognome" value="${AggiornaProfiloClienteForm.cognome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br><br>	
	
Indirizzo (*)<br>
	<input type="text" name="indirizzo" value="${AggiornaProfiloClienteForm.indirizzo}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br><br>
	
	
Città (*)<br>
	<input type="text" name="citta" value="${AggiornaProfiloClienteForm.citta}" >
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br><br>
	
	
Telefono <br>
	<input type="text" name="telefono" value="${AggiornaProfiloClienteForm.telefono}" >
	<font size="2">Useremo il tuo numero per contattarti.</font><br>
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	
		
Password <br>
	<input type="password" name="password" >	
	<font size="2">La password deve contenere almeno 8 caratteri e includere numeri e lettere.</font><br>
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Conferma password<br>
	<input type="password" name="passwordConferma" >	
	<label style="color: red;">
		<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br><br>
(*) Campi obbligatori	
<br><br>	
<input type="submit" value="   Aggiorna   " > <br><br><br>

	
</form> 
</body>
</html>
