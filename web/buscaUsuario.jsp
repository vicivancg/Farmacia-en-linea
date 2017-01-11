<%-- 
    Document   : buscaUsuario
    Created on : 22/05/2013, 12:08:33 AM
    Author     : Psitec
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>busca usuario</title>
        <link rel="stylesheet" type="text/css" href="<link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>">
        <script type="text/javascript">
            function valida ()
            {
                if(document.getElementById("txtBusca").value != '')
                {
                    document.getElementById("buscaUsr").submit();
                }
                else
                {
                    alert("introduce un nombre de usuario a buscar");
                }
            }
        </script>
        <style type="text/css">
            body
            {
                font-family: 'Merriweather Sans', sans-serif;
                font-size: 30px;

            }
        </style>
    </head>
    <body background="css/images/bg.jpg">
        <center><table width="80%" border ="0"><tr><th>Nombre</th><th>Apellido Paterno</th><th>Apellido Materno</th><th>Nombre Usuario</th></tr>
        <%
            ResultSet result;
            result = cn.usuario.usuario.obtenerTodo();
            while(result.next())
            {
                out.write("<tr>");
                out.write("<td>" + result.getString("nombre") + "</td>");
                out.write("<td>" + result.getString("apPaterno") + "</td>");
                out.write("<td>" + result.getString("apMaterno") + "</td>");
                out.write("<td>" + result.getString("user") + "</td>");
                out.write("</tr>");
            }
            if(result.absolute(1) == false)
            {
                out.write("<center> no hay usuarios</center>");
            }
        %>
        </table>
        </center>
        <center><div>
                <br><br>
            Introduce el nombre de usuario a eliminar
        </div>
        <form id="buscaUsr" name="buscaUsr" method="post" action="muestraUsuarios.jsp">
            <input type="text" id="txtBusca" name="txtBusca" placeholder="nombre de usuario"/><br/>
            <input type="button" id="btnBusca" name="btnBusca" value="buscar usuario" onclick="valida()"/>
        </form></center>
    </body>
</html>
