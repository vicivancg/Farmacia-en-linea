<%-- 
    Document   : modifica
    Created on : 21/05/2013, 11:17:10 PM
    Author     : Psitec
--%>

<%@page import="cn.administrador.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="css/images/bg.jpg">
        <%
        int id = (Integer) session.getAttribute("id_Admin");
        administrador adminAct = new administrador();
        adminAct.setId(id);
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
            adminAct.modificaAdmin();
            out.write("el administrador se ha creado con exito");
            %>
            <script type="text/javascript">
            function muestramsg ()
            {
                alert("se ha modificado correctamente el nuevo administrador");
            }
            </script>
            <%
            response.sendRedirect("mainAdmin.jsp");
        }
        catch(Exception e)
        {
            out.write("no se pudo modificar el administrador");
        }
        
        %>
    </body>
</html>
