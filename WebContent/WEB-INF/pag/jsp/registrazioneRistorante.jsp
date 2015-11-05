<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registrazioneRistorante</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<strong>Inizia a usare Pappa & Buffa, crea il tuo account ristorante...</strong>
<br><br>
Hai già un account? <a href="motore?azione=Vai&risorsa=login.jsp">&nbsp;Accedi</a>
<br><br>
<form action="motore" method="post" >
<input type="hidden" name="azione" value="RegistrazioneRistorante" >

<table cellpadding="3" cellspacing="3" >

	<tbody>
	<tr>
		<td align="right">(*) Categoria</td>
		<td> <select class="form-control" name="categoria">
				<c:forEach var="categoria" items="${listaCategorie}">
					<option value="${categoria}">${categoria}</option>
				</c:forEach>
			</select> </td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
	
	<tr>	
		<td align="right">(*) E-mail</td>
		<td><input type="text" size="30" name="email" value="${RegistrazioneRistoranteForm.email}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Nome</td>
		<td><input type="text" size="30" name="nome" value="${RegistrazioneRistoranteForm.nome}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Indirizzo</td>
		<td><input type="text" size="30" name="indirizzo" value="${RegistrazioneRistoranteForm.indirizzo}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='indirizzo'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Città</td>
		<td><input type="text" size="30" name="citta" value="${RegistrazioneRistoranteForm.citta}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='citta'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Telefono</td>
		<td><input type="text" size="30" name="telefono" value="${RegistrazioneRistoranteForm.telefono}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='telefono'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Orario</td>
		<td>
			<input type="text" size="4" name="orarioApertura" value="${RegistrazioneRistoranteForm.orarioApertura}">
			apertura &nbsp;&nbsp;
			<input type="text" size="4" name="orarioChiusura" value="${RegistrazioneRistoranteForm.orarioChiusura}">
			chiusura
		</td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='orarioApertura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach>
			&nbsp;&nbsp;
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='orarioChiusura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
			
	<tr>
		<td align="right">(*) Password</td>
		<td><input type="password" size="30" name="password" value="${RegistrazioneRistoranteForm.password}" ></td>
		<td><font size="2">La password deve contenere almeno 8 caratteri e almeno un numero</font>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Conferma password</td>
		<td><input type="password" size="30" name="passwordConferma" value="${RegistrazioneRistoranteForm.passwordConferma}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
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
			<input class="btn btn-default" type="submit" value="  Registrati  " >&nbsp;&nbsp;
			Hai già un account? <a href="motore?azione=Vai&risorsa=login.jsp">&nbsp;Accedi</a>
		</td>
	</tr>
	</tfoot>
</table>

</form>

</body>
</html>