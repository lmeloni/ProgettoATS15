<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<img src="img/pappa&buffa.jpg" width="330" height="180" title="pappa&buffa" />
<br><br>
<b>${RegistrazioneClienteForm.feedback}</b>
<b>${RegistrazioneRistoranteForm.feedback}</b>
<br><br>
<form action="motore" method="get" > <input type="hidden" name="azione" value="Login" >

<table cellpadding="5" cellspacing="5" >
	<thead>
	<tr valign="middle">
		<th align="right">Entra come</th>
		<th align="left">
			<label><input type="radio" name="utente" value="cliente" checked />Cliente</label> &nbsp;
		    <label><input type="radio" name="utente" value="ristorante"/>Ristoratore</label>
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
		<td>
			<input class="btn btn-default" type="submit" value="  Login  ">
			&nbsp;&nbsp;&nbsp;
			<a href="motore?azione=Vai&risorsa=recuperoPassword.jsp">Password dimenticata?</a>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>Sei un nuovo <b>cliente</b>?&nbsp;&nbsp;<a href="motore?azione=Vai&risorsa=registrazioneCliente.jsp">Registrati</a></td>
	</tr>
	<tr>
		<td></td>
		<td>Sei un nuovo <b>ristoratore</b>?&nbsp;&nbsp;<a href="motore?azione=DominioCategoria">Registrati</a></td>
	</tr>
	</tfoot>
</table>

</form>

</body>
</html>
