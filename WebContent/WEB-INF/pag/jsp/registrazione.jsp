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
Azione di Fabio da solo perch� Claudia � andata via prima!
<hr>
<form action="motore" method="post" > <input type="hidden" name="azione" value="Registrazione" >

Nome *<br>

	<input type="text" name="nome" value="${RegistrazioneForm.nome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach> 
	</label><br> 
Cognome *<br>

	<input type="text" name="cognome" value="${RegistrazioneForm.cognome}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>	
Indirizzo *<br>
 
	<input type="text" name="indirizzo" value="${RegistrazioneForm.indirizzo}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
Citt� *<br>

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
		</c:forEach></label>Useremo il tuo numero per contattarti.
	<br>	
Email *<br>
	<input type="text" name="email" value="${RegistrazioneForm.email}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach></label>L'e-mail ti servir� per accedere.
	<br>
Password *<br>
	<input type="password" name="password" >	
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach></label>La password deve contenere almeno 8 caratteri e includere numeri e lettere
	<br>
Conferma password<br>
	<input type="password" name="passwordConferma" >	
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>

	
<br><input type="submit" value="   Registrati   " > <br><br>(*) &nbspCampi obbligatori<br> <br>
Sei gi� registrato?	<a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a> <br>	
	
	
</form> 
</body>
</html>
