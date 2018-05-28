<%@page import="modelo.UsuarioModelo"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%

Object objeto = session.getAttribute("usuario");
Usuario usuario = (Usuario) objeto; 

//si usuario es null vuelva al login
if(usuario == null){
	response.sendRedirect("loginform.jsp"); 
	
	//si usuario no es nul y es admin
	}else if(usuario != null && usuario.getRol().equals("admin")){
		response.sendRedirect("indexAdmin.jsp"); 
		
		//si es solo usuario
	}else{
		response.sendRedirect("indexUser.jsp"); 
	}


/* if(objeto != null & objeto.getRol() == "admin"){
	response.senRedirect("index.html"); 
} */




%>


Estas dentro

<a href = "logout.jsp">Cerrar Sesión</a>
</body>
</html>