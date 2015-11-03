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
<form action = "motore">
<input type = "hidden" name = "azione" value = "ComponiOrdine">
<input type = "hidden" name = "ristorante" value = "${PietanzePerRistoranteCategoriaForm.idRistorante}">
<input type = "hidden" name = "cliente" value = "${sessionScope.cliente.id}">
<c:forEach var = "pietanza" items = "${pietanze}">
	<label><input type = "checkbox" name = "pietanza" value = "${pietanza.id}">${pietanza.nome}</label> 
	<input type = "number" name = "quantita${pietanza.id}" min = "1" value = "1" style = "width: 50px;"><br>
</c:forEach>
<input type = "submit" value = "Ordina...">
</form>	
</body>
</html>