/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.administrador;
import cd.comun.*;
import java.sql.*;

/**
 *
 * @author Psitec
 */
public class administrador 
{
    public static ResultSet obtieneAdmin(int id) throws SQLException
    {
        ResultSet result = null;
        String sentencia = "select id,nombre,apPaterno,apMaterno,user,pass,tipoUsuario,cargo from usuarios,administradores where id =" + id + " and idAdministrador = " + id + ";";
        result = conexion.obtenerDatos(sentencia);
        return result;
    }
    
    public static int obtieneAdmin(String nombre, String usr, String pass) throws SQLException
    {
        int id=0;
        ResultSet result = null;
        String sentencia = "select id from usuarios where nombre ='" + nombre + "' and user = '" + usr + "' and pass = '" + pass +"';";
        result = conexion.obtenerDatos(sentencia);
        while(result.next())
        {
            id = result.getInt("id");
        }
        return id;
    }
    
    public static void nuevoAdmin(String sentencia) throws SQLException
    {
        conexion.ejecutar(sentencia);
    }
    
    public static void modificaAdmin(int id, String nombre,String apPat,String apMat,String usr,String pass, String cargo) throws SQLException
    {
        String cad = "UPDATE usuarios, administradores SET usuarios.nombre = '" + nombre +"', usuarios.apPaterno = '" + apPat +"', usuarios.apMaterno = '" + apMat+"', usuarios.user = '" + usr +"', usuarios.pass = '" + pass +"', administradores.cargo = '" + cargo + "' where usuarios.id =" + id + " and administradores.idAdministrador = " + id + ";";
        conexion.ejecutar(cad);
    }
    
    public static void nuevaCategoria(String categoria) throws SQLException
    {
        String sentencia = "insert into categorias (nombreCategoria) values ('"+ categoria +"');";
        cd.comun.conexion.ejecutar(sentencia);
    }
    
    
}
