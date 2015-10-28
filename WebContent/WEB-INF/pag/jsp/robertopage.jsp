<%@page import="pappaebuffa.controller.form.RobertoForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ALtezza_Bellezza</title>
</head>
<body>
Pagina di Roberto:<br>
altezza: ${formRoberto.altezza}<br>
bellezza: <%=((RobertoForm) request.getAttribute("formRoberto")).getBellezza() %>

</body>
</html>