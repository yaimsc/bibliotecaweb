
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

	<jsp:include page="WEB-INF/navbar.jsp"></jsp:include>	
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	LibroModelo libroModelo = new LibroModelo(); 
	Libro libro = libroModelo.select(id); 
	
				 %> 
				 
				 	<!-- FORMULARIO -->
	<div class= container>
	 <form class="form-horizontal" action="#" method="post">
	    <div class="form-group">
	    	<input type ="hidden"  value="<%=libro.getId()%>"> <!-- con esto pilla el valor y con getTutlo() nos deja el valor del libro -->
	      <label class="control-label col-sm-2" for="titulo">Titulo:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="titulo" value="<%=libro.getTitulo() %>" name="titulo">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="autor">Autor:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="autor" value="<%=libro.getAutor() %>" name="autor">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default" id="guardar" name="guardar">Guardar</button>
	       
	      </div>
	    </div>
	  </form>
	</div>	
	
	<%
	
	String guardar = request.getParameter("guardar");
	if(guardar != null){
		libro.setTitulo(request.getParameter("titulo"));
		libro.setAutor(request.getParameter("autor")); 
		
		//editar los datos 
		libroModelo.update(libro);

		response.sendRedirect("listarlibros.jsp"); 
		
	}
	
	
	%>
	

</body>
</html>