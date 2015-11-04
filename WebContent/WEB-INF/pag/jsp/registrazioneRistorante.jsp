<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<strong>Inizia a usare Pappa & Buffa, crea il tuo account ristorante...</strong>
<br><br>
Hai già un account? <a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a>
<br><br>
<form action="motore" method="post" > <input type="hidden" name="azione" value="RegistrazioneRistorante" >

<table cellpadding="3" cellspacing="3" >

	<tbody>
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
		<td align="right">(*) Categoria</td>
		<td><input type="text" size="30" name="categoria" value="${RegistrazioneRistoranteForm.categoria}" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='categoria'}"> <c:out value="${e.errmsg}"/> </c:if>
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
		<td align="right">Telefono </td>
		<td><input type="text" size="30" name="telefono" value="${RegistrazioneRistoranteForm.telefono}" ></td>
		<td><font size="2">Useremo il tuo numero per contattarti</font>
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
		<td><input type="password" size="30" name="passwordConferma" value="${RegistrazioneRistoranteForm.confermaPassword}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='confermaPassword'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Orario di apertura</td>
		<td><input type="text" size="30" name="orario_apertura" value="${RegistrazioneRistoranteForm.orario_apertura}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='orario_apertura'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach> 
		</td>
	</tr>
	
	<tr>
		<td align="right">(*) Orario di chiusura</td>
		<td><input type="text" size="30" name="orario_chiusura" value="${RegistrazioneRistoranteForm.orario_chiusura}" ></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RegistrazioneRistoranteForm.errori}">
				<c:if test="${e.param=='orario_chiusura'}"> <c:out value="${e.errmsg}"/> </c:if>
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