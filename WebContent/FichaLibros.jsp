<%@page import= "modelo.Libro" %>
<%@page import= "modelo.LibroModelo" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/estilos.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ficha Libros</title>
</head>
<body>

<header><h1>Información del Libro</h1></header>

<section> 
<%

int id = Integer.parseInt(request.getParameter("id")); 

LibroModelo libroModelo = new LibroModelo(); 

Libro libro = libroModelo.select(id);

%>
<div id= titulo>
<h3>Titulo:</h3><p><% out.print(libro.getTitulo()); %></p>
</div>
<div id= autor>
<h3>Autor:</h3><p><% out.print(libro.getAutor());  %></p>
</div>
<br>
<br>
<img id=imglib src="images/<%=libro.getId()%>.jpg">

<div id= descripcion>
<h3>Descirpcion</h3>
<p>Aqui va la descripción del libro</p>
</div>
</section>

</body>
</html>