<%@page import="modelo.Usuario"%>
<%@page import= "modelo.Libro" %>
<%@page import= "modelo.LibroModelo" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ficha Libros</title>
</head>
<body>

<%

Object objeto = session.getAttribute("usuario");
Usuario usuario = (Usuario) objeto;  


if(usuario.getRol().equals("admin")){
%> <jsp:include page= "WEB-INF/navbarAdmin.jsp"></jsp:include>
<%
}else{
%> <jsp:include page="WEB-INF/navbarUser.jsp"></jsp:include> 
<%
}
%>
<header><h1>Información del Libro</h1></header>

<section> 
<%

int id = Integer.parseInt(request.getParameter("id")); 

LibroModelo libroModelo = new LibroModelo(); 

Libro libro =  libroModelo.select(id);

%>
<div class="row">
	<div id= titulo class= "col-xs-12 col-sm-6 col-md-3 col-lg-3">
 	 	<div class="panel panel-default">
    		<div class="panel-heading">Titulo</div>
    		<div class="panel-body"><p><% out.print(libro.getTitulo()); %></p></div>
		</div>
	</div>
	<div id= autor class= "col-xs-12 col-sm-6 col-md-3 col-lg-3">
		<div class="panel panel-default">
    		<div class="panel-heading">Autor</div>
    		<div class="panel-body"><p><% out.print(libro.getAutor()); %></p></div>
		</div>
	</div>
		<img class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id=imglib src="<%=libro.getImagen()%>">
	
	

	<div id= descripcion class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-default">
    	<div class="panel-heading">Descripción</div>
    	<div class="panel-body"><p>Aqui va la descripcion del libro</p></div>
	</div>
	</div>
	
</div>	
	
</section>

</body>
</html>