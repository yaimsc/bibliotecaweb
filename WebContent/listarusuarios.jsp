
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioModelo"%>
<%@page import="vista.UsuarioVista" %>
<%@page import="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Usuarios</title>
</head>
<body>
<jsp:include page="WEB-INF/navbar.jsp"></jsp:include>
	<header><h1>Lista de Usuarios</h1></header>
	<table class = "table"> 
	<thead>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>Edad</th>
			<th>DNI</th>
			<th>Fecha de nacimiento</th>
		</tr>
	</thead>	

<%

UsuarioModelo usuarioModelo = new UsuarioModelo(); 
ArrayList<Usuario> usuarios = usuarioModelo.selectAll(); 


Iterator<Usuario> i = usuarios.iterator();
while(i.hasNext()){
	Usuario usuario = i.next();
	
	out.print("<tbody><tr><td>" + usuario.getId() + " </td>" + "<td>" + usuario.getNombre() + "</td><td>" 
	+ usuario.getApellido() + "</td><td>" + usuario.getEdad() 
	+ "</td><td>"+ usuario.getDni() + "</td><td>" + usuario.getFechaNacimiento() + "</td></tr></tbody>"); 
	
}

%>

</table>
</body>
</html>