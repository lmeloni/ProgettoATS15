<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>recuperoPassword.jsp</title>
</head>
<body>
<%@ include file="_top.jsp" %>
Recupera Password
<br><br>
<form action="motore" method="post" > <input type="hidden" name="azione" value="RecuperoPassword" >
	
	Email (inserisci quella usata per la registrazione)<br>
	<input type="text" name="email" value="${RecuperoPasswordForm.email}" >
	<label style="color: red;">
		<c:forEach var="e" items="${RecuperoPasswordForm.errori}">
			<c:if test="${e.param=='email'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach>
	</label><br>
	<br>
	<input type="submit" value="   Recupera   " > &nbsp; ${RecuperoPasswordForm.feedback}
	<br><br>
	<a href="motore?azione=Vai&risorsa=registrazione.jsp" >Sei un nuovo utente? Registrati</a> <br>
</form>
</body>
</html>