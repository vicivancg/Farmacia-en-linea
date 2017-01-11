/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cd.orden;
import cd.comun.conexion.*;
import java.sql.*;

/**
 *
 * @author Psitec
 */
public class orden {
    
    public static void generaOrden(int cliente, double total, String fecha) throws SQLException
    {
        String sentencia = "insert into ordenes (idCliente,totalPagar, fechaCompra, pagada) VALUES (" + cliente + "," + total + ",'" + fecha + "',0)";
        cd.comun.conexion.ejecutar(sentencia);
    }
    
    public static void generaItems(int idOrden, int idMed, int numItems) throws SQLException
    {
        String sentencia = "insert into itemsorden (idOrden,idMedicamento,numeroItems) VALUES (" + idOrden +"," + idMed + "," + numItems + ");";
        cd.comun.conexion.ejecutar(sentencia);
        sentencia = "update medicamentos set cantidad = cantidad -" + numItems +" where idMedicamentos = " + idMed +";";
        cd.comun.conexion.ejecutar(sentencia);
    }
    
    
    public static int obtieneId() throws SQLException
    {
        String sentencia = "select max(idOrden) FROM ordenes;";
        ResultSet result = cd.comun.conexion.obtenerDatos(sentencia);
        int id=0;
        while (result.next())
        {
            id = Integer.parseInt(result.getString("max(idOrden)"));
        }
        
        return id;
            
    }
    
    public static ResultSet obtieneNombreMed (int idMed) throws SQLException
    {
        ResultSet result = null;
        String sentencia = "select nombre from medicamentos where idMedicamentos = " + idMed + ";";
        result = cd.comun.conexion.obtenerDatos(sentencia);
        return result;
    }
    public static ResultSet obtieneMedicamentosOrden (int idOrden) throws SQLException
    {
        ResultSet result = null;
        String sentencia = "select * from itemsorden where idOrden = " + idOrden + ";";
        result = cd.comun.conexion.obtenerDatos(sentencia);
        return result;
    }
    
    public static ResultSet obtieneOrden () throws SQLException
    {
        ResultSet result = null;
        String sentencia = "select * from ordenes; ";
        result = cd.comun.conexion.obtenerDatos(sentencia);
        return result;
    }
    
    public static void cobrar (int idOrden) throws SQLException
    {
        String sentencia = "";
        sentencia = "update ordenes set pagada = 1 where idOrden = " + idOrden +";";
        cd.comun.conexion.ejecutar(sentencia); 
    }
    
    public static void eliminar (int idOrden) throws SQLException
    {
        String sentencia = "";
        ResultSet result = null;
        int idMed = 0;
        int cantidad = 0;
        result = obtieneMedicamentosOrden(idOrden);
        while (result.next())
        {
            idMed = result.getInt("idMedicamento");
            cantidad = result.getInt("numeroItems");
            sentencia = "update medicamentos set cantidad = cantidad + " + cantidad + " where idMedicamentos = " + idMed +";";
            cd.comun.conexion.ejecutar(sentencia); 
        }
        sentencia = "delete from ordenes where idOrden = " + idOrden +";";
        cd.comun.conexion.ejecutar(sentencia); 
    }
}
