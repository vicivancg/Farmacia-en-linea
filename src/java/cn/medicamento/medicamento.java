/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.medicamento;

import java.sql.*;

/**
 *
 * @author Psitec
 */
public class medicamento {
    private int id = 0;
    private String nombre = "";
    private String sustancia = "";
    private String presentacion = "";
    private String laboratorio = "";
    private int cantidad=0;
    private String descripcion ="";
    private double precio = 0.0;
    private double contenido = 0;
    private int tipoCant = 0;
    private int viaAdmin = 0;
    private int categoria = 0;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the sustancia
     */
    public String getSustancia() {
        return sustancia;
    }

    /**
     * @param sustancia the sustancia to set
     */
    public void setSustancia(String sustancia) {
        this.sustancia = sustancia;
    }

    /**
     * @return the presentacion
     */
    public String getPresentacion() {
        return presentacion;
    }

    /**
     * @param presentacion the presentacion to set
     */
    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    /**
     * @return the laboratorio
     */
    public String getLaboratorio() {
        return laboratorio;
    }

    /**
     * @param laboratorio the laboratorio to set
     */
    public void setLaboratorio(String laboratorio) {
        this.laboratorio = laboratorio;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the precio
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * @return the contenido
     */
    public double getContenido() {
        return contenido;
    }

    /**
     * @param contenido the contenido to set
     */
    public void setContenido(double contenido) {
        this.contenido = contenido;
    }

    /**
     * @return the tipoCant
     */
    public int getTipoCant() {
        return tipoCant;
    }

    /**
     * @param tipoCant the tipoCant to set
     */
    public void setTipoCant(int tipoCant) {
        this.tipoCant = tipoCant;
    }

    /**
     * @return the viaAdmin
     */
    public int getViaAdmin() {
        return viaAdmin;
    }

    /**
     * @param viaAdmin the viaAdmin to set
     */
    public void setViaAdmin(int viaAdmin) {
        this.viaAdmin = viaAdmin;
    }

    /**
     * @return the categoria
     */
    public int getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    public void nuevo () throws SQLException
    {
        String cad = "insert into medicamentos (nombre,sustanciaActiva,presentacion,laboratorio,cantidad,descripcion,precio,contenido,tipoCantidad,categoria,viaAdmin) values ('" + this.nombre+"','"+this.sustancia+"','"+this.presentacion+"','"+this.laboratorio+"',"+this.cantidad +",'"+this.descripcion+"',"+this.precio+","+this.contenido+","+this.tipoCant+","+this.categoria+","+this.viaAdmin+" );";
        cd.medicamento.medicamento.nuevo(cad);
    }
    
     public void modifica () throws SQLException
    {
        String cad = "update medicamentos set nombre = '"+ this.nombre +"',sustanciaActiva = '" + this.sustancia +"',presentacion= '"+ this.presentacion + "',laboratorio ='" + this.laboratorio +"',cantidad = " + this.cantidad + ",descripcion ='" + this.descripcion +"',precio ="+this.precio +",contenido =" + this.contenido +",tipoCantidad=" + this.tipoCant + ",categoria ="+this.categoria+",viaAdmin =" + this.viaAdmin + " where idMedicamentos = " + this.id + ";";
        cd.medicamento.medicamento.nuevo(cad);
    }
     
    public void elimina () throws SQLException
    {
        String cad = "delete from medicamentos where idMedicamentos =" + this.id + ";";
        cd.medicamento.medicamento.nuevo(cad);
    }
    
    public static ResultSet obtenerCat() throws SQLException
    {
        ResultSet result;
        String sentencia = "select * from categorias;";
        result = cd.medicamento.medicamento.obtieneCat(sentencia);
        return result;
    }
    
    public static ResultSet obtenerTodo() throws SQLException
    {
        ResultSet result;
        String sentencia = "select * from medicamentos;";
        result = cd.medicamento.medicamento.obtieneTodo(sentencia);
        return result;
    }
     public static ResultSet obtenerMed(String cad) throws SQLException
    {
        ResultSet result;
        String sentencia = "select * from medicamentos where nombre = '"+cad+"' or sustanciaActiva = '" + cad + "';";
        result = cd.medicamento.medicamento.obtieneTodo(sentencia);
        return result;
    }
    
    public static ResultSet obtenerMedicamento(int id) throws SQLException
    {
        ResultSet result;
        String sentencia = "select * from medicamentos where idMedicamentos = " + id + ";";
        result = cd.medicamento.medicamento.obtieneTodo(sentencia);
        return result;
    }
    
}
