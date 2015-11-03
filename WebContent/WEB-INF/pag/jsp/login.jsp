<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PeB|welcome</title>
</head>
<body>
<%@ include file="_top.jsp" %>

<form action="motore" method="get" > <input type="hidden" name="azione" value="Login" >
	<input type="radio" name="utente" value="cliente" checked="checked" />Cliente &nbsp;
	<input type="radio" name="utente" value="ristorante"/>Ristoratore
	<br><br>
	Email<br>
	<input type="text" name="email" value="${LoginForm.email}" >
	<label style="color: red;">
		<c:forEach var="e" items="${LoginForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>

	Password<br>
	<input type="password" name="password" >
	<label style="color: red;">
		<c:forEach var="e" items="${LoginForm.errori}">
			<c:if test="${e.param=='password'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	<br>
	<input type="submit" value="   Login  " > 
	<br><br>
	<a href="motore?azione=Vai&risorsa=recuperoPassword.jsp" >Password dimenticata?</a> <br>
	<a href="motore?azione=Vai&risorsa=registrazione.jsp" >Sei un nuovo utente? Registrati</a> <br>
</form>

</body>
</html>
