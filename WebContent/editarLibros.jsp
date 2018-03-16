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
<title>Actualizar Libros</title>
</head>
<body>
<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.html">Biblioteca</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="index.html">Home</a></li>
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestor Libros<span class="caret"></span></a>
	      	<ul class="dropdown-menu">
	          <li><a href="listarlibros.jsp">Listar Libros</a></li>
	          <li><a href="anadirLibros.jsp">A�adir Libros</a></li>
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
	int id = Integer.parseInt(request.getParameter("id")); 
	String titulo = request.getParameter("titulo");
	String autor = request.getParameter("autor"); 
	
	%>
	
		<!-- FORMULARIO -->
	<div class= container>
	 <form class="form-horizontal" action="#" method="post">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="titulo">Titulo:</label>
	      <div class="col-sm-10">
	        <input type="input" class="form-control" id="titulo" placeholder="Introduzca titulo" name="titulo">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="autor">Autor:</label>
	      <div class="col-sm-10">          
	        <input type="input" class="form-control" id="autor" placeholder="Introduzca autor" name="autor">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default" id="guardar">Enviar</button>
	       
	      </div>
	    </div>
	  </form>
	</div>
	
	<%
	
	LibroModelo libroModelo = new LibroModelo(); 
	Libro libro = libroModelo.select(id); 
	
	//meter los datos al libro
	 
	libro.setId(id); 
	
	if( titulo == "" || autor == "" ){
		libro.getTitulo();
		libro.getAutor(); 
		}else{
			if (titulo != ""){
			libro.setTitulo(titulo);
			}
			if(autor != "")
			libro.setAutor(autor); 
			out.print("Libro correctamente actualidado<br>"); 
			out.print("Para acceder a la lista: <a href = listarlibros.jsp> Lista de Libros</a>"); 
		}

	
	//editar los datos 
	libroModelo.update(libro);
	
	
	%>
	
	

</body>
</html>