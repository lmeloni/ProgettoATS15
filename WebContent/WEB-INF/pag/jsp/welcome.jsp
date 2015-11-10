<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pappa&Buffa</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<c:if test="${sessionScope.utente != null}">
	<jsp:forward page="homeUtente.jsp"/>
</c:if>
<br>
<h4>Siamo un servizio che offre l'opportunità ai ristoranti di  poter soddisfare con le loro specialità culinarie 
il palato anche di quella parte di clienti che preferiscono consumare altrove il proprio pasto,il cosidetto britannico "take away".
Il nostro servizio è quindi pensato per quei clienti che 
non vogliono privarsi di gustare i loro piatti preferiti anche in ufficio,in casa,all'aria aperta o
semplicemente in auto davanti a un bel tramonto. 
Come ben si sa,il cibo da asporto è sovente più economico rispetto alle stesse preparazioni servite al tavolo quindi 
vantaggio in più per il cliente..</h4>
<br>
</body>
</html>
