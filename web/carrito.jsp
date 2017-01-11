<%-- 
    Document   : carrito
    Created on : 25/05/2013, 04:28:14 AM
    Author     : Psitec
--%>

<%@page import="cn.orden.orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito De Compra</title>
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
            orden  ord [];
            ord = (orden[]) session.getAttribute("carrito");
            boolean algo = false;
            
            for (int j= 0; j < 15;j++)
            {
                if (ord[j] != null)
                {
                    algo = true;
                    break;
                }
            }
            
            if (algo == true)
            {
                out.write("<center>Carrito De Compra<br/><table border='1' width='80%'><tr><th>nombre</th><th>cantidad</th><th>total a pagar</th><th>fecha</th><th>eliminar</th></tr>");
                for (int i= 0; i < 15;i++)
                {
                    if (ord[i] != null)
                    {
                        out.write("<tr>");
                        out.write("<center><td>" + ord[i].nombre + "</td></center>");
                        out.write("<center><td>" + ord[i].cantidad + "</td></center>");
                        out.write("<center><td>" + ord[i].total + "</td></center>");
                        out.write("<center><td>" + ord[i].fecha + "</td></center>");
                         out.write("<center><td><form method='post' action='eliminaCarrito.jsp'><input id='txtProd' name='txtProd' type='hidden' value = " + i + " /><input type='image' src = 'img/carrito3.jpg' width='30px' height='30px' onclick='submit()'/></form></td></center>");
                        out.write("</tr>");
                    }
                }
                out.write("</table></center>");
                out.write("<form id='txtVenta' name='txtVenta' method='post' action='compraCarrito.jsp'><input type='submit' value ='finalizar carrito'></form>");
            }
            else
            {
                 out.write("aun no haz comprado ningun medicamento, realiza una busqueda y agrega medicamentos a tu carrito");
            }
        %>
    </body>
</html>
