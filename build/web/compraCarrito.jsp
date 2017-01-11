<%-- 
    Document   : compraCarrito
    Created on : 26/05/2013, 02:49:53 PM
    Author     : Psitec
--%>

<%@page import="cn.orden.orden"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="css/images/bg.jpg">
        <%
            //obtener arreglo
            orden [] myOrden;
            orden ordenAct = new orden ();
            myOrden = (orden[]) session.getAttribute("carrito");
            double total = 0;
            int comprador = 0;
            String fecha = "";
            for (int i =0; i<15; i++)
            {
                if (myOrden[i] != null)
                {
                   total += myOrden[i].total;
                   fecha = myOrden[i].fecha;
                   comprador = myOrden[i].comprador;
                }
            }
            ordenAct.realizaOrden(comprador, total, fecha);
            
            int idOrden = 0;
            idOrden = ordenAct.obtieneId();
            
            for (int i =0; i<15; i++)
            {
                if (myOrden[i] != null)
                {
                    ordenAct.generaItem(idOrden, myOrden[i].producto,myOrden[i].cantidad);
                }
            }
            
            for (int i =0; i<15; i++)
            {
                myOrden[i] = null;
            }
            session.removeAttribute("carrito");
            session.setAttribute("carrito", myOrden);
            response.sendRedirect("mainCliente.jsp");
            //metodo que guarde en la base
            //vaciar arreglo
            //regresar a mainCliente
        %>
    </body>
</html>
