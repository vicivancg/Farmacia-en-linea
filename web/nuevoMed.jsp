<%-- 
    Document   : nuevoMed
    Created on : 22/05/2013, 07:00:01 PM
    Author     : Psitec
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo medicamento</title>
        <script type="text/javascript">
            function valida ()
            {
                if (document.getElementById("txtNom").value != '' && document.getElementById("txtAct").value != '' && document.getElementById("txtPres").value != '' && document.getElementById("txtLab").value != '' && document.getElementById("txtDescripcion").value != '' && document.getElementById("txtPrecio").value > 0.1 && document.getElementById("txtPrecio").value != '' && document.getElementById("txtContenido").value > 0.0 && document.getElementById("txtContenido").value != '')
                    {
                        document.getElementById("frm").submit();
                    }
                    else
                        {
                            alert("por favor verifica la informacin de los campos");
                        }
            }
        </script>
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
    <center>Nuevo Medicamento</center>
    <form id="frm" name="frm" method="post" action="nmed.jsp">
            Nombre Medicamento <input type="text" id="txtNom" name="txtNom"/><br/><br/>
            sustancia Activa  <input type="text" id="txtAct" name="txtAct"/><br/><br/>
            presentacion <input type="text" id="txtPres" name="txtPres"/><br/><br/>
            laboratorio <input type="text" id="txtLab" name="txtLab"/><br/><br/>
            cantidad  
            <select id="tbCantidad" name="tbCantidad">
                <%
                    int i = 1;
                    for (i=1;i<=1000;i++)
                    {
                        out.write("<option value='"+ i + "'>"+ i +"</option>");
                    }
                %>
            </select><br/><br/>
            descripcion <br/><textarea id="txtDescripcion" name="txtDescripcion" cols="20" rows="5"></textarea><br/><br/>
            precio <input type="number" id="txtPrecio" name="txtPrecio" step="0.01"/><br/><br/>
            Contenido de producto <input type="number" id="txtContenido" name="txtContenido" step="0.01"/>
            <select id="cbTipo" name="cbTipo">
                <option value="1"> ml </option>
                <option value="2"> mg </option>
                <option value="3"> unidades </option>
                <option value="4"> otro </option>
            </select><br/><br/>
            via de administracion
            <select id="cbVia" name="cbVia">
                <option value="1"> oral </option>
                <option value="2"> inhalacion </option>
                <option value="3"> percutanea </option>
                <option value="4"> topica </option>
                <option value="5"> rectal </option>
                <option value="6"> parenteral </option>
                <option value="7"> otra </option>
            </select><br/><br/>
            <select id="cbCat" name="cbCat">
                <%
                ResultSet resultado;
                resultado = cn.medicamento.medicamento.obtenerCat();
                while(resultado.next())
                {
                    out.write("<option value = " + resultado.getString("idCategorias") + ">" + resultado.getString("nombreCategoria") + "</option>");
                }
                %>
            </select>
            <input type="button" id="btnNuevoMed" id="btnNuevoMed" value="nuevo medicamento" onclick="valida()">
        </form>
    </body>
</html>
