<%
//salvo sempre in session il nome della pagina JSP:
String pagina = page.getClass().getSimpleName();
session.setAttribute("pagina", pagina.replace('_','.'));
%>
