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
<form action="motore" method="post">
	
	<input type="hidden" name="azione" value="MostraRistorantiPerCategoria" />
	<h3>SELEZIONA LA CATEGORIA</h3><br><hr>
<select name="categoria">
	<c:forEach var = "categoria" items = "${post_it}">
			<option value = "${categoria}">${categoria}</option>
		</c:forEach>
	
</select>	
	<input type="submit" value =" VAI "> 

</form>

</body>
</html>