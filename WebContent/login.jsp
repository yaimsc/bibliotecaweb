<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

//pilla el dni y el password
String dni = request.getParameter("dni"); 
String password = request.getParameter("password"); 

UsuarioModelo usuarioModelo = new UsuarioModelo(); 
if(dni != null && password != null){ //si dni no es null
	Usuario usuario = usuarioModelo.selectporDniPassword(dni, password); //selecciona el dni y el password y mira si coincide con la base de datos
	session.setAttribute("usuario", usuario);
		response.sendRedirect("sistema.jsp"); //le redirecciona al sistema

}else{ //si no es un usuario o admin
	response.sendRedirect("loginform.jsp"); //le redirecciona de nuevo al login
}




/* if(dni.equals("12345678A") && password.equals("hola1")){
	session.setAttribute("iniciado", "si"); //session como un array con indice y valor
	response.sendRedirect("sistema.jsp"); 
	
 }else{
	response.sendRedirect("loginform.jsp"); 
} */

%>

