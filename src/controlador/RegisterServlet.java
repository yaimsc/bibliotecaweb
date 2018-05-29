package controlador;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Usuario;
import modelo.UsuarioModelo;

public class RegisterServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String nombre = request.getParameter("nombre"); 
		String apellido = request.getParameter("apellido"); 
		int edad = Integer.parseInt(request.getParameter("edad")); 
		String dni = request.getParameter("dni"); 
		String rol = request.getParameter("rol");
		String password = request.getParameter("password"); 
		
		if(nombre != null && password != null){
			UsuarioModelo usuarioModelo = new UsuarioModelo(); 
			Usuario usuario = new Usuario(); 
			
			usuario.setNombre(nombre);
			usuario.setApellido(apellido);
			usuario.setEdad(edad);
			usuario.setDni(dni);
			usuario.setRol(rol);
			usuario.setPassword(password);
//			java.sql.Date sqlData = new java.sql.Date(usuario.getFecha_nacimiento().getTime());
//			usuario.setFecha_nacimiento(sqlData);
			
			if(usuario != null){
				usuarioModelo.insert(usuario);
				
				RequestDispatcher rd = request.getRequestDispatcher("loginform.jsp"); 
				rd.forward(request, response);
				
			}else{
				response.sendRedirect("registerform.html");
			}
			
		}else{
			response.sendRedirect("registerform.html");
		}
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet (request, response); 
	}

}
