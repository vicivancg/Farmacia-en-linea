<%-- 
    Document   : eliminaMed
    Created on : 23/05/2013, 06:16:40 AM
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
    <body background="/css/images/bg.jpg">
        <%
            medicamento medicamentoAct = new medicamento();
            int idi = (Integer) session.getAttribute("idMed");
            medicamentoAct.setId(idi);
             try
            {
              medicamentoAct.elimina();
              response.sendRedirect("mainAdmin.jsp");
            }catch (Exception e)
            {
                out.write("no se pudo eliminar el medicameento");
            }
        %>
    </body>
</html>
