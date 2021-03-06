<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modelo.Usuario"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <%
  Object objeto = session.getAttribute("usuario");
  Usuario usuario = (Usuario) objeto; 
  %>

<meta charset="ISO-8859-1">
<title>Biblioteca</title>
</head>
<body>
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
	          <li><a href="anadirLibros.jsp">A�adir Libros</a></li>
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
	<aside>
		<div class = aside>
		<div class="panel panel-primary">
      		<div class="panel-heading"><h3>Localizaci�n:</h3></div>
      		<div class="panel-body">
      		<p>Nos puedes encontrar en Portuetexe Kalea, 39, en le barrio de Igara<br></p>
			<p>20008, Donostia-San Sebasti�n</p>
			</div>
    	</div>
		<div class="panel panel-primary">
      		<div class="panel-heading"><h3>Horario:</h3></div>
      		<div class="panel-body">
      		<p>Lunes a Viernes de 8: 30 a 20:30<br></p>
			<p>S�bado, de 8:30 a 14:30<br></p>
			<p>S�bado tarde y Domingo cerrado</p>
			</div>
    	</div>	
		</div>
	</aside>
	<section>
	  <div class ="well">Noticias de la Biblioteca</div>
    
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		      <div class="item active">
		        <img src="images/lib10.jpg" alt="Los Angeles" style="width:100%;">
		      </div>
		
		      <div class="item">
		        <img src="images/lib2.jpg" alt="Chicago" style="width:100%;">
		      </div>
		    
		      <div class="item">
		        <img src="images/vh3.jpg" alt="New york" style="width:100%;">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
		
	</section>
	<footer>
	 <div class ="well well-lg" id="footer">Biblioteca de Donostia-San Sebastian</div>
	</footer>

</body>
</html>