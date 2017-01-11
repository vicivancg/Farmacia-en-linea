<%-- 
    Document   : nuevoAdmin
    Created on : 20/05/2013, 10:15:48 PM
    Author     : Psitec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cn.administrador.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function muestramsg ()
            {
                alert("se ha creado correctamente el nuevo administrador");
            }
        </script>
    </head>
    <body background="css/images/bg.jpg">
        <%
        administrador adminAct = new administrador();
        String nombre=new String(request.getParameter("nombre").getBytes("ISO-8859-1"),"UTF-8");
        adminAct.setNombre(nombre);
        String apP=new String(request.getParameter("apP").getBytes("ISO-8859-1"),"UTF-8");
        adminAct.setApPat(apP);
        String apM=new String(request.getParameter("apM").getBytes("ISO-8859-1"),"UTF-8");
        adminAct.setApMat(apM);
        String user =new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
        adminAct.setUsrNom(user);
        String cont =new String(request.getParameter("cont").getBytes("ISO-8859-1"),"UTF-8");
        adminAct.setUsrPass(cont);
         String cargo =new String(request.getParameter("cargo").getBytes("ISO-8859-1"),"UTF-8");
        adminAct.setCargo(cargo);
        try
        {
            adminAct.nuevoAdmin();
            out.write("el administrador se ha creado con exito");
            %>
            muestramsg();
            <%
            response.sendRedirect("mainAdmin.jsp");
        }
        catch(Exception e)
        {
            out.write("no se pudo generar el administrador");
        }
        
        %>
    </body>
</html>
