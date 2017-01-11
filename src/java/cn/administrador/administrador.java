/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.administrador;

import cn.usuario.usuario;
import java.util.Date;
import java.sql.*;

/**
 *
 * @author Psitec
 */
public class administrador extends usuario {
    private String cargo = "";


    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    
    
    public administrador ()
    {
    }
    
    public administrador(int Id, String nom,String pat,String mat,String usr,String pass, boolean tipo, String cargo)
    {
        this.setId(Id);
        this.setNombre(nom);
        this.setApPat(pat);
        this.setApMat(mat);
        this.setUsrNom(usr);
        this.setUsrPass(pass);
        this.setTipoUsuario(tipo);
        this.cargo = cargo;
    }
    
    public void generaAdmin(int id) throws SQLException
    {
        ResultSet result = cd.administrador.administrador.obtieneAdmin(id);
        while(result.next())
        {
            this.setId(Integer.parseInt(result.getString("id")));
            this.setNombre(result.getString("nombre"));
            this.setApPat(result.getString("apPaterno"));
            this.setApMat(result.getString("apMaterno"));
            this.setUsrNom(result.getString("user"));
            this.setUsrPass(result.getString("pass"));
            this.setTipoUsuario(result.getBoolean("tipoUsuario"));
            this.cargo = result.getString("cargo");
        }
        
    }
    
    public void nuevoAdmin() throws SQLException
    {
        String cad = "insert into usuarios (nombre,apPaterno,apMaterno,user,pass,tipoUsuario) values ("+ "'"+this.getNombre()+"','"+this.getApPat()+"','"
                +this.getApMat()+"','"+this.getUsrNom()+"','"+this.getUsrPass()+"',1);";
        cd.administrador.administrador.nuevoAdmin(cad);
        int id = obtieneId(this.getNombre(),this.getUsrNom(),this.getUsrPass());
        cad = "insert into administradores (idAdministrador,cargo) values ( " + id + ",'"+ this.cargo+"');";
        cd.administrador.administrador.nuevoAdmin(cad);
    }
    
    public int obtieneId(String nombre,String usr, String pass) throws SQLException
    {
        int id = cd.administrador.administrador.obtieneAdmin(nombre, usr, pass);
        return id;
    }
    
    public void modificaAdmin() throws SQLException
    {
        cd.administrador.administrador.modificaAdmin(this.getId(), this.getNombre(), this.getApPat(), this.getApMat(), this.getUsrNom(), this.getUsrPass(), this.getCargo());
    }
    
    public static void agregaCategoria(String categoria) throws SQLException
    {
        cd.administrador.administrador.nuevaCategoria(categoria);
    }
}
