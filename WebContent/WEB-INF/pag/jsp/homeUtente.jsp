<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HomeUtente</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>

<c:if test="${sessionScope.utente == null}">
	<jsp:forward page="welcome.jsp"/>
</c:if>

<c:choose>

<c:when test="${sessionScope.utente == null}">
	<jsp:forward page="welcome.jsp"/>
</c:when>

<c:otherwise>
	Benvenuto <c:if test="${utente.isCliente()==false}"> <c:out value="ristoratore "/> </c:if>
	&nbsp;
	<b><a href="motore?azione=ProfiloUtente">${utente.nome}</a></b>
	<hr>
	
	<c:if test="${utente.isCliente()==false}">
		<b>Gestisci la tua attività:</b>
		<br><br>
		<a href = "motore?azione=DominioPreparazioni&scelta=aggiungi">Aggiungi una pietanza nel menù del tuo locale</a>
		<br><br>
		<a href = "motore?azione=DominioPreparazioni&scelta=modifica">Modifica una delle tue preparazioni esistenti</a>
		<br><br>
		<a href = "motore?azione=DominioPreparazioni&scelta=cancella">Cancella una delle tue preparazioni esistenti</a>
		<br><br>
		<a href = "motore?azione=MostraOrdinePerRistorante">Visualizza gli ordini che ti riguardano</a>
		<br><br>
	</c:if>
	
	<c:if test="${utente.isCliente()==true}">
		<b>Cosa vuoi mangiare?</b>
		<br><br>	
		<form action="motore" method="post"> 
			<input type="hidden" name="azione" value="MostraRistorantiPerCategoria" />
			
			<table cellpadding="5" cellspacing="5" >
				<tr>
					<td>Scegli la categoria ristorante</td>
					<td>
						<select class="form-control" name="categoria">
						<c:forEach var="categoria" items="${listaCategorie}">
							<option value="${categoria}">${categoria}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><input class="btn btn-default" type="submit" value="  Continua  "></td>
				</tr>
			</table>
		</form>
	</c:if>
</c:otherwise>

</c:choose>

</body>
</html>
