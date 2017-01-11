<%-- 
    Document   : modificaMed
    Created on : 23/05/2013, 06:06:05 AM
    Author     : Psitec
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modifca medicamento</title>
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
    </head>
    <body background="css/images/bg.jpg">
        <%
            ResultSet result = null;
            int id = Integer.parseInt(request.getParameter("idMed"));
            session.setAttribute("idMed", id);
            result = cn.medicamento.medicamento.obtenerMedicamento(id);
            while(result.next())
            {
        %>
        <form id="frm" name="frm" method="post" action="modmed.jsp">
            Nombre Medicamento <input type="text" id="txtNom" name="txtNom" value ="<% out.write(result.getString("nombre")); %>"/><br/><br/>
            sustancia Activa  <input type="text" id="txtAct" name="txtAct" value ="<% out.write(result.getString("sustanciaActiva")); %>"/><br/><br/>
            presentacion <input type="text" id="txtPres" name="txtPres" value ="<% out.write(result.getString("presentacion")); %>"/><br/><br/>
            laboratorio <input type="text" id="txtLab" name="txtLab" value ="<% out.write(result.getString("laboratorio")); %>"/><br/><br/>
            cantidad  
            <select id="tbCantidad" name="tbCantidad">
                <%
                    int i = 1;
                    for (i=1;i<=1000;i++)
                    {
                        if (i == Integer.parseInt(result.getString("cantidad")))
                        {
                            out.write("<option selected value='"+ i + "'>"+ i +"</option>");
                        }
                        else
                        {
                            out.write("<option value='"+ i + "'>"+ i +"</option>");
                        }
                    }
                %>
            </select><br/><br/>
            descripcion <br/><textarea id="txtDescripcion" name="txtDescripcion" cols="20" rows="5"><% out.write(result.getString("descripcion")); %>"</textarea><br/><br/>
            precio <input type="number" id="txtPrecio" name="txtPrecio" step="0.01" value ="<% out.write(String.valueOf(result.getFloat("precio"))); %>"/><br/><br/>
            Contenido de producto <input type="number" id="txtContenido" name="txtContenido" step="0.01" value ="<% out.write(String.valueOf(result.getFloat("contenido"))); %>"/>
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
                    if(result.getString("categoria") == resultado.getString("idCategorias"))
                    {
                        out.write("<option selected value = " + resultado.getString("idCategorias") + ">" + resultado.getString("nombreCategoria") + "</option>");
                    }
                    else
                    {
                        out.write("<option  value = " + resultado.getString("idCategorias") + ">" + resultado.getString("nombreCategoria") + "</option>");
                    }
                }
                %>
            </select>
            <input type="button" id="btnNuevoMed" id="btnNuevoMed" value="modificar medicamento" onclick="valida()">
        </form>
        <%
            }
        %>
    </body>
</html>
