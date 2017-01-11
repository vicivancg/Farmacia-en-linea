/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.comun;

/**
 *
 * @author Psitec
 */
import java.lang.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
public class conexion {
    static Connection cnx = null;
    
     private static void nuevaConexion() throws SQLException {
         
        String dbCtrl = "com.mysql.jdbc.Driver";
       
        try
        {
            Class.forName(dbCtrl);
            String url = "jdbc:mysql://localhost/farmacia";
            cnx = DriverManager.getConnection(url,"root", "");
            System.out.println("conexion establecida");
            //return cnx;
            
        }
        catch (SQLException ex)
        {
            System.out.println("error de sql" + ex.getMessage());
        }
        
        catch (ClassNotFoundException ex)
        {
            System.out.println("imposible encontrar el Driver");
        }
     }
     
     public static ResultSet obtenerDatos(String consulta) throws SQLException
     {
          ResultSet rset = null;
        try {
            nuevaConexion();
        } catch (SQLException ex) {
            System.out.println("error al obtener conexion");
        }
        
        Statement adaptr = null;
        adaptr = cnx.createStatement();
        rset = adaptr.executeQuery(consulta);
        return rset;
     }
     
     public static void ejecutar(String consulta) throws SQLException
     {
        try {
            nuevaConexion();
        } catch (SQLException ex) {
            System.out.println("error al obtener conexion");
        }
        
        Statement adaptr = null;
        adaptr = cnx.createStatement();
        adaptr.executeUpdate(consulta);
     }
     public static void cierraCon () throws SQLException
     {
         cnx.close();
     }
    
}
