<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showOrdiniRistorante</title>
</head>
<body>
<b>Lista degli ordini ${ordiniRistorante}:</b>
<br>
<br>
<table border="0" cellpadding="2" cellspacing="2" style="color:#ffffff">
	<thead>
	<tr>
		<th></th>
	</tr>
	</thead>
	
	<tbody>
	
	</tbody>



	<tr bgcolor=#808080>
		<c:forEach var="h" items="${tableH}">
			<th><c:out value="${h}"/></th>
		</c:forEach>
	</tr>
	<c:forEach var="l" items="${ordiniRistorante}" varStatus="loop">
		<tr bgcolor="${loop.index % 2 == 0 ? '#00a0a0':'#008080'}">${l}</tr>
	</c:forEach>
	
</table>
</body>
</html>