<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>aggiungiPietanza</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Aggiungi una pietanza al tuo menù!</b>
&nbsp;&nbsp;
<br>
<form action="motore" method="post" > <input type="hidden" name="azione" value="AggiungiPietanza" >

	<tr>
		<td align="right">(*) Nome</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<td><input type="text" size="30" name="nome" value="${AggiungiPietanzaForm.nome}" ></td>
		<td></td>
	</tr><br>
	<tr>
		<td align="right">(*) Categoria</td>
		<td><select style = "display:inline;" class="form-control" name="categoria">
			<c:forEach var="categoria" items="${listaCategorie}">
				<option value ="${categoria}" ${AggiungiPietanzaForm.categoria==categoria ? 'selected' : ''}>${categoria}</option>
			</c:forEach>
		</select></td>
	</tr><br>
	<tr>
		<td align="right">Descrizione</td>&nbsp;&nbsp;
		<td><input type="text" size="150" name="descrizione" value="${AggiungiPietanzaForm.descrizione}" ></td>
		<td></td>
		<td style="color: red; font-size: small; ">
		<c:forEach var="e" items="${AggiungiPietanzaForm.errori}">
			<c:if test="${e.param=='nome'}"> <c:out value="${e.errmsg}"/> </c:if>
		</c:forEach> 
		</td>
	</tr>
	<br>
	<input type="submit" value="Aggiungi">
	
</form>

</body>
</html>
