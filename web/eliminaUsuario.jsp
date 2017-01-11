<%-- 
    Document   : eliminaUsuario
    Created on : 22/05/2013, 12:05:40 AM
    Author     : Psitec
--%>

<%@page import="cn.usuario.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="/css/images/bg.jpg">
        <%
            usuario usuarioAct = new usuario();
            int id = Integer.parseInt(request.getParameter("txtId"));
            try
            {
                usuarioAct.elimina(id);
                response.sendRedirect("mainAdmin.jsp");
            }
            catch(Exception e)
            {
                out.write("no se pudo eliminar el usuario");
            }
        %>
    </body>
</html>
