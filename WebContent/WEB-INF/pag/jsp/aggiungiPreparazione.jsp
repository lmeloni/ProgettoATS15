<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Aggiungi una pietanza alla tua preparazione </b>

<form action = "motore">
	<input type = "hidden" name = "azione" value = "AggiungiPreparazione">
		Elenco delle pietanze<br>
		<select name = "idPietanza">
			<c:forEach var = "pietanza" items = "${listaPietanze}">
				<option value ="${pietanza.id}" >${pietanza.nome}</option>
			</c:forEach>
		</select><br>
		
		Prezzo: <input type = "text" value="" name ="prezzo"><br>
		Note: <input type = "text" value="" name ="note"><br>
		<input type = "submit" value = "Aggiungi pietanza">
		
</form>
</body>
</html>