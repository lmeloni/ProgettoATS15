<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
<%@ include file="_top.jsp" %>
Azione di Fabio da solo perchè Claudia è andata via prima!
<hr>
<form action="motore" method="post" > <input type="hidden" name="azione" value="Registrazione" >

Nome<br>

	<input type="text" name="nome" value="${RegistrazioneForm.nome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br> *
Cognome *<br>

	<input type="text" name="cognome" value="${RegistrazioneForm.cognome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>	
Indirizzo<br>
* 
	<input type="text" name="indirizzo" value="${RegistrazioneForm.indirizzo}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Città<br>
*
	<input type="text" name="citta" value="${RegistrazioneForm.citta}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Telefono<br>
	<input type="text" name="telefono" value="${RegistrazioneForm.telefono}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>	
Email<br>&nbsp&nbsp<h5>L'E-MAIL TI SERVIRÀ PER ACCEDERE E NOI LA USEREMO PER CONTATTARTI.</h5>
*
	<input type="text" name="email" value="${RegistrazioneForm.email}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Password<br>&nbsp&nbsp<h5>LA PASSWORD DEVE CONTENERE TRA GLI 8 E I 25 CARATTERI E INCLUDERE LETTERE E NUMERI.</h5>
*
	<input type="password" name="password" >	
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Conferma password<br>
	<input type="password" name="passwordConferma" >	
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
<br>	
<input type="submit" value="   Registrati   " > <br><br>
Sei già registrato?	<a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a> <br>	
	
	
</form> 
</body>
</html>
