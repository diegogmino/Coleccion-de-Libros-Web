/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import datos.GeneroDaoJDBC;
import datos.LibroDaoJDBC;
import datos.UsuarioDaoJDBC;
import dominio.Genero;
import dominio.Libro;
import dominio.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * @author diego
 */
@WebServlet("/LoginControlador")
public class LoginControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        this.accionDefault(request, response);

}
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if(accion!= null) {
            switch(accion) {
                case "logear":
                    this.logear(request, response);
                    break;
                case "insertar":
                    this.insertar(request, response);
                    break;    
            }
        }
        
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("login", "");
        response.sendRedirect("login.jsp");
        
    }

    private void logear(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        Usuario usuarioValidar = new Usuario(usuario, contrasena);
        
        boolean validar = new UsuarioDaoJDBC().buscarUsuario(usuarioValidar);
        
        if(validar) {
            
            List<Libro> libros = new LibroDaoJDBC().listar();
            List<Genero> generos = new GeneroDaoJDBC().listar();
            System.out.println("libros = " + libros);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("precioTotal", this.calcularPrecioTotal(libros));
            sesion.setAttribute("totalLibros", libros.size());
            sesion.setAttribute("numeroAutores", this.calcularNumeroAutores(libros));
            sesion.setAttribute("generos", generos);
            sesion.setAttribute("libros", libros);
            response.sendRedirect("libros.jsp");
            
        } else {
            this.usuarioNoEncontrado(request, response);
        }
        
    }
    
    public double calcularPrecioTotal(List<Libro> libros) {
        double precioTotal = 0;
        for(Libro libro: libros) {
            precioTotal += libro.getPrecio();
        }
        return precioTotal;
    }
    
    public int calcularNumeroAutores(List<Libro> libros) {
        
        int numeroAutores = 0;
        
        numeroAutores = new LibroDaoJDBC().numeroAutores();
        
        return numeroAutores;
    }

    private void usuarioNoEncontrado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("login", "Usuario o contraseña incorrectos");
        response.sendRedirect("login.jsp");
        
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        Usuario usuarioInsertar = new Usuario(usuario, contrasena);
        
        int registrosModificados = new UsuarioDaoJDBC().insertarUsuario(usuarioInsertar);
        response.sendRedirect("login.jsp");
        
    }
        
    }
