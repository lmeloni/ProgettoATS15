<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profiloRistorante</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>

<strong>Vuoi modificare il tuo profilo?</strong>
<br><br>
<form action="motore" method="post" >
<input type="hidden" name="azione" value="AggiornaProfiloRistorante" >
<input type="hidden" name="id" value="${AggiornaProfiloRistoranteForm.id}" >

<table cellpadding="2" cellspacing="2" >

	<tbody>

	<tr>
		<td align="right">Email</td>
		<td><input type="text" size="30" disabled name="email" value="${AggiornaProfiloRistoranteForm.email}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Nome</td>
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.nome}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Categoria</td>
		<td><input type="text" size="30" name="categoria" value="${AggiornaProfiloRistoranteForm.categoria}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='categoria'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>

	<tr>
		<td align="right">(*) Indirizzo</td>
		<td><input type="text" size="30" name="indirizzo" value="${AggiornaProfiloRistoranteForm.indirizzo}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Città</td>
		<td><input type="text" size="30" name="citta" value="${AggiornaProfiloRistoranteForm.citta}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Telefono</td>
		<td><input type="text" size="30" name="telefono" value="${AggiornaProfiloRistoranteForm.telefono}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Orario</td>
		<td>
			<input type="text" size="4" name="orarioApertura" value="${AggiornaProfiloRistoranteForm.orarioApertura}">
			apertura &nbsp;&nbsp;
			<input type="text" size="4" name="orarioChiusura" value="${AggiornaProfiloRistoranteForm.orarioChiusura}">
			chiusura
		</td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='orarioApertura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='orarioChiusura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">Descrizione</td>
		<td>
			<textarea rows="3" cols="50" name="descrizione">
				${AggiornaProfiloRistoranteForm.descrizione}
			</textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>

	<tr>
		<td align="right">(*) Password</td>
		<td><input type="password" size="30" name="password" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Conferma password</td>
		<td><input type="password" size="30" name="passwordConferma" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
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
