<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
  <div class="container-fluid">
  
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="motore?azione=Vai&risorsa=welcome.jsp">Pappa & buffa!</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<c:choose>
			<c:when test="${sessionScope.utente != null}">
				<li><a href="motore?azione=ProfiloUtente">Profilo <b>${utente.nome}</b></a></li>
				<li><a href="motore?azione=Logout">Esci</a></li>
				<li><a href="motore?azione=MostraOrdinePerCliente">I tuoi ordini</a></li>
				<li><a href="motore?azione=Logout">Esci</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="motore?azione=Vai&risorsa=login.jsp">Accedi | Registrati</a></li>			
			</c:otherwise>
		</c:choose>
		<li><a href='javascript:history.back();'>Indietro</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
    
  </div><!-- /.container-fluid -->
</nav>
