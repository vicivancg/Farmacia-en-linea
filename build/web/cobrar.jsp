<%-- 
    Document   : cobrar
    Created on : 27/05/2013, 11:50:17 AM
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
    <body>
        <%
            int idOrden = Integer.parseInt(request.getParameter("txtOrden"));
            orden ordenAct = new orden();
            ordenAct.cobrar(idOrden);
            response.sendRedirect("ordpend.jsp");
        %>
    </body>
</html>
