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

<hr>

<form action="motore" method="post" > <input type="hidden" name="azione" value="Registrazione" >

Nome (*)<br>
	<input type="text" name="nome" value="${RegistrazioneForm.nome}" ><br>
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach> 
	</label><br> 
	
Cognome (*)<br>
	<input type="text" name="cognome" value="${RegistrazioneForm.cognome}" ><br>
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
		
Email (*) <br>
	<input type="text" name="email" value="${RegistrazioneForm.email}" >
	<font size="2">L'e-mail ti servirà per accedere.</font><br>
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	
Indirizzo di consegna (*)<br>
	<input type="text" name="indirizzo" value="${RegistrazioneForm.indirizzo}" ><br>
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	
Città (*)<br>
	<input type="text" name="citta" value="${RegistrazioneForm.citta}" ><br>
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	
Telefono <br>
	<input type="text" name="telefono" value="${RegistrazioneForm.telefono}" >
	<font size="2">Useremo il tuo numero per contattarti.</font><br>
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach></label> 
	<br>	

Password (*) <br>
	<input type="password" name="password" >
	<font size="2">La password deve contenere almeno 8 caratteri e includere numeri e lettere.</font><br>	
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach></label>  
	<br>
	
Conferma password<br>
	<input type="password" name="passwordConferma" ><br>	
	<label style="color: red;">
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>

	
<br>(*) &nbspCampi obbligatori<br><br><input type="submit" value="   Registrati   " > <br><br> <br>
Sei già registrato?	<a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a> <br>	
	
	
</form> 
</body>
</html>
