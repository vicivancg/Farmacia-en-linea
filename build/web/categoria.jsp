<%-- 
    Document   : categoria
    Created on : 22/05/2013, 06:38:37 PM
    Author     : Psitec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="css/images/bg.jpg">
        <%
         String categoria =new String(request.getParameter("txtCategoria").getBytes("ISO-8859-1"),"UTF-8");
         try
         {
             cn.administrador.administrador.agregaCategoria(categoria);
             out.write("la categoria se agrego con exito");
             response.sendRedirect("mainAdmin.jsp");
         }
         catch (Exception e)
         {
             out.write("la categoria no se agrego con exito");
         }
         
         
        %>
    </body>
</html>
