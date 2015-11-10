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
<h4>Siamo "Pappa & buffa!" e offriamo un servizio che permette ai ristoranti di poter soddisfare con le loro
specialità culinarie, anche i palati di coloro che preferiscono non essere vincolati a rimanere seduti al
tavolo di un ristorante, ma sfruttare la filosofia "take away".
<br>
<br>
Puoi gustarti i tuoi piatti preferiti in ufficio, a casa, all'aria aperta e persino in auto davanti a un bel 
tramonto.
<br>
<br>
Eh allora ordina, pappa e buffa!
</h4>
<br>
<br>
<hr>
<br>
<br>
Seusu "Pappa e buffa" e permitteusu ai ristorantisi de soddisfai cun is propriasa
 specialidadis de coxina s'appetitu de cussusu ca no ollinti abarrai sezziusu in sa mesa de su 
 ristoranti,ma sfruttai sa filosofia "piga e pappa".
<br>
<br>
Porisi pappai in su traballu, a dommu, in sa ia, in sa macchina e finzasa in sa lettorina.
<br>
<br>
E inzandusu piga,pappa, buffa e cittidia!
</body>
</html>
