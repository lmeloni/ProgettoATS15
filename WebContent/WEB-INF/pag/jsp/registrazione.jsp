<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
<%@ include file="_top.jsp" %>

<form action="motore" method="post" > <input type="hidden" name="azione" value="Registrazione" >

<table cellpadding="4" cellspacing="4" >
<tbody>
	Nome (*)<br>
	<input type="text" name="nome" value="${RegistrazioneForm.nome}" ><br>
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach> 
	</font><br>
	
	Cognome (*)<br>
	<input type="text" name="cognome" value="${RegistrazioneForm.cognome}" ><br>
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
		
	Email (*)<br>
	<input type="text" name="email" value="${RegistrazioneForm.email}" >
	<font size="2">L'email ti servirà per accedere.</font><br>
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
	
	Indirizzo di consegna (*)<br>
	<input type="text" name="indirizzo" value="${RegistrazioneForm.indirizzo}" ><br>
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
	
	Città (*)<br>
	<input type="text" name="citta" value="${RegistrazioneForm.citta}" ><br>
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
	
	Telefono <br>
	<input type="text" name="telefono" value="${RegistrazioneForm.telefono}" >
	<font size="2">Useremo il tuo numero per contattarti.</font><br>
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
	
	<hr>
	Password (*) <br>
	<input type="password" name="password" >
	<font size="2">La password deve contenere almeno 8 caratteri e includere numeri e lettere.</font><br>	
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
	
	Conferma password<br>
	<input type="password" name="passwordConferma" ><br>	
	<font size="2" style="color: red;" >
		<c:forEach var="e" items="${RegistrazioneForm.errori}">
			<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</font><br>
	<hr>
</table>tbody>	
	(*) Campi obbligatori
	<br><br>
	
	<input type="submit" value="   Registrati   " > &nbsp;&nbsp;
	
	Sei già registrato?	<a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a>
	
</form>

</body>
</html>
