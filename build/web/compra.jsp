<%-- 
    Document   : compra
    Created on : 23/05/2013, 12:46:52 PM
    Author     : Psitec
--%><%@page import="java.sql.ResultSet"%>


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
            int id = 0;
            try
            {
                id = Integer.parseInt(request.getParameter("idMed"));
            }
            catch (Exception e)
            {
                id = Integer.parseInt(request.getParameter("idMed1"));
            }
            session.setAttribute("idMed1", id);
            double inventario=0;
            double i = 0;
            out.write("<center>Detalle de compra</center><br/><br/>");
            result = cn.medicamento.medicamento.obtenerMedicamento(id);
            while(result.next())
            {
                if (result.getDouble("cantidad") > 0.0)
                {
                out.write("nombre : " + result.getString("nombre")+"<br/><br/>");
                out.write("Sustancia Activa : " + result.getString("sustanciaActiva")+"<br/><br/>");
                out.write("Presentacion : " + result.getString("presentacion")+"<br/><br/>");
                out.write("Laboratorio : " + result.getString("laboratorio")+"<br/><br/>");
                out.write("contenido : " + result.getString("contenido") + " " + result.getString("tipoCantidad")+"<br/><br/>");
                 out.write("via administracion : " + result.getString("viaAdmin")+"<br/><br/>");
                out.write("precio $: " + result.getString("precio")+"<br/><br/>");
                inventario = result.getDouble("cantidad");
                out.write("seleccione cantidad a comprar <br/><br/>");
                out.write("<form method='get' action='compra2.jsp'><select id='cant' name='cant'>");
                for(i=1;i<=inventario;i++)
                {
                    out.write("<option value = "+i+">"+ i +"</option>");
                }
                out.write("</select><br/><br/>");
                // + "/>");
                out.write("<input type='submit' value= 'comprar'/>");
                }
        
            }
        %>
    </body>
</html>

