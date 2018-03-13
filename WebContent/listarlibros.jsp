
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroModelo"%>
<%@page import="vista.LibroVista" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	
  	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Libros</title>
</head>
<body>
	<header><h1>Lista de Libros</h1></header>

<table class = "table"> 
	<thead>
		<tr>
			<th>ID</th>
			<th>Titulo</th>
			<th>Autor</th>
		</tr>
	</thead>	

<%

LibroModelo libroModelo = new LibroModelo(); 
ArrayList<Libro> libros = libroModelo.selectAll(); 


Iterator<Libro> i = libros.iterator();
while(i.hasNext()){
	Libro libro = i.next();
	
	out.print("<tbody><tr><td>" + libro.getId() + " </td>" + "<td>" + libro.getTitulo() + "</td><td> " + libro.getAutor() + "</td><td><a href = 'FichaLibros.jsp?id=" + libro.getId() + "'>Ver</a></td></tr></tbody>"); 
	
}
%>

</table>

<a href = "añadirLibros.jsp">Añadir Libros</a>
</body>
</html>