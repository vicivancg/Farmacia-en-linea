/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.cliente;

import cn.usuario.usuario;
import java.sql.*;

/**
 *
 * @author Psitec
 */
public class cliente extends usuario {
    private int edad = 0;
    private String calle = "";
    private int numInt = 0;
    private int numExt = 0;
    private int codigoPostal = 0;
    private String colonia = "";
    private String delegacion = "";

    /**
     * @return the edad
     */
    public int getEdad() {
        return edad;
    }

    /**
     * @param edad the edad to set
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }

    /**
     * @return the calle
     */
    public String getCalle() {
        return calle;
    }

    /**
     * @param calle the calle to set
     */
    public void setCalle(String calle) {
        this.calle = calle;
    }

    /**
     * @return the numInt
     */
    public int getNumInt() {
        return numInt;
    }

    /**
     * @param numInt the numInt to set
     */
    public void setNumInt(int numInt) {
        this.numInt = numInt;
    }

    /**
     * @return the numExt
     */
    public int getNumExt() {
        return numExt;
    }

    /**
     * @param numExt the numExt to set
     */
    public void setNumExt(int numExt) {
        this.numExt = numExt;
    }

    /**
     * @return the codigoPostal
     */
    public int getCodigoPostal() {
        return codigoPostal;
    }

    /**
     * @param codigoPostal the codigoPostal to set
     */
    public void setCodigoPostal(int codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    /**
     * @return the colonia
     */
    public String getColonia() {
        return colonia;
    }

    /**
     * @param colonia the colonia to set
     */
    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    /**
     * @return the delegacion
     */
    public String getDelegacion() {
        return delegacion;
    }

    /**
     * @param delegacion the delegacion to set
     */
    public void setDelegacion(String delegacion) {
        this.delegacion = delegacion;
    }
    
    public cliente()
    {
    }
    
    public cliente (int Id, String nom,String pat,String mat,String usr,String pass, boolean tipo, int Edad, String Calle, int NumInt, int NumExt, int CP, String Colonia, String Delegacion)
    {
        this.setId(Id);
        this.setNombre(nom);
        this.setApPat(pat);
        this.setApMat(mat);
        this.setUsrNom(usr);
        this.setUsrPass(pass);
        this.setTipoUsuario(tipo);
        this.edad = Edad;
        this.calle = Calle;
        this.numInt = NumInt;
        this.numExt = NumExt;
        this.codigoPostal = CP;
        this.colonia = Colonia;
        this.delegacion = Delegacion;
    }
    
    public void generaCliente(int id) throws SQLException
    {
        ResultSet result = cd.cliente.cliente.obtieneCliente(id);
        while(result.next())
        {
            this.setId(Integer.parseInt(result.getString("id")));
            this.setNombre(result.getString("nombre"));
            this.setApPat(result.getString("apPaterno"));
            this.setApMat(result.getString("apMaterno"));
            this.setUsrNom(result.getString("user"));
            this.setUsrPass(result.getString("pass"));
            this.setTipoUsuario(result.getBoolean("tipoUsuario"));
            this.edad = Integer.parseInt(result.getString("edad"));
            this.calle = result.getString("calle");
            this.numInt = Integer.parseInt(result.getString("numInt"));
            this.numExt = Integer.parseInt(result.getString("numExt"));
            this.codigoPostal = Integer.parseInt(result.getString("CP"));
            this.colonia = result.getString("colonia");
            this.delegacion = result.getString("delegacion");
        }
        
    }
    
    public void nuevoCliente() throws SQLException
    {
        String cad = "insert into usuarios (nombre,apPaterno,apMaterno,user,pass,tipoUsuario) values ("+ "'"+this.getNombre()+"','"+this.getApPat()+"','"
                +this.getApMat()+"','"+this.getUsrNom()+"','"+this.getUsrPass()+"',0);";
        cd.cliente.cliente.nuevoCliente(cad);
        int id = obtieneId(this.getNombre(),this.getUsrNom(),this.getUsrPass());
        cad = "insert into clientes (idCliente,edad,calle,numInt,numExt,CP,colonia,delegacion) values ( " + id + ","+ this.edad + ",'"+ this.calle+ "',"+ this.numInt+ ","+ this.numExt+ ","+ this.codigoPostal+ ",'"+ this.colonia+ "','"+ this.delegacion+ "' );";
        cd.cliente.cliente.nuevoCliente(cad);
    }
    
    public int obtieneId(String nombre,String usr, String pass) throws SQLException
    {
        int id = cd.cliente.cliente.obtieneCliente(nombre, usr, pass);
        return id;
    }
    
    public void modificaCliente() throws SQLException
    {
        cd.cliente.cliente.modificaCliente(this.getId(), this.getNombre(), this.getApPat(), this.getApMat(), this.getUsrNom(), this.getUsrPass(), this.edad,this.calle,this.numInt,this.numExt,this.codigoPostal,this.colonia,this.delegacion);
    }
}
