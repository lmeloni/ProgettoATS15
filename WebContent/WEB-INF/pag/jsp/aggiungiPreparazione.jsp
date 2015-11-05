<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>aggiungiPreparazione</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<b>Aggiungi una pietanza al tuo menù</b>
<br><br>
<form action="motore"> 
	<input type="hidden" name="azione" value="AggiungiPreparazione">
	
	<table>
	<tr>
		<td align="right">Scegli la pietanza</td>
		<td>
			<select class="form-control" name="idPietanza">
			<c:forEach var="pietanza" items="${listaPietanze}">
				<option value="${pietanza.id}" ${AggiungiPreparazioneForm.idPietanza == pietanza.id ? 'selected':''}>
					${pietanza.categoria} -- ${pietanza.nome}
				</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	
	<tr>
		<td align="right">Prezzo</td>
		<td><input type="text" name="prezzo" size="10" value="${AggiungiPreparazioneForm.prezzo}"></td>
	</tr>
	<tr>
		<td></td>
		<td style="color: red; font-size: small; ">
			<c:forEach var="e" items="${AggiungiPreparazioneForm.errori}">
				<c:if test="${e.param=='prezzo'}"> <c:out value="${e.errmsg}"/> </c:if>
			</c:forEach>
		</td>
	</tr>
	
	<tr>
		<td align="right">Note</td>
		<td><input type="text" name="note" size="50" value="${AggiungiPreparazioneForm.note}"></td>
	</tr>
	
	<tr>
		<td></td>
		<td>
			<input class="btn btn-default" type="submit" value=" Aggiungi pietanza ">
			&nbsp;&nbsp;
			<b>${AggiungiPreparazioneForm.feedback}</b>
		</td>	
	</tr>
	</table>
</form>

</body>
</html>