<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HomeUtente</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<c:choose>
<c:when test="${sessionScope.utente != null}">
	Benvenuto 
	<c:if test="${utente.isCliente()==false}"> <c:out value="ristoratore "/> </c:if>
	<a href="motore?azione=ProfiloUtente" >${utente.nome}</a> 
	<br><br>
	
	<c:if test="${utente.isCliente()==false}">
		<a href = "motore?azione=AggiungiPreparazionePerRistorante">Aggiungi una nuova pietanza nel "menù" del tuo locale</a><br>
		<a href = "motore?azione=ModificaPreparazione">Modifica una delle tue preparazioni esistenti</a><br>
		<a href = "motore?azione=CancellaPreparazioniPerRistorante">Cancella una delle tue preparazioni esistenti</a><br>
		<a href = "motore?azione=MostraOrdinePerRistorante">Visualizza gli ordini che ti riguardano</a><br>
	</c:if>
	
	<c:if test="${utente.isCliente()==true}">
		<form action="motore" method="post"> <input type="hidden" name="azione" value="MostraRistorantiPerCategoria" />
			
			Scegli la categoria ristorante
			<select name="categoria">
				<c:forEach var="categoria" items="${listaCategorie}">
					<option value="${categoria}">${categoria}</option>
				</c:forEach>
			</select>
			<br><br>
			<input type="submit" value="   Continua   "> 
		</form>
	</c:if>
</c:when>
<c:otherwise>ERRORE - Logout</c:otherwise>
</c:choose>
</body>
</html>