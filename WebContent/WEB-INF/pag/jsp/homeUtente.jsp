<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HomeUtente</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>

Benvenuto 
<c:if test="${utente.isCliente()==false}"> <c:out value="ristoratore "/> </c:if>
<a href="motore?azione=ProfiloUtente" >${utente.nome}</a> 
<br><br>
<c:if test="${utente.isCliente()==false}">
	<a href = "motore?azione=AggiungiPietanzaPreparazione">Aggiungi una nuova pietanza nel "menù" del tuo locale</a><br>
	<a href = "motore?azione=ModificaPreparazione">Modifica una delle tue preparazioni esistenti</a><br>
	<a href = "motore?azione=RimuoviPreparazione">Cancella una delle tue preparazioni esistenti</a><br>
	<a href = "motore?azione=MostraOrdinePerRistorante">Visualizza gli ordini che ti riguardano</a><br>
</c:if>

</body>
</html>