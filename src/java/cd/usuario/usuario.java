/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.usuario;
import cd.comun.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Psitec
 */
//import cd.comun.*;

public class usuario {
    public static ResultSet obtenerUsuario (String usuario, String password) throws SQLException
    {
        ResultSet result = null;
        String sentencia = "select * from usuarios where (user = '"+usuario+"' AND pass = '"+password+"');";
        result = conexion.obtenerDatos(sentencia);
        return result;
    }
    
    public static String busca (String nombre) throws SQLException
    {
        String cad = "<center>coincidencias<center><br/><table width='80%'><tr><th>nombre</th> <th>Apellido Paterno</th> <th>Apellido Materno</th> <th>Nombre Usuario</th> <th>tipo de usuario</th></tr>";
        ResultSet result = null;
        String sentencia = "select id,nombre,apPaterno,apMaterno,user,tipoUsuario from usuarios where nombre = '" + nombre + "' or user = '" + nombre + "';";
        result = conexion.obtenerDatos(sentencia);
        if (result.absolute(1))
        {
            result.previous();
            while(result.next())
            {
                boolean tipo = result.getBoolean("tipoUsuario");
                cad+="<tr><td>" + result.getString("nombre")+ "</td>";
                cad+="<td>" + result.getString("apPaterno")+ "</td>";
                cad+="<td>" + result.getString("apMaterno")+ "</td>";
                cad+="<td>" + result.getString("user")+ "</td>";
                if (tipo == true)
                {
                    cad += "<td>Administrador</td>";
                }
                else
                {
                    cad += "<td>Usuario</td>";
                }
                cad+="<td><form method='post' action='eliminaUsuario.jsp'>"
                        + "<input id='txtId' name='txtId' type='hidden' value = '"+ result.getString("id") + "'/> "
                        + "<input type='image' src='img/eliminar.jpg' onclick='submit()' width='15px' heihgt = '15px'/></form></td>";
                cad+="</tr>";

            }
            cad+= "</table>";
        }
        else
        {
            cad = "no se encontraron coincidencias";
        }
        return cad;
    }
    
    public static void elimina (int id) throws SQLException
    {
        String sentencia = "delete from usuarios where id = " + id + " limit 1;";
        cd.comun.conexion.ejecutar(sentencia);
    }
    
    public static void cierra() throws SQLException
    {
        cd.comun.conexion.cierraCon();
    }
    
    public static ResultSet obtieneTodo(String sentencia) throws SQLException
    {
        ResultSet resultado;
        resultado = cd.comun.conexion.obtenerDatos(sentencia);
        return resultado;
    }
}
