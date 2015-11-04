<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pietanzePerCategoria</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Fai il tuo ordine...</b>
<br><br>
<form action="motore"> <input type="hidden" name="azione" value="ComponiOrdine">

	<input type="hidden" name="ristorante" value="${PietanzePerRistoranteCategoriaForm.idRistorante}">
	<input type="hidden" name="ordinedatetime" value="${ordinedatetime}" >
	<input type="hidden" name="idOrdine" value="${idOrdine}" >
	<input type="hidden" name="totaleParziale" value="${totaleParziale}" >
	
	<c:forEach var="pietanza" items="${pietanze}" varStatus = "i">
		<label><input type="checkbox" name="pietanza" value="${pietanza.id}">${pietanza.nome}</label> 
		<input type="number" name="quantita${pietanza.id}" min="1" value="1" style="width: 50px;">
		<c:out value="${prezzi[i.index]}"/> Euro cadauno/a
		<br>
	</c:forEach>
	<br><br><br>
	<label><input type = "checkbox" name = "finalizzato"> Ho finito il mio ordine</label>
	<br><br><br>
	<input type="reset" value="   Reset  ">
	<input type="submit" value="   Ordina...  ">

</form>	


</body>
</html>