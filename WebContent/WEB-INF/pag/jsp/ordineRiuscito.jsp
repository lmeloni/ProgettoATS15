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
<jsp:include page="menu.jsp" />
Complimenti, il tuo ordine è stato registrato con successo!<br>Di seguito ti vengono mostrati i dettagli:<br><br>
Importo totale: ${totaleOrdine} Euro<br><br>
Pietanze:<br>
<c:forEach var="associazione" items="${associazioni}">
${associazione.pietanza.categoria}: ${associazione.pietanza.nome}<br>
</c:forEach>
</body>
</html>