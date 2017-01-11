/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.orden;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Psitec
 */
public class orden {
    public int producto = 0;
    public int comprador = 0;
    public int cantidad = 0;
    public double total = 0;
    public String nombre = "";
    public String fecha = "";
    
    public void realizaOrden(int cliente, double total, String fecha ) throws SQLException
    {
        cd.orden.orden.generaOrden(cliente, total, fecha);
    }
    
    public int obtieneId() throws SQLException
    {
        int id = cd.orden.orden.obtieneId();
        return id;
    }
    
    public void generaItem(int idOrden, int idMedicamento, int cantidad) throws SQLException
    {
        cd.orden.orden.generaItems(idOrden, idMedicamento, cantidad);
    }
    
    public ResultSet generaOrdenes() throws SQLException
    {
        ResultSet result = null;
        result = cd.orden.orden.obtieneOrden();
        return result;
    }
    
    public ResultSet obtieneMedicamentos(int idOrden) throws SQLException
    {
        ResultSet result = null;
        result = cd.orden.orden.obtieneMedicamentosOrden(idOrden);
        return result;
    }
    
    public String obtieneNombreMed (int idMed) throws SQLException
    {
        ResultSet result = null;
        result = cd.orden.orden.obtieneNombreMed(idMed);
        String nombre = "";
        result.next();
        nombre = result.getString("nombre");
        return nombre;
    }
    
    public void cobrar (int idOrden) throws SQLException
    {
        cd.orden.orden.cobrar(idOrden);
    }
    
    public void eliminar (int idOrden) throws SQLException
    {
        cd.orden.orden.eliminar(idOrden);
    }
}
