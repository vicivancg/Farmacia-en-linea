<%-- 
    Document   : mainCliente
    Created on : 20/05/2013, 02:22:42 AM
    Author     : Psitec
--%>

<%@page import="cn.orden.orden"%>
<%@page import="cn.cliente.cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head
        <link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Carrois+Gothic+SC' rel='stylesheet' type='text/css'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Cliente</title>
        <style type="text/css">

            
            
            .Texto
            {
                float:bottom;
            }
            #headerCliente
            {
                font-family: 'Carrois Gothic SC', sans-serif; font-size: 28px;
            }
            
            .columnas
            {
                text-align: center;
                border-spacing: 30px;
                font-family: 'Merriweather Sans', sans-serif;
            }
            
            .columnas td
            {
                width: 400px;
            }
            
            .columnas img:hover
            {
                opacity: .60;
            }
            
        </style>
        <script type="text/javascript">
            
            function cerrar()
            {
                window.location="index.html";
                
                
            }
            
            
            
        </script>
 
    </head>
    <body>
        <%
             cliente clienteAct = new cliente ();
             int id = (Integer) session.getAttribute("id_Cliente");
             clienteAct.generaCliente(id);
             int nueva = (Integer) session.getAttribute("nueva");
            if (nueva == 1)
            {

                orden arreglo [];
                arreglo = new orden[15];
                session.setAttribute("carrito", arreglo);
            }
        %>
        <div id="headerCliente">
            <center><P><%out.write("Bienvenido a tu cuenta  " + clienteAct.getNombre() + " " + clienteAct.getApPat() + " " + clienteAct.getApMat());%></p></center>
        </div>
        <center>
        <table id="tablaMenu" class="columnas">
            <tr>
                <td><a id="linknuevoAdmin" href="modificaCliente.jsp"><center><img src="img/usuario3.jpg" width="220px" height="220px"/></center></a></td>
                <td> <a id="linknuevoAdmin" href="venta1.jsp"><img src="img/medicina.jpg" width="220px" height="220px"/></a></td>
                <td><a id="linknuevoAdmin" href="carrito.jsp"><img src="img/carrito.jpg" width="220px" height="220px"></img></a></td>
            </tr>
            <tr>
                <td><p>Puedes modificar los datos de tu cuenta</p></td>
                <td><p>Puedes buscar algun medicamento y comprarlo</p></td>
                <td><p>puedes verificar y finalizar tu carrito</p></td>
            </tr>
            <tr>
                <td><a id="linknuevoAdmin" href="historialCompra.jsp"><center><img src="img/historial.jpg" width="220px" height="220px"/></center></a></td>
            </tr>
            <tr>
                <td><p>revisa las compras que haz realizado</p></td>
            </tr>
            
           
        </table>
            <input type="button" value="Cerrar Sesion" onclick="cerrar()"/>
    </center>
    </body>
</html>
