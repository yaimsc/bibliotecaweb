<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>Eliminar Libro</title>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.jsp">Biblioteca</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="index.jsp">Home</a></li>
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestor Libros<span class="caret"></span></a>
	      	<ul class="dropdown-menu">
	          <li><a href="listarlibros.jsp">Listar Libros</a></li>
	          <li><a href="anadirLibros.jsp">Añadir Libros</a></li>
	          <li><a href="#">Page 1-3</a></li>
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
     		<li><a href="#"><span class="glyphicon glyphicon-user"></span> Registrarse</a></li>
      		<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>  Iniciar Sesion</a></li>
    	</ul>
	  </div>
	</nav>

	
	<%
	
	//solicitar parametro de id
	
	int id = Integer.parseInt(request.getParameter("id")); 
	
	LibroModelo libroModelo = new LibroModelo(); 
	libroModelo.delete(id); 

	//coger titulo y autor
	Libro libro = new Libro(); 
	libro.getId(); 
	libro.getTitulo(); 
	libro.getAutor(); 
	
	response.sendRedirect("listarlibros.jsp"); 
	
	
	out.print("Se ha eliminado el libro correctamente<br>"); 

	%>
	
	<a href="listarlibros.jsp">Listar Libros</a>
</body>
</html>