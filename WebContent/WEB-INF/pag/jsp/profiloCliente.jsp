<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profiloCliente</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>

<strong>Vuoi modificare il tuo profilo?</strong>
<br><br>
<form action="motore" method="post" >
<input type="hidden" name="azione" value="AggiornaProfiloCliente" >
<input type="hidden" name="id" value="${AggiornaProfiloClienteForm.id}" >

<table cellpadding="2" cellspacing="2" >

	<tbody>
	
	<tr>
		<td align="right">Email</td>
		<td><input type="text" size="30" readonly name="email" value="${AggiornaProfiloClienteForm.email}" ></td>
		<td style="font-size: small;">Associata al profilo, impossibile modificarla</td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small;">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Nome</td>
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloClienteForm.nome}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Cognome</td>
		<td><input type="text" size="30" name="cognome" value="${AggiornaProfiloClienteForm.cognome}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='cognome'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>	
	
	<tr>
		<td align="right">(*) Indirizzo di consegna</td>
		<td><input type="text" size="30" name="indirizzo" value="${AggiornaProfiloClienteForm.indirizzo}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Città</td>
		<td><input type="text" size="30" name="citta" value="${AggiornaProfiloClienteForm.citta}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>	
	
	<tr>
		<td align="right">Telefono </td>
		<td><input type="text" size="30" name="telefono" value="${AggiornaProfiloClienteForm.telefono}" ></td>
		<td style="font-size: small;">Useremo il tuo numero per contattarti</td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Password</td>
		<td><input type="password" size="30" name="password"></td>
		<td style="font-size: small;">La password deve contenere almeno 8 caratteri e almeno un numero</td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Conferma password</td>
		<td><input type="password" size="30" name="passwordConferma"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloClienteForm.errori}">
				<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	</tbody>
	
	<tfoot>
	<tr>
		<td></td>
		<td>(*) campi obbligatori</td>
	</tr>	
	<tr>
		<td></td>
		<td><input type="submit" value="  Aggiorna  " ></td>
	</tr>
	</tfoot>
</table>

	
</form> 
</body>
</html>
