<%-- 
    Document   : ordpend
    Created on : 27/05/2013, 05:52:41 AM
    Author     : Psitec
--%>

<%@page import="cn.cliente.cliente"%>
<%@page import="java.sql.*"%>
<%@page import="cn.orden.orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordenes pendientes</title>
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
            orden ordenAct = new orden();
            cliente clienteAct = new cliente();
            String fecha = "";
            double total = 0;
            int idOrden = 0;
            int aux;
            String nombreMed = "";
            ResultSet result = ordenAct.generaOrdenes();
            ResultSet result1 = null;
            out.write("<center><table border='1'><tr><th>cliente</th><th>fecha de orden</th><th>total a pagar</th><th>cobrar</th><th>eliminar</th></tr>");
            while(result.next())
            {
                if (result.getInt("pagada") == 0)
                {
                    clienteAct.generaCliente(Integer.parseInt(result.getString("idCliente")));
                    fecha = result.getString("fechaCompra");
                    total = result.getDouble("totalPagar");
                    idOrden = result.getInt("idOrden");
                    out.write ("<tr>");
                    out.write("<td>" + clienteAct.getNombre() + " " + clienteAct.getApPat() + " " + clienteAct.getApMat() + "</td>");
                    out.write("<td>" + fecha + "</td>");
                    out.write("<td>" + total + "</td>");
                    out.write("<center><td><form method='post' action='cobrar.jsp'><input id='txtOrden' name='txtOrden' type='hidden' value = " + idOrden + " /><input type='image' src = 'img/cobrar.png' width='30px' height='30px' onclick='submit()'/></form></td>");
                    out.write("<center><td><form method='post' action='eliminarOrden.jsp'><input id='txtOrden' name='txtOrden' type='hidden' value = " + idOrden + " /><input type='image' src = 'img/eliminar.png' width='30px' height='30px' onclick='submit()'/></form></td>");
                    out.write ("</tr>");
                    result1 = ordenAct.obtieneMedicamentos(idOrden);
                    while (result1.next())
                    {
                        out.write("<tr><td>");
                        out.write(result1.getString("numeroItems") + " ");
                       aux = result1.getInt("idMedicamento");
                       nombreMed = ordenAct.obtieneNombreMed(aux);
                       out.write(nombreMed);
                       out.write("</td></tr>");
                    }
                }
            }
            out.write("</table></center>");
        %>
    </body>
</html>
