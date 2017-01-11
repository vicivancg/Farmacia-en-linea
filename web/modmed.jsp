<%-- 
    Document   : modmed
    Created on : 23/05/2013, 06:58:02 AM
    Author     : Psitec
--%>

<%@page import="cn.medicamento.medicamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="css/images/bg.jpg">
        <%
            medicamento medicamentoAct = new medicamento();
            int idi = (Integer) session.getAttribute("idMed");
            medicamentoAct.setId(idi);
            String nombre=new String(request.getParameter("txtNom").getBytes("ISO-8859-1"),"UTF-8");
            medicamentoAct.setNombre(nombre);
            String sustancia = new String(request.getParameter("txtAct").getBytes("ISO-8859-1"),"UTF-8");
            medicamentoAct.setSustancia(sustancia);
            String pres = new String(request.getParameter("txtPres").getBytes("ISO-8859-1"),"UTF-8");
            medicamentoAct.setPresentacion(pres);
            String lab = new String(request.getParameter("txtLab").getBytes("ISO-8859-1"),"UTF-8");
            medicamentoAct.setLaboratorio(lab);
            int cantidad = Integer.parseInt(request.getParameter("tbCantidad"));
            medicamentoAct.setCantidad(cantidad);
            String descripcion = new String(request.getParameter("txtDescripcion").getBytes("ISO-8859-1"),"UTF-8");
            medicamentoAct.setDescripcion(descripcion);
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            medicamentoAct.setPrecio(precio);
            double contenido = Double.parseDouble(request.getParameter("txtContenido"));
            medicamentoAct.setContenido(contenido);
            int tipo = Integer.parseInt(request.getParameter("cbTipo"));
            medicamentoAct.setTipoCant(tipo);
            int via = Integer.parseInt(request.getParameter("cbVia"));
            medicamentoAct.setViaAdmin(via);
            int categoria = Integer.parseInt(request.getParameter("cbCat"));
            medicamentoAct.setCategoria(categoria);
            try
            {
              medicamentoAct.modifica();
              response.sendRedirect("mainAdmin.jsp");
            }catch (Exception e)
            {
                out.write("no se pudo generar el medicameento");
            }
        %>
    </body>
</html>
