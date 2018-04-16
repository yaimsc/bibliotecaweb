<%@page import = "modelo.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Añadir Libros</title>
</head>
<body>


<%
	//para pillar el titulo y el autro introducido
	String titulo = request.getParameter("titulo"); 
	String autor = request.getParameter("autor"); 
	
		if(titulo == null || autor == null || titulo == "" || autor == ""){
			if(titulo == "" || autor == ""){
				out.print("<br><p>Error: Falta meter un parametro</p>"); 
			}
	
%>

<!-- NAVBAR -->
<jsp:include page="WEB-INF/navbarAdmin.jsp"></jsp:include>
	
	
	<h1>Añadir Libros</h1>
	
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
	        <button type="submit" class="btn btn-default" id="guardar">Submit</button>
	       
	      </div>
	    </div>
	  </form>
	</div>
<%
}else{
	
	// meter los dartos al libro
	Libro libro = new Libro(); 
	libro.setTitulo(titulo);
	libro.setAutor(autor); 
	
	//insertar los datos
	
	LibroModelo libroModelo = new LibroModelo(); 
	libroModelo.insert(libro); 
	
	//imprimir por pantalla
	
	out.print("<p>El libro se ha introducido correctamente en:  <a href = 'listarlibros.jsp'>Listar Libros</a></p>"); 
	
}
%>
</body>
</html>