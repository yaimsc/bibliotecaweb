<%@page import="modelo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Prestamo"%>
<%@page import="modelo.PrestamoModelo"%>
<%@page import="modelo.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.LibroModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	LibroModelo libroModelo = new LibroModelo(); 
    PrestamoModelo prestamoModelo = new PrestamoModelo();
	ArrayList<Libro> libros = libroModelo.selectAll(); 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/estilos.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Disponibilidad de Libros</title>
</head>
<body>

<%

Object objeto = session.getAttribute("usuario"); 
Usuario usuario = (Usuario) objeto; 

if(usuario.esAdmin()){
%> <jsp:include page="WEB-INF/navbarAdmin.jsp"></jsp:include> <%	
}else{
%> <jsp:include page="WEB-INF/navbarUser.jsp"></jsp:include> <%
}
%>

<h1>Libros Disponibles</h1>

<table class = "table"> 
	<thead>
		<tr>
			<th>ID</th>
			<th>Titulo</th>
			<th>Autor</th>
			<th>Disponibilidad<th>
		</tr>
	</thead>
	<tbody>
<%

	
	Iterator<Libro> i = libros.iterator(); 
	Libro libro; //recorrer los libros
		while(i.hasNext()){
			libro = i.next(); 
			//libro.setPrestamos(prestamoModelo.prestamosDelLibro(libro));
			out.print("<tr>");
			out.print("<td>" + libro.getId() + "</td><td>" + libro.getTitulo() + "</td><td>" + libro.getAutor() + "</td>"); //sacar por pantalla
			
		if(prestamoModelo.estaDisponible(libro)){ //mirar si esta entregado o no y sacarlo por pantalla
			out.print("<td class = 'Entregado'> Disponible </td>");
		}else{
			out.print("<td class = 'noEntregado'>No Disponible</td>"); 
		}
		
		out.print("</tr>");
	}
	
	



%>
			
		</tbody>
	</table>
</body>
</html>