<%-- 
    Document   : mainAdmin
    Created on : 19/05/2013, 10:33:08 PM
    Author     : Psitec
--%>

<%@page import="cn.administrador.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Carrois+Gothic+SC' rel='stylesheet' type='text/css'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> menu administrador</title>
        <style type="text/css">

            
            
            .Texto
            {
                float:bottom;
            }
            #headerAdmin
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
            int id = (Integer) session.getAttribute("id_Admin");
            administrador adminActual = new administrador();
            adminActual.generaAdmin(id);
        %>
        <div id="headerAdmin">
            <center><P><%out.write("Bienvenido a su cuenta  " + adminActual.getNombre() +" "+adminActual.getApPat()+ " " + adminActual.getApMat());%></p></center>
        </div>
    <center>
        <table id="tablaMenu" class="columnas">
            <tr>
                <td><a id="linknuevoAdmin" href="nuevoAdmin.html"><center><img src="img/admin1.jpg" width="220px" height="220px"/></center></a></td>
                <td> <a id="linknuevoAdmin" href="modificaDatos.jsp"><img src="img/admin.jpg" width="220px" height="220px"/></a></td>
                <td><a id="linknuevoAdmin" href="buscaUsuario.jsp"><img src="img/usuarios2.jpg" width="220px" height="220px"/></a></td>
            </tr>
            <tr>
                <td><p>Puedes agregar a un nuevo usuario con privilegios de administrador</p></td>
                <td><p>Puedes modificar los datos de tu cuenta</p></td>
                <td><p>Puedes dar de baja clientes y administradores</p></td>
            </tr>
             <tr>
                <td> <a id="linknuevoM" href="nuevoMed.jsp"><center><img src="img/medicina.jpg" width="220px" height="220px" /></center></a></td>
                <td><a id="linkModificaM" href="muestraMed.jsp"><center><img src="img/medicina2.jpg" width="220px" height="220px"/></center></a></td>
                <td> <a href="categoria.html"><center><img src="img/categoria.jpg" width="220px" height="220px"/></center></a></td>
            </tr>
            <tr>
                <td><p>Puedes agregar un nuevo medicamento</p></td>
                <td><p>Puedes modificar o eliminar un medicamento</p></td>
                <td><p>agregar una categoria</p></td>
            </tr>
            
            <tr>
                <td> <a href="ordpend.jsp"><center><img src="img/cobro.jpg" width="220px" height="220px"/></center></a></td>
                <td> <a href="historialVentas.jsp"><center><img src="img/historial.jpg" width="220px" height="220px"/></center></a></td>
            </tr>
            <tr>
                <td><p>revisar ordenes pendientes</p></td>
                <td><p>obtener historial de ventas</p></td>
            </tr>
            
           
        </table>
        <input type="button" value="Cerrar Sesion" onclick="cerrar()"/>
        
    </center>
    </body>
</html>
