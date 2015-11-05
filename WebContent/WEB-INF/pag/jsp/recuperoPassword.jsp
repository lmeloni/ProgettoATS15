<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>recuperoPassword</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<strong>Recupera la tua password...</strong>
<br><br>
<form action="motore" method="post" > <input type="hidden" name="azione" value="RecuperoPassword" >

<table cellpadding="5" cellspacing="5" >
	<thead>
	<tr>
		<th></th>
		<th align="left" >
			<label><input type="radio" name="utente" value="cliente" checked />Cliente</label> &nbsp;
		    <label><input type="radio" name="utente" value="ristorante"/>Ristoratore</label>
		</th>
	</tr>
	</thead>
	
	<tbody>
	<tr>
		<td align="right">Email</td>
		<td>
			<input type="text" name="email" size="25" value="${RecuperoPasswordForm.email}">
			&nbsp;(quella usata per la registrazione)
		</td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${RecuperoPasswordForm.errori}">
				<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach>
		</td>
	</tr>
	
	<tfoot>
	<tr>
		<td></td>
		<td>
			<input class="btn btn-default" type="submit" value="    Recupera    "> &nbsp;&nbsp;
			<strong>${RecuperoPasswordForm.feedback}</strong>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>Hai già un account? <a href="motore?azione=Vai&risorsa=login.jsp" >Accedi</a></td>
	</tr>
	<tr>
		<td></td>
		<td>Sei un nuovo utente? <a href="motore?azione=Vai&risorsa=registrazione.jsp" >Registrati</a></td>
	</tr>
	</tfoot>
</table>

</form>

</body>
</html>