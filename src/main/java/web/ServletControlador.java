/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import datos.GeneroDaoJDBC;
import datos.LibroDaoJDBC;
import dominio.Genero;
import dominio.Libro;
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

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if(accion!=null) {
            switch(accion) {
                case "editar":
                    this.editarLibro(request,response);
                    break;
                    
                case "eliminar":
                    this.eliminarLibro(request, response);
                    break; 
                    
                case "eliminarGenero":
                    this.eliminarGenero(request, response);
                    break;    
                    
                case "visualizar":
                    this.visualizar(request, response);
                    break;
                    
                case "autor":
                    this.librosAutor(request, response);
                    break;
                    
                case "mostrarGeneros":
                    this.mostrarGeneros(request, response);
                    break;    
                    
                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if(accion!= null) {
         
            switch(accion) {
                case "insertar":
                    this.insertarLibro(request, response);
                    break;
                 
                case "modificar":
                    this.modificar(request, response);
                    break;
                    
                case "insertarGenero":
                    this.insertarGenero(request, response);
                    break;
                    
                default:
                    this.accionDefault(request, response);
            }
            
         } else {
            this.accionDefault(request, response);
        }
    }

    private void insertarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String isbnString = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String genero = request.getParameter("genero");
        String portada = request.getParameter("portada");
        String precioString = request.getParameter("precio");
        String paginasString = request.getParameter("paginas");
        
        Long isbn = null;
        double precio = 0;
        int paginas = 0;
        
        if(isbnString != null && !"".equals(isbnString)) {
            isbn = Long.parseLong(isbnString);
        }
        
        if(precioString !=null && !"".equals(precioString)) {
            precio = Double.parseDouble(precioString);
        }
        
        if(paginasString != null && !"".equals(paginasString)) {
            paginas = Integer.parseInt(paginasString);
        }
        
        Libro libro = new Libro(isbn, titulo, autor, genero, portada, precio, paginas);
        int registrosModificados = new LibroDaoJDBC().insertar(libro);
        System.out.println("Registros modificados => " + registrosModificados);
        
        this.accionDefault(request, response);
        
    }
    
    private double calcularPrecioTotal(List<Libro> libros) {
        double precioTotal = 0;
        for(Libro libro: libros) {
            precioTotal += libro.getPrecio();
        }
        return precioTotal;
    }
    
    private int calcularNumeroAutores(List<Libro> libros) {
        
        int numeroAutores = 0;
        
        numeroAutores = new LibroDaoJDBC().numeroAutores();
        
        return numeroAutores;
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    }

    private void editarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        int id = Integer.parseInt(request.getParameter("id"));
        
        Libro libro = new LibroDaoJDBC().encontrar(new Libro(id));
        
        List<Genero> generos = new GeneroDaoJDBC().listar();
        
        request.setAttribute("generos", generos);
        request.setAttribute("libro", libro);
        String jspEditar = "/WEB-INF/paginas/libro/editarLibro.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
        
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String isbnString = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String genero = request.getParameter("genero");
        String portada = request.getParameter("portada");
        String precioString = request.getParameter("precio");
        String paginasString = request.getParameter("paginas");
        
        Long isbn = null;
        double precio = 0;
        int paginas = 0;
        
        if(isbnString != null && !"".equals(isbnString)) {
            isbn = Long.parseLong(isbnString);
        }
        
        if(precioString !=null && !"".equals(precioString)) {
            precio = Double.parseDouble(precioString);
        }
        
        if(paginasString != null && !"".equals(paginasString)) {
            paginas = Integer.parseInt(paginasString);
        }
        
        Libro libro = new Libro(id,isbn, titulo, autor, genero, portada, precio, paginas);
        
        int registrosModificados = new LibroDaoJDBC().actualizar(libro);
        System.out.println("Registros modificados => " + registrosModificados);
        
        this.accionDefault(request, response);
        
    }

    private void eliminarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        int id = Integer.parseInt(request.getParameter("id"));
        
        Libro libro = new Libro(id);
        
        int registrosModificados = new LibroDaoJDBC().eliminar(libro);
        System.out.println("Registros modificados => " + registrosModificados);
        
        this.accionDefault(request, response);
        
    }

    private void visualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         int id = Integer.parseInt(request.getParameter("id"));
        
        Libro libro = new LibroDaoJDBC().encontrar(new Libro(id));
        
        request.setAttribute("libro", libro);
        String jspVisualizar = "/WEB-INF/paginas/libro/visualizarLibro.jsp";
        request.getRequestDispatcher(jspVisualizar).forward(request, response);
        
    }

    private void librosAutor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String autor = request.getParameter("autor");
        
        List<Libro> libros = new LibroDaoJDBC().encontrarAutor(new Libro(autor));
        request.setAttribute("libros", libros);
        String jspMostrarAutor = "/WEB-INF/paginas/libro/mostrarAutor.jsp";
        request.getRequestDispatcher(jspMostrarAutor).forward(request, response);
        
    }

    private void insertarGenero(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String generoString = request.getParameter("genero");
        Genero genero = new Genero(generoString);
        
        int registrosModificados = new GeneroDaoJDBC().insertar(genero);
        
        System.out.println("Registros modificados => " + registrosModificados);
        
        this.accionDefault(request, response);
        
    }

    private void mostrarGeneros(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        
        List<Genero> generos = new GeneroDaoJDBC().listar();
        
        request.setAttribute("generos", generos);
        String jspMostrarGeneros = "/WEB-INF/paginas/libro/mostrarGeneros.jsp";
        request.getRequestDispatcher(jspMostrarGeneros).forward(request, response);
        
    }

    private void eliminarGenero(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Genero genero = new Genero(id);
        
        int registrosModificados = new GeneroDaoJDBC().eliminar(genero);
        System.out.println("Registros modificados => " + registrosModificados);
        
        this.mostrarGeneros(request, response);
        
    }

}
