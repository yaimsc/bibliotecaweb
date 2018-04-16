<!-- Navbarn para el admin -->
<%@page import="modelo.Usuario"%>
<%
Object objeto = session.getAttribute("usuario");
Usuario usuario = (Usuario) objeto; 

%>

<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="indexAdmin.jsp">Biblioteca</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="indexAdmin.jsp">Home</a></li>
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestor Libros<span class="caret"></span></a>
	      	<ul class="dropdown-menu">
	          <li><a href="listarlibros.jsp">Listar Libros</a></li>
	          <li><a href="anadirLibros.jsp">Añadir Libros</a></li>
	          <li><a href="librosEntregado.jsp">Disponibilidad de Libros</a></li>
        	</ul>
         </li>
	     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestor Usuarios<span class="caret"></span></a>
	     	<ul class="dropdown-menu">
	          <li><a href="listarusuarios.jsp">Listar Usuarios</a></li>
	          <li><a href="#">Page 1-2</a></li>
	          <li><a href="#">Page 1-3</a></li>
        	</ul>
	      </li>
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestor Prestamos<span class="caret"></span></a>
	     	<ul class="dropdown-menu">
	          <li><a href="listarprestamos.jsp">Listar Prestamos</a></li>
	          <li><a href="#">Page 1-2</a></li>
	          <li><a href="#">Page 1-3</a></li>
        	</ul>
	      </li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
     		<li><a href="#"><span class="glyphicon glyphicon-user"></span><% out.print(" " + usuario.getRol()); %></a></li>
      		<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>  Cerrar Sesion</a></li>
    	</ul>
	  </div>
	</nav>