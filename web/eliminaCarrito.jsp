<%-- 
    Document   : eliminaCarrito
    Created on : 26/05/2013, 01:54:51 AM
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
    <body background="/css/images/bg.jpg">
        <%
            int producto = 0;
            producto = Integer.parseInt(request.getParameter("txtProd"));
            orden myorden[];
            myorden = (orden[]) session.getAttribute("carrito");
            session.removeAttribute("carrito");
            myorden[producto] = null;
            session.setAttribute("carrito", myorden);
            response.sendRedirect("carrito.jsp");
        %>
    </body>
</html>
