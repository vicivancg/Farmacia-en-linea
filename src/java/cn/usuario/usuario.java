/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.usuario;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Psitec
 */
public class usuario {
    private int id = 0;
    private String nombre = "";
    private String apPaterno = "";
    private String apMaterno = "";
    private String usuarioNom = "";
    private String usuarioPass = "";
    private boolean tipoUsuario = false;
    
    public int getId ()
    {
        return id;
    }
    public void setId(int Id)
    {
        this.id = Id;
    }
    public String getNombre ()
    {
        return nombre;
    }
    public void setNombre (String nom)
    {
        this.nombre = nom;
    }
    public String getApPat ()
    {
        return apPaterno;
    }
    public void setApPat (String pat)
    {
        this.apPaterno = pat;
    }
    public String getApMat ()
    {
        return apMaterno;
    }
    public void setApMat (String mat)
    {
        this.apMaterno = mat;
    }
    public String getUsrNom ()
    {
        return usuarioNom;
    }
    public void setUsrNom (String usrNom)
    {
        this.usuarioNom = usrNom;
    }
    public String getUsrPass ()
    {
        return usuarioPass;
    }
    public void setUsrPass (String pass)
    {
        this.usuarioPass = pass;
    }
    
    public boolean getTipoUsuario()
    {
        return tipoUsuario;
    }
    public void setTipoUsuario (boolean tipo)
    {
        this.tipoUsuario = tipo;
    }
    
    public usuario()
    {
        
    }
    
    public usuario (int Id, String nom,String pat,String mat,String usr,String pass, boolean tipo)
    {
        this.id = Id;
        this.nombre = nom;
        this.apPaterno = pat;
        this.apMaterno = mat;
        this.usuarioNom = usr;
        this.usuarioPass = pass;
        this.tipoUsuario = tipo;
    }
    
    public String buscaUsuarios(String nombre) throws SQLException
    {
        return cd.usuario.usuario.busca(nombre);
    }
    
    public void elimina(int id) throws SQLException
    {
        cd.usuario.usuario.elimina(id);
    }
    
    public static ResultSet obtenerTodo() throws SQLException
    {
        ResultSet result;
        String sentencia = "select * from usuarios;";
        result = cd.usuario.usuario.obtieneTodo(sentencia);
        return result;
    }
}

