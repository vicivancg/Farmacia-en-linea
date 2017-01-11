<%-- 
    Document   : venta1
    Created on : 23/05/2013, 12:12:55 PM
    Author     : Psitec
--%>

<%@page import="cn.administrador.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busca tu medicamento</title>
        <script type="text/javascript">
            function valida ()
            {
                if(document.getElementById("txtBusca").value != '')
                {
                    document.getElementById("buscaMed").submit();
                }
                else
                {
                    alert("introduce un nombre de medicamento a buscar");
                }
            }
        </script>
         <link rel="stylesheet" type="text/css" href="<link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>">
         <style>
      body {
          
       font-family: 'Merriweather Sans', sans-serif;
  font-size: 30px;
  text-shadow: 5px 5px 5px #aaa;
      }
      
     
    </style>
    </head>
    <body background="css/images/bg.jpg">
        <div>
            Introduce el nombre del medicamento que buscas
        </div>
        <form id="buscaMed" name="buscaMed" method="post" action="venta2.jsp">
            <input type="text" id="txtBusca" name="txtBusca" placeholder="nombre de medicamento"/>
            <input type="button" id="btnBusca" name="btnBusca" value="buscar medicamento" onclick="valida()"/>
        </form>
    </body>
</html>
