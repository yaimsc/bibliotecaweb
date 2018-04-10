<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
String dni = request.getParameter("dni"); 
String password = request.getParameter("password"); 

if(dni.equals("12345678A") && password.equals("hola")){
	session.setAttribute("iniciado", "si"); //session como un array con indice y valor
	response.sendRedirect("sistema.jsp"); 
	
 }else{
	response.sendRedirect("loginform.jsp"); 
}

%>

