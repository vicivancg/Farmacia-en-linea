/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.medicamento;

import java.sql.*;
import cd.comun.conexion;

/**
 *
 * @author Psitec
 */
public class medicamento {
    
    public static void nuevo(String sentencia) throws SQLException
    {
        cd.comun.conexion.ejecutar(sentencia);
    }
    
    public static ResultSet obtieneCat(String sentencia) throws SQLException
    {
        ResultSet resultado;
        resultado = cd.comun.conexion.obtenerDatos(sentencia);
        return resultado;
    }
    
     public static ResultSet obtieneTodo(String sentencia) throws SQLException
    {
        ResultSet resultado;
        resultado = cd.comun.conexion.obtenerDatos(sentencia);
        return resultado;
    }
    
}
