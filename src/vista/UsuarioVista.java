package vista;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Scanner;

import modelo.Usuario;
import modelo.UsuarioModelo;

public class UsuarioVista {

	static final int LISTAR = 1;
	static final int INSERTAR = 2;
	static final int SALIR = 0;

	public void menuDeUsuario() {
		Scanner scan = new Scanner(System.in);
		int opcion;
		do {
			System.out.println("--Menu de usuarios--");
			System.out.println(LISTAR + " - listar");
			System.out.println(INSERTAR + " - insertar");
			System.out.println(SALIR + " - salir");
			opcion = Integer.parseInt(scan.nextLine());

			switch (opcion) {
			case LISTAR:
				UsuarioModelo usuarioModelo = new UsuarioModelo();
				ArrayList<Usuario> usuarios = usuarioModelo.selectAll();
				this.mostrarUsuarios(usuarios);
				break;
			case INSERTAR:
				Usuario usuario = scanUsuario(scan);
				usuarioModelo = new UsuarioModelo();
				usuarioModelo.insert(usuario);
				break;
			default:
				break;
			}
		} while (opcion != SALIR);
	}
	
	private Usuario scanUsuario(Scanner scan) {
		Date fechaNacimiento;
		Usuario usuario = new Usuario();
		System.out.println("Introduce nombre");
		usuario.setNombre(scan.nextLine());
		
		System.out.println("Introduce apellido");
		usuario.setApellido(scan.nextLine());
		
		System.out.println("Introduce edad");
		usuario.setEdad(Integer.parseInt(scan.nextLine()));
		
		System.out.println("Introduce la fecha de naciemento (dd/MM/yyyy)");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		

		try {
			fechaNacimiento = sdf.parse(scan.nextLine());
			usuario.setFecha_nacimiento(fechaNacimiento);
		} catch (ParseException e) {
			System.out.println("Ha indroducido mal la fecha");
			return scanUsuario(scan);
		}
		System.out.println("Introduce DNI");
		usuario.setDni(scan.nextLine());
		
		return usuario;
	}

	public void mostrarUsuarios(ArrayList<Usuario> usuarios){
		Iterator<Usuario> i = usuarios.iterator();
		while(i.hasNext()){
			Usuario usuario = i.next();
			this.mostrarUsuario(usuario);
		}
		
	}
	
	public void mostrarUsuario(Usuario usuario){
		java.util.Date fecha_nacimiento = usuario.getFecha_nacimiento();
		String fecha = "";
		if(fecha_nacimiento == null){
			fecha = "fecha vacia";
		}else{
			fecha = new SimpleDateFormat("dd/MM/yyyy").format(usuario.getFecha_nacimiento());
		}
		
		System.out.println(usuario.getId()+ "\t - "+
				usuario.getApellido()+ "\t - "+
				usuario.getApellido()+ "\t - "+
				usuario.getDni()+ "\t - "+
				fecha + "\t - "+
				usuario.getEdad());
	}
	
}
