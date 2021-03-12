/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package datos;

import dominio.Genero;
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
public class GeneroDaoJDBC {
    
    private static final String SQL_SELECT =
            "SELECT id, genero "
            + " FROM generos";
    
    private static final String SQL_SELECT_BY_ID =  
            "SELECT id, genero "
            + " FROM libros WHERE id = ?";
    
    private static final String SQL_SELECT_BY_GENRE =  
            "SELECT id, genero "
            + " FROM libros WHERE id = ?";
    
    private static final String SQL_INSERT = 
             "INSERT INTO generos(genero) "
            + "VALUES (?)";
    
    private static final String SQL_UPDATE =
            "UPDATE generos SET genero = ? "
            + " WHERE id = ?";
    
    private static final String SQL_DELETE = 
            "DELETE FROM generos WHERE id = ?";
    
    public List<Genero> listar() {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Genero genero = null;
        List<Genero> generos = new ArrayList<>();
        
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                
                int id = rs.getInt("id");
                String nombre = rs.getString("genero");
                
                genero = new Genero(id, nombre);
                generos.add(genero);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return generos;
        
    }
    
    public int insertar(Genero genero) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_INSERT);
              
              stmt.setString(1, genero.getGenero());
              
              rows = stmt.executeUpdate();
              
          } catch (SQLException ex) {
              Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
          return rows;
        
    }
    
    public int actualizar(Genero genero) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_UPDATE);
              
              stmt.setString(1, genero.getGenero());
              stmt.setInt(2, genero.getId());
              
              rows = stmt.executeUpdate();              
              
          } catch (SQLException ex) {
              Logger.getLogger(LibroDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
          return rows;
          
    }
    
    public int eliminar(Genero genero) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_DELETE);
              stmt.setInt(1, genero.getId());
              
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
