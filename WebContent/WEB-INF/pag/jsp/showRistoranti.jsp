<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showRistoranti</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Mostra Ristoranti per Categoria:</b>
<br>	
<br>
<form action="motore">
<input type="hidden" name="azione" value="OrdineTemp" >

<table cellpadding="5" cellspacing="5" >
	<tr>
		<td>Scegli il ristorante...</td>
		<td></td>
	</tr>
	<tr>
		<td>
		<select class="form-control" name="ristorante">
			<c:forEach var="ristorante" items="${ristoranti}">
				<option value="${ristorante.id}">${ristorante.nome}</option>
			</c:forEach>
		</select>
		</td>
		<td>
			<label>Quando vuoi ritirare l'ordine? 
				<input type="datetime-local" name="ordinedatetime">
			</label><br>
		</td>
	</tr>
	<tr height="100" >
		<td><input class="btn btn-default" type="submit" value="   Scegli...  "></td>
		<td></td>
	</tr>
</table>

</form>

</body>
</html>