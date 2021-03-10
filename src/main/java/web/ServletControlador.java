/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import datos.LibroDaoJDBC;
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

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Libro> libros = new LibroDaoJDBC().listar();
        System.out.println("libros = " + libros);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("libros", libros);
        //request.getRequestDispatcher("libros.jsp").forward(request, response);
        response.sendRedirect("libros.jsp");
    }

    private void editarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        int id = Integer.parseInt(request.getParameter("id"));
        
        Libro libro = new LibroDaoJDBC().encontrar(new Libro(id));
        
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

}
