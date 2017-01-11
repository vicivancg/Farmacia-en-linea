<%-- 
    Document   : muestraUsuarios
    Created on : 22/05/2013, 12:37:10 AM
    Author     : Psitec
--%>

<%@page import="cn.usuario.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>selecciona usuario a eliminar</title>
        <link rel="stylesheet" type="text/css" href="<link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>">
    <style>
      body {
          
       font-family: 'Merriweather Sans', sans-serif;
  font-size: 20px;
  text-shadow: 5px 5px 5px #aaa;
      }
      
     
    </style>
    
    </head>
    <body background="css/images/bg.jpg">
        <%
            usuario usuarioAct = new usuario();
            String nombre=new String(request.getParameter("txtBusca").getBytes("ISO-8859-1"),"UTF-8");
            String resultado = usuarioAct.buscaUsuarios(nombre);
            out.write(resultado);
        %>
    </body>
</html>
