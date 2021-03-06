package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class PrestamoModelo extends Conector{

	
	public void insertar(Prestamo prestamo){
		try {
			PreparedStatement pst = super.conexion.prepareStatement("insert into prestamos (id_libro, id_usuario, fecha_prestamo, fecha_limite, entregado) values(?,?,?,?,?)");
			pst.setInt(1, prestamo.getLibro().getId());
			pst.setInt(2, prestamo.getUsuario().getId());
			pst.setDate(3, new java.sql.Date(prestamo.getFechaPrestamo().getTime()));
			pst.setDate(4, new java.sql.Date(prestamo.getFechaLimite().getTime()));
			pst.setBoolean(5, prestamo.isEntregado());
			pst.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Prestamo> selectAll(){
		Statement st;
		Prestamo prestamo;
		UsuarioModelo usuarioModelo = new UsuarioModelo();
		LibroModelo libroModelo= new LibroModelo();
		
		ArrayList<Prestamo> prestamos = new ArrayList<Prestamo>();
		try {
			st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from prestamos");
			while(rs.next()){
				prestamo = new Prestamo();
				prestamo.setId(rs.getInt("id_prestamo"));
				prestamo.setLibro(libroModelo.select(rs.getInt("id_libro"))); 
				prestamo.setUsuario(usuarioModelo.select(rs.getInt("id_usuario")));
				prestamo.setFechaPrestamo(rs.getDate("fecha_prestamo"));
				prestamo.setFechaLimite(rs.getDate("fecha_limite"));
				prestamo.setEntregado(rs.getBoolean("entregado"));
				
				prestamos.add(prestamo);
			
			}
			return prestamos;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prestamos;
	}


	/*
	 * 
	 */
	public Prestamo prestamoNoFinalizado(Libro libro, Usuario usuario) {
		PreparedStatement pst;
		
		UsuarioModelo usuarioModelo = new UsuarioModelo();
		LibroModelo libroModelo= new LibroModelo();
		
		try {
			pst = super.conexion.prepareStatement("SELECT * FROM prestamos WHERE id_libro = ? and id_usuario=? and entregado = ?");
			pst.setInt(1, libro.getId());
			pst.setInt(2, usuario.getId());
			pst.setBoolean(3, false);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()){
				Prestamo prestamo = new Prestamo();
				prestamo.setId(rs.getInt("id_prestamo"));
				prestamo.setLibro(libroModelo.select(rs.getInt("id_libro"))); 
				prestamo.setUsuario(usuarioModelo.select(rs.getInt("id_usuario")));
				prestamo.setFechaPrestamo(rs.getDate("fecha_prestamo"));
				prestamo.setFechaLimite(rs.getDate("fecha_limite"));
				prestamo.setEntregado(rs.getBoolean("entregado"));
				
				return prestamo;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return null;
	}


	public void update(Prestamo prestamo) {
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("UPDATE prestamos SET id_libro=?,id_usuario=?,fecha_prestamo=?,fecha_limite=?,entregado=? WHERE id=?");
			pst.setInt(1, prestamo.getLibro().getId());
			pst.setInt(2, prestamo.getUsuario().getId());
			java.sql.Date fecha_prestamo= new java.sql.Date(prestamo.getFechaPrestamo().getTime());
			pst.setDate(3, fecha_prestamo);
			java.sql.Date fecha_limite = new java.sql.Date(prestamo.getFechaLimite().getTime());
			pst.setDate(4, fecha_limite);
			pst.setBoolean(5, prestamo.isEntregado());
			pst.setInt(6, prestamo.getId());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//NO FUNCIONA!!!!
//	public ArrayList<Prestamo> prestamosDelLibro(Libro libro){
//		ArrayList<Prestamo> prestamos = new ArrayList<Prestamo>();
//		
//		LibroModelo libroModelo = new LibroModelo();
//		UsuarioModelo usuarioModelo = new UsuarioModelo(); 
//		PreparedStatement pst; 
//		
//		
//		
//		try {
//			pst = super.conexion.prepareStatement("select * from prestamos where id_libro = ?");
//			pst.setInt(1, libro.getId());
//			ResultSet rs = pst.executeQuery(); 
//			
//			if(rs.next()){
//				Prestamo prestamo = new Prestamo(); 
//				prestamo.setId(rs.getInt("id_prestamo"));
//				prestamo.setLibro(libroModelo.select(rs.getInt("id_libro")));
//				prestamo.setUsuario(usuarioModelo.select(rs.getInt("id_usuario")));
//				prestamo.setFechaPrestamo(rs.getDate("fecha_prestamo"));
//				prestamo.setFechaLimite(rs.getDate("fecha_limite"));
//				prestamo.setEntregado(rs.getBoolean("entregado"));
//				
//				prestamos.add(prestamo);
//			}
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return prestamos;
//	}
	
	public boolean estaDisponible(Libro libro){
		try {
			PreparedStatement pst = super.conexion.prepareStatement("select * from prestamos where id_libro = ? and entregado = 0"); //entregado 0 = false
			pst.setInt(1, libro.getId());	
			ResultSet rs = pst.executeQuery(); 
			
			if(rs.next()){ //si hay una linea nos saca solo los no entregados por lo que false
				return false;
			}else{ //si no true
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false; 
	}

	
	public ArrayList<Prestamo> selectporUsuario(int id_usuario){
		
		LibroModelo libroModelo = new LibroModelo(); 
		UsuarioModelo usuarioModelo = new UsuarioModelo(); 
		
		ArrayList<Prestamo> prestamos = new ArrayList<Prestamo>();
		
		try {
			PreparedStatement pst = super.conexion.prepareStatement("select * from prestamos where id_usuario = ?");
			pst.setInt(1, id_usuario);
			ResultSet rs = pst.executeQuery(); 
			
			while(rs.next()){
				Prestamo prestamo = new Prestamo();
				prestamo.setId(rs.getInt("id_prestamo"));
				prestamo.setLibro(libroModelo.select(rs.getInt("id_libro")));
				prestamo.setUsuario(usuarioModelo.select(rs.getInt("id_usuario")));
				prestamo.setFechaPrestamo(rs.getDate("fecha_prestamo"));
				prestamo.setFechaLimite(rs.getDate("fecha_limite"));
				prestamo.setEntregado(rs.getBoolean("entregado")); 
				
				prestamos.add(prestamo); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return prestamos;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
