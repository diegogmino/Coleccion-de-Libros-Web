/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package datos;

import dominio.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author diego
 */
public class UsuarioDaoJDBC {
    
    private static final String SQL_SELECT =
            "SELECT * "
            + " FROM usuarios WHERE usuario = ? AND contrasena = ?";
    
    private static final String SQL_INSERT = 
             "INSERT INTO usuarios(usuario, contrasena) "
            + "VALUES (?,?)";
    
    private static final String SQL_DELETE = 
            "DELETE FROM usuarios WHERE usuario = ? AND contrasena = ?";
    
    public boolean buscarUsuario(Usuario usuario) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            
            stmt.setString(1, usuario.getUsuario());
            stmt.setString(2, usuario.getContrasena());
            
            rs = stmt.executeQuery(); 
            
            if(rs.next()) {
                return true;
            } else {
                return false;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDaoJDBC.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }  finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

    }
    
    public int insertarUsuario(Usuario usuario) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
          try {
              conn = Conexion.getConnection();
              stmt = conn.prepareStatement(SQL_INSERT);
              
              stmt.setString(1, usuario.getUsuario());
              stmt.setString(2, usuario.getContrasena());
              
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
