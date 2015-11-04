<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profiloRistorante</title>
</head>
<body>

<%@ include file="_top.jsp" %>
<strong>Vuoi modificare il tuo profilo?</strong><br><br>

<hr>
<form action="motore" method="get" >
<input type="hidden" name="azione" value="AggiornaProfiloRistorante" >
<input type="hidden" name="id" value="${AggiornaProfiloRistoranteForm.id}" >

<table cellpadding="3" cellspacing="3" >

<tbody>

	<tr>
		<td align="right">Email</td>
		<td><input type="text" size="30" readonly name="email" value="${AggiornaProfiloRistoranteForm.email}" ></td>
		<td><font size="2">Associata al profilo, impossibile modificarla</font>
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
		<td></td>
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
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.categoria}" ></td>
		<td></td>
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
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.indirizzo}" ></td>
		<td></td>
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
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.citta}" ></td>
		<td></td>
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
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.telefono}" ></td>
		<td></td>
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
		<td align="right">Descrizione</td>
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.descrizione}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
	
	<tr>
		<td align="right">(*) Orario apertura</td>
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.orarioApertura}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='orarioApertura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Orario chiusura</td>
		<td><input type="text" size="30" name="nome" value="${AggiornaProfiloRistoranteForm.orarioChiusura}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='orarioChiusura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>

	<tr>
		<td align="right">(*) Password</td>
		<td><input type="text" size="30" name="password" ></td>
		<td></td>
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
		<td><input type="text" size="30" name="passwordConferma" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiornaProfiloRistoranteForm.errori}">
				<c:if test="${e.param=='passwordConferma'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>


<br>
<input type="submit" value="   Aggiorna   " > <br><br>
	
	
</form> 
</body>
</html>
