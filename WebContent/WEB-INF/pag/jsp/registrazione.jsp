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
	<tr>
		<td align="right">(*) Nome</td>
		<td><input type="text" name="nome" value="${RegistrazioneForm.nome}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Cognome</td>
		<td><input type="text" name="cognome" value="${RegistrazioneForm.cognome}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Email</td>
		<td><input type="text" name="email" value="${RegistrazioneForm.email}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Indirizzo di consegna</td>
		<td><input type="text" name="indirizzo" value="${RegistrazioneForm.indirizzo}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Città</td>
		<td><input type="text" name="citta" value="${RegistrazioneForm.citta}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">Telefono </td>
		<td><input type="text" name="telefono" value="${RegistrazioneForm.telefono}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
		
	<tr>
		<td align="right">(*) Password (*) </td>
		<td><input type="password" name="password" value="${RegistrazioneForm.password}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Conferma password </td>
		<td><input type="password" name="passwordConferma" value="${RegistrazioneForm.passwordConferma}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneForm.errori}">
				<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	
	<tfoot>
	<tr>
		<td>(*) Campi obbligatori</td>
	</tr>	
	<tr>
		<td><input type="submit" value="   Registrati   " ></td>
	</tr>
	<tr>
		<td>Sei già registrato? 
		</td>
		<td>
		<a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a></td>
	
	</tr>
	</tfoot>
</table>
</form>

</body>
</html>
