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
<b>Mostra Categorie pietanze per Ristorante:</b>
<br>	
<br>
<form action="motore"> 	
<input type="hidden" name="azione" value="PietanzePerRistoranteCategoria" >
<input type="hidden" name="ristorante" value="${ristorante}" >
<input type="hidden" name="idOrdine" value="${idOrdine}" >
<input type="hidden" name="totaleParziale" value="${totaleParziale}" >
<input type="hidden" name="ordinedatetime" value="${ordinedatetime}" >

<table cellpadding="5" cellspacing="5" >
	<tr>
		<td></td>
		<td>Scegli la categoria della pietanza...</td>
	</tr>
	<tr>
		<td></td>
		<td>
		<select class="form-control" name="categoria">
			<c:forEach var="categoria" items="${categorie}">
				<option value="${categoria}">${categoria}</option>
			</c:forEach>
		</select>
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