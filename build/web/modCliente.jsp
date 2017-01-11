<%-- 
    Document   : modCliente
    Created on : 23/05/2013, 10:27:51 AM
    Author     : Psitec
--%>

<%@page import="cn.cliente.cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="css/images/bg.jpg">
        <%
            int id = (Integer) session.getAttribute("id_Cliente");
            cliente clienteAct = new cliente();
            clienteAct.setId(id);
            String nombre= new String(request.getParameter("txtnombre").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setNombre(nombre);
            String Ap= new String(request.getParameter("txtap").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setApPat(Ap);
            String Am= new String(request.getParameter("txtam").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setApMat(Am);
            String calle= new String(request.getParameter("txtcalle").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setCalle(calle);
            String colonia= new String(request.getParameter("txtcol").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setColonia(colonia);
            String delegacion= new String(request.getParameter("txtdel").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setDelegacion(delegacion);
            String user= new String(request.getParameter("txtuser").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setUsrNom(user);
            String pass= new String(request.getParameter("txtpass").getBytes("ISO-8859-1"),"UTF-8");
            clienteAct.setUsrPass(pass);
            
            int edad = Integer.parseInt(request.getParameter("txtedad"));
            clienteAct.setEdad(edad);
            int numint= Integer.parseInt(request.getParameter("txtnumint"));
            clienteAct.setNumInt(numint);
            int numext= Integer.parseInt(request.getParameter("txtnumext"));
            clienteAct.setNumExt(numext);
            int cp= Integer.parseInt(request.getParameter("txtcp"));
            clienteAct.setCodigoPostal(cp);
            try
            {
                clienteAct.modificaCliente();
                response.sendRedirect("mainCliente.jsp");
            }catch(Exception e)
            {
                out.write("no se pudo modificar");
            }
        %>
    </body>
</html>
