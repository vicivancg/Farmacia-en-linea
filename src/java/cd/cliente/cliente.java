/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.cliente;
import cd.comun.*;
import java.sql.*;

/**
 *
 * @author Psitec
 */
public class cliente {
    
    public static ResultSet obtieneCliente(int id) throws SQLException
    {
        ResultSet result = null;
        String sentencia = "select id,nombre,apPaterno,apMaterno,user,pass,tipoUsuario,edad,calle,numInt,numExt,CP,colonia,delegacion from usuarios,clientes where id =" + id + " and idCliente = " + id + ";";
        result = conexion.obtenerDatos(sentencia);
        return result;
    }
   
    
    public static int obtieneCliente(String nombre, String usr, String pass) throws SQLException
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
    
    public static void nuevoCliente(String sentencia) throws SQLException
    {
        conexion.ejecutar(sentencia);
    }
    
    public static void modificaCliente(int id, String nombre,String apPat,String apMat,String usr,String pass, int edad, String calle, int numInt, int numExt,int CP, String colonia, String delegacion) throws SQLException
    {
        String cad = "UPDATE usuarios, clientes SET usuarios.nombre = '" + nombre +"', usuarios.apPaterno = '" + apPat +"', usuarios.apMaterno = '" + apMat+"', usuarios.user = '" + usr +"', usuarios.pass = '" + pass +"', clientes.edad = " + edad + ", clientes.calle = '" + calle +"', clientes.numInt = " + numInt +", clientes.numExt = " + numExt +", clientes.CP = " + CP +", clientes.colonia = '" + colonia +"', clientes.delegacion = '" + delegacion + "' where usuarios.id =" + id + " and clientes.idCliente = " + id + ";";
        conexion.ejecutar(cad);
    }
    
    
}
