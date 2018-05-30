

<%@page import="modelo.Usuario"%>
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
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	
  	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Libros</title>
</head>
<style type="text/css">

	#myInput{
		width: 90%; 
		height: 10%; 
		margin-bottom: 2%; 
		
	}
</style>
<body>


<%
Object objeto = session.getAttribute("usuario");
Usuario usuario = (Usuario) objeto; 


if(usuario.esAdmin()){
	
%>
	<jsp:include page="WEB-INF/navbarAdmin.jsp"></jsp:include>
	<h1>Lista de Libros</h1>

<i class="fa fa-search" style="font-size:28px;margin-left:5%;margin-right:5px; "><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Buscar por nombre" title="Type in a name"/>

<table class = "table" id="myTable"> 
	<thead>
		<tr>
			<th>ID</th>
			<th>Titulo</th>
			<th>Autor</th>
			<th>Imagen</th>
		</tr>
	</thead>	

<%

LibroModelo libroModelo = new LibroModelo(); 
ArrayList<Libro> libros = libroModelo.selectAll(); 


Iterator<Libro> i = libros.iterator();
while(i.hasNext()){
	Libro libro = i.next();
	
	out.print("<tbody><tr><td>" + libro.getId() + " </td>" + "<td>" + libro.getTitulo() + "</td><td> " + libro.getAutor() 
	+ "</td><td>" + libro.getImagen() + "</td>");
	
	out.print("<td><a href = 'FichaLibros.jsp?id=" + libro.getId() + "'>Ver</a></td>"); 
	out.print("<td><a href = 'eliminarLibros.jsp?id=" + libro.getId() + "'>Eliminar</a></td>");
	out.print("<td><a href = 'editarLibros.jsp?id=" + libro.getId() + "'>Editar</a></td></tr></tbody>"); 
	}
%>
</table>

<a href = "anadirLibros.jsp">Añadir Libros</a>

<%
}else{
%>
	
	<jsp:include page="WEB-INF/navbarUser.jsp"></jsp:include>
	<h1>Lista de Libros</h1>

<i class="fa fa-search" style="font-size:28px;margin-left:5%;margin-right:5px;  "></i><input type="text" id="myInput" width="100%" onkeyup="myFunction()" placeholder="Buscar por nombre" title="Type in a name"/>

<table class = "table" id="myTable"> 
	<thead>
		<tr>
			<th>ID</th>
			<th>Titulo</th>
			<th>Autor</th>
			<th>Imagen</th>
		</tr>
	</thead>	
	
<%

LibroModelo libroModelo = new LibroModelo(); 
ArrayList<Libro> libros = libroModelo.selectAll(); 

Iterator<Libro> i = libros.iterator();
while(i.hasNext()){
	Libro libro = i.next();
	
	out.print("<tbody><tr><td>" + libro.getId() + " </td>" + "<td>" + libro.getTitulo() + "</td><td> " + libro.getAutor() 
	+ "</td><td>" + libro.getImagen() + "</td>");
	
	out.print("<td><a href = 'FichaLibros.jsp?id=" + libro.getId() + "'>Ver</a></td>"); 
	
	}
}
%>

</table>
<script type="text/javascript">
function myFunction() {
	  var input, filter, table, tr, td, i; 												//declara las variables
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase(); 
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1]; 								//EL ELEMENTO DEL TR QUE SE QUIERE PILLAR
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
</script>
</body>
</html>