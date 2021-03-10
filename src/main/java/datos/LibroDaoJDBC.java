/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package datos;

import dominio.Libro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author diego
 */
public class LibroDaoJDBC {
    
      private static final String SQL_SELECT =
            "SELECT id, isbn, titulo, autor, genero, portada, precio, paginas "
            + " FROM libros";
    
    private static final String SQL_SELECT_BY_ID =  
            "SELECT id, isbn, titulo, autor, genero, portada, precio, paginas "
            + " FROM libros WHERE id = ?";
    
    private static final String SQL_INSERT = 
             "INSERT INTO libros(isbn, titulo, autor, genero, portada, precio, paginas) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    private static final String SQL_UPDATE =
            "UPDATE libros SET isbn = ?,"
            + " titulo = ?,"
            + " autor = ?,"
            + " genero = ?,"
            + " portada = ?,"
            + "precio = ?,"
            + "paginas = ?"
            + " WHERE id = ?";
    
    private static final String SQL_DELETE = 
            "DELETE FROM libros WHERE id = ?";
    
    public List<Libro> listar() {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Libro libro = null;
        List<Libro> libros = new ArrayList<>();
        
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                
                int id = rs.getInt("id");
                Long isbn = rs.getLong("isbn");
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                String genero = rs.getString("genero");
                String portada = rs.getString("portada");
                double precio = rs.getDouble("precio");
                int paginas = rs.getInt("paginas");
                
                libro = new Libro(id, isbn, titulo, autor, genero, portada, precio, paginas);
                libros.add(libro);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return libros;
        
    }
    
    public Libro encontrar(Libro libro) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
              
              stmt.setInt(1, libro.getId());
              rs = stmt.executeQuery();
              
              //rs.absolute(1);
              
              
              while(rs.next()) {
                  Long isbn = rs.getLong("isbn");
                  String titulo = rs.getString("titulo");
                  String autor = rs.getString("autor");
                  String genero = rs.getString("genero");
                  String portada = rs.getString("portada");
                  double precio = rs.getDouble("precio");
                  int paginas = rs.getInt("paginas");
              
                  libro.setIsbn(isbn);
                  libro.setTitulo(titulo);
                  libro.setAutor(autor);
                  libro.setGenero(genero);
                  libro.setPortada(portada);
                  libro.setPrecio(precio);
                  libro.setPaginas(paginas);
              }
              
              
          } catch (SQLException ex) {
              Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
          
          return libro;
    }
    
    public int insertar(Libro libro) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_INSERT);
              
              stmt.setLong(1, libro.getIsbn());
              stmt.setString(2, libro.getTitulo());
              stmt.setString(3, libro.getAutor());
              stmt.setString(4, libro.getGenero());
              stmt.setString(5, libro.getPortada());
              stmt.setDouble(6, libro.getPrecio());
              stmt.setInt(7, libro.getPaginas());
              
              rows = stmt.executeUpdate();
              
          } catch (SQLException ex) {
              Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
          return rows;
        
    }
    
    public int actualizar(Libro libro) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_UPDATE);
              
              stmt.setLong(1, libro.getIsbn());
              stmt.setString(2, libro.getTitulo());
              stmt.setString(3, libro.getAutor());
              stmt.setString(4, libro.getGenero());
              stmt.setString(5, libro.getPortada());
              stmt.setDouble(6, libro.getPrecio());
              stmt.setInt(7, libro.getPaginas());
              stmt.setInt(8, libro.getId());
              
              rows = stmt.executeUpdate();              
              
          } catch (SQLException ex) {
              Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
          return rows;
          
    }
    
    public int eliminar(Libro libro) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_DELETE);
              stmt.setInt(1, libro.getId());
              
              rows = stmt.executeUpdate();
              
          } catch (SQLException ex) {
              Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
          
          return rows;
        
    }

}
