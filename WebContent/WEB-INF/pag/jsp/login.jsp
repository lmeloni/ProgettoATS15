<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PeB|welcome</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<br>
<strong>${RegistrazioneForm.feedback}</strong>
<br>
<form action="motore" method="get" > <input type="hidden" name="azione" value="Login" >

<table cellpadding="5" cellspacing="5" >
	<thead>
	<tr>
		<th></th>
		<th align="left" >
			<input type="radio" name="utente" value="cliente" checked />Cliente &nbsp;
		    <input type="radio" name="utente" value="ristorante"/>Ristoratore
		</th>
	</tr>
	</thead>
	
	<tbody>
	<tr>
		<td align="right">Email</td>
		<td><input type="text" name="email" size="25" value="${LoginForm.email}"></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${LoginForm.errori}">
				<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td align="right">Password</td>
		<td><input type="password" name="password" size="25"></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small;">
			<c:forEach var="e" items="${LoginForm.errori}">
				<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach>
		</td>
	</tr>
	</tbody>
	
	<tfoot>
	<tr>
		<td></td>
		<td><input type="submit" value="      Login      "></td>
	</tr>
	<tr>
		<td></td>
		<td><a href="motore?azione=Vai&risorsa=recuperoPassword.jsp" >Password dimenticata?</a></td>
	</tr>
	<tr>
		<td></td>
		<td><a href="motore?azione=Vai&risorsa=registrazione.jsp" >Sei un nuovo utente? Registrati</a></td>
	</tr>
	</tfoot>
</table>

</form>
Per Nunzia Elisa & Laura:<br>
<a href="motore?azione=MostraPietanzePerCategoria">Pietanze per categoria</a>
<br>
<a href="motore?azione=MostraOrdinePerRistorante">MostraOrdinePerRistorante</a>

</body>
</html>
