<%-- 
    Document   : muestraMed
    Created on : 23/05/2013, 05:37:12 AM
    Author     : Psitec
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modifica Medicamentos</title>
        
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
    <center> Puedes modificar o eliminar medicamentos </center><br/><br/>
    <center><table width="80%" border ="1"><tr><th>Nombre</th><th>Sustancia Activa</th><th>Presentacion</th><th>Laboratorio</th><th>Inventario</th><th>Precio</th><th>Contenido</th><th>tipo Contenido</th><th>Administracion</th><th>Modificar</th><th>Eliminar</th></tr>
        <%
            ResultSet result;
            result = cn.medicamento.medicamento.obtenerTodo();
            while(result.next())
            {
                out.write("<tr>");
                out.write("<td>" + result.getString("nombre") + "</td>");
                out.write("<td>" + result.getString("sustanciaActiva") + "</td>");
                out.write("<td>" + result.getString("presentacion") + "</td>");
                out.write("<td>" + result.getString("laboratorio") + "</td>");
                out.write("<td>" + result.getInt("cantidad") + "</td>");
                out.write("<td>" + result.getFloat("precio") + "</td>");
                out.write("<td>" + result.getFloat("contenido") + "</td>");
                out.write("<td>" + result.getString("tipoCantidad") + "</td>");
                out.write("<td>" + result.getString("viaAdmin") + "</td>");
                out.write("<td><form method='post' action='modificaMed.jsp'><input type ='hidden' id='idMed' name='idMed' value = '" + result.getString("idMedicamentos") + "'/><input type='image' src='img/modificar.png' width='20px' height='20px' onclick='submit()'/></form></td>");
                 out.write("<td><form method='post' action='eliminaMed.jsp'><input type ='hidden' id='idMed' name='idMed' value = '" + result.getString("idMedicamentos") + "'/><input type='image' src='img/eliminar.jpg' width='20px' height='20px' onclick='submit()'/></form></td>");
                out.write("</tr>");
            }
            if(result.absolute(1) == false)
            {
                out.write("<center> no hay medicamentos</center>");
            }
        %>
        </table>
        </center>
    </body>
</html>
