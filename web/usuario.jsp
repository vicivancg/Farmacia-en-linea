<%-- 
    Document   : index
    Author     : Psitec
--%>

<%@page import="javax.swing.JTable"%>
<%@page import="cn.administrador.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="cd.usuario.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>farmacia en linea</title>
</head>

<body>
    <%
        ResultSet result = null;
        int id=0;
        boolean tipo=false;
        String usr = request.getParameter("txtNombre");
        String pass = request.getParameter("txtCont");
        result = usuario.obtenerUsuario(usr, pass);
        if (result.first() == false)
        {
            out.write("no se encontro usuario");
        }
        else
        {
                result.previous();
                result.next();
                tipo = result.getBoolean("tipoUsuario");
                if (tipo == true)
                {
                    id = Integer.parseInt(result.getString("id"));
                    session.setAttribute("id_Admin",id);
                    //request.getRequestDispatcher("mainAdmin.jsp").forward(request, response);
                    response.sendRedirect("mainAdmin.jsp");
                }
                else if( tipo == false)
                {
                    id = Integer.parseInt(result.getString("id"));
                    usuario.cierra();
                    session.setAttribute("id_Cliente",id);
                    session.setAttribute("nueva",1);
                    //request.getRequestDispatcher("mainCliente.jsp").forward(request, response);
                    response.sendRedirect("mainCliente.jsp");
                }
        }
        
    %>

</body>
</html>