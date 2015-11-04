<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showRistoranti</title>
</head>
<body>
<b>Mostra Ristoranti per Categoria:</b>
<br>	
<br>
<form action="motore"> 	<input type="hidden" name="azione" value="PietanzePerRistoranteCategoria" >

	Scegli il ristorante...<br>
	<select name="ristorante">
		<c:forEach var="ristorante" items="${ristoranti}">
			<option value="${ristorante.id}">${ristorante.nome}</option>
		</c:forEach>
	</select>
	<br>
	Scegli la categoria della pietanza...<br>
	<select name="categoria">
		<c:forEach var="categoria" items="${categorie}">
			<option value="${categoria}">${categoria}</option>
		</c:forEach>
	</select>
	<br><br>
	<input type="submit" value="   Scegli...  ">
</form>
</body>
</html>