<%-- 
    Document   : venta2
    Created on : 23/05/2013, 12:30:43 PM
    Author     : Psitec
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>selecciona medicamento</title>
    </head>
    <body background="css/images/bg.jpg">
        <center> selecciona medicamento </center><br/><br/>
    <center><table width="80%" border ="1"><tr><th>Nombre</th><th>Sustancia Activa</th><th>Presentacion</th><th>Laboratorio</th><th>Inventario</th><th>Precio</th><th>Contenido</th><th>tipo Contenido</th><th>Administracion</th><th>comprar</th></tr>
        <%
            ResultSet result;
            String cad = request.getParameter("txtBusca");
            int agotado = 0;
            result = cn.medicamento.medicamento.obtenerMed(cad);
            while(result.next())
            {
                if (result.getInt("cantidad") > 0)
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
                    out.write("<td><form method='post' action='compra.jsp'><input type ='hidden' id='idMed' name='idMed' value = '" + result.getString("idMedicamentos") + "'/><input type='image' src='img/compra.jpg' width='40px' height='30px' onclick='submit()'/></form></td>");
                    out.write("</tr>");
                }
                else
                {
                    agotado = 1;
                }
            }
            if(result.absolute(1) == false || agotado == 1)
            {
                out.write("<center> no hay medicamento</center>");
            }
        %>
        </table>
        </center>
    </body>
</html>
