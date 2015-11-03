<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<strong>Inizia a usare Pappa & Buffa, crea il tuo account personale...</strong>
<br><br>
Hai già un account? <a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a>
<br><br>
<form action="motore" method="get" > <input type="hidden" name="azione" value="Registrazione" >

<table cellpadding="3" cellspacing="3" >
	<tbody>
	<tr>
		<td align="right">(*) Nome</td>
		<td><input type="text" size="30" name="nome" value="${RegistrazioneForm.nome}" ></td>
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
		<td><input type="text" size="30" name="cognome" value="${RegistrazioneForm.cognome}" ></td>
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
		<td><input type="text" size="30" name="email" value="${RegistrazioneForm.email}" ></td>
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
		<td><input type="text" size="30" name="indirizzo" value="${RegistrazioneForm.indirizzo}" ></td>
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
		<td><input type="text" size="30" name="citta" value="${RegistrazioneForm.citta}" ></td>
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
		<td><input type="text" size="30" name="telefono" value="${RegistrazioneForm.telefono}" ></td>
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
		<td align="right">(*) Password</td>
		<td><input type="text" size="30" name="password" value="${RegistrazioneForm.password}" ></td>
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
		<td align="right">(*) Conferma password</td>
		<td><input type="text" size="30" name="passwordConferma" value="${RegistrazioneForm.passwordConferma}" ></td>
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
		<td></td>
		<td>(*) campi obbligatori</td>
	</tr>	
	<tr>
		<td></td>
		<td>
			<input type="submit" value="  Registrati  " > &nbsp;
			Hai già un account? <a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a>
		</td>
	</tr>
	</tfoot>
</table>

</form>

</body>
</html>
