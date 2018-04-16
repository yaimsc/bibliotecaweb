
<%@page import= "modelo.*" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="css/estilos.css">
  	
<title>Listar Prestamos</title>
</head>
<body>


<%
Object objeto = session.getAttribute("usuario");
Usuario usuario = (Usuario) objeto; 

if(usuario.getId() == 7){
	

%>

<jsp:include page = "WEB-INF/navbarAdmin.jsp"></jsp:include>
<h1>Lista de Prestamos</h1>

<table class = "table"> 
	<thead>
		<tr>
			<th>ID</th>
			<th>Titulo Libro</th>
			<th>Autor Libro</th>
			<th>DNI</th>
			<th>fecha_inicio</th>
			<th>fecha_fin</th>
			<th>Estado</th>
		</tr>
	</thead>
<%

PrestamoModelo prestamoModelo = new PrestamoModelo(); 

ArrayList<Prestamo> prestamos = prestamoModelo.selectAll(); 

Iterator<Prestamo> i = prestamos.iterator(); 

while(i.hasNext()){
	Prestamo prestamo = i.next(); 
	
	out.print("<tbody><tr><td>"); 
	out.print(prestamo.getId());
	out.print("</td><td>");
	out.print(prestamo.getLibro().getTitulo()); 
	out.print("</td><td>");
	out.print(prestamo.getLibro().getAutor()); 
	out.print("</td><td>");
	out.print(prestamo.getUsuario().getDni()); 
	out.print("</td><td>"); 
	out.print(prestamo.getFechaPrestamo()); 
	out.print("</td><td>"); 
	out.print(prestamo.getFechaLimite()); 
	out.print("</td>"); 
	if(prestamo.isEntregado() == true){
		out.print("<td class = 'Entregado'> Disponible</td>"); 
	}else{
		out.print("<td class = 'noEntregado' > No Disponible </td>");
	}
	out.print("</tr></tbody>"); 
	
}

}else{
	
	%>
	
	<jsp:include page = "WEB-INF/navbarUser.jsp"></jsp:include>
	<h1>Lista de Prestamos</h1>
	
	<table class = "table"> 
	<thead>
		<tr>
			<th>Titulo Libro</th>
			<th>Autor Libro</th>
			<th>DNI</th>
			<th>fecha_inicio</th>
			<th>fecha_fin</th>
		</tr>
	</thead>
	
	<%
	
	if(usuario.esUsuario()){
		PrestamoModelo prestamoModelo = new PrestamoModelo();
		ArrayList<Prestamo>prestamos = prestamoModelo.selectporUsuario(usuario.getId()); 
		
		Iterator<Prestamo> i = prestamos.iterator(); 
		
		while(i.hasNext()){
			Prestamo prestamo = i.next(); 
				out.print("<tbody><tr><td>"); 
				out.print(prestamo.getLibro().getTitulo()); 
				out.print("</td><td>");
				out.print(prestamo.getLibro().getAutor()); 
				out.print("</td><td>");
				out.print(prestamo.getUsuario().getDni()); 
				out.print("</td><td>"); 
				out.print(prestamo.getFechaPrestamo()); 
				out.print("</td><td>"); 
				out.print(prestamo.getFechaLimite()); 
				out.print("</td>"); 
		}
	

	}
}

%>

</table>

</body>
</html>