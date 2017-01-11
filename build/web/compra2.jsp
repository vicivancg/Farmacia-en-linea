<%-- 
    Document   : compra2
    Created on : 25/05/2013, 02:11:50 AM
    Author     : Psitec
--%>
<%@page session="true" %>
<%@page import="cd.usuario.usuario"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="cn.orden.orden"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="css/images/bg.jpg">
        <%
            try
            {

                ResultSet result = null;
                int id = (Integer) session.getAttribute("idMed1");
                session.removeAttribute("idMed1");
                result = cn.medicamento.medicamento.obtenerMedicamento(id);
                double total = 0;
                double precio = 0;
                double cantidad = Double.parseDouble(request.getParameter("cant"));
                String nombre = "";
                result.next();
                nombre = result.getString("nombre");
                precio = result.getDouble("precio");
                usuario.cierra();
                total = precio * cantidad;
                orden myorden = new orden();
                myorden.producto = id;
                myorden.total = total;
                HttpSession ses = request.getSession();
                myorden.comprador = (Integer) ses.getAttribute("id_Cliente");
                orden  ord [];
                ord = (orden[]) session.getAttribute("carrito");
                session.removeAttribute("carrito");
                Calendar fechaAct = Calendar.getInstance();
                String dia = Integer.toString(fechaAct.get(Calendar.DATE));
                String mes = Integer.toString(fechaAct.get(Calendar.MONTH)+1);
                String año = Integer.toString(fechaAct.get(Calendar.YEAR));
                myorden.fecha = año + "-" + mes + "-" + dia;
                myorden.nombre = nombre;
                myorden.cantidad = (int) cantidad;
                boolean lleno = false;
                boolean existe = false;
                for (int j=0;j<15;j++)
                {
                    if(ord[j] != null)
                    {
                        if (ord [j].producto == myorden.producto)
                        {
                            existe = true;
                            break;
                        }
                    }
                }
                if (existe == false)
                {
                    for(int i=0; i<15;i++)
                    {
                        if (ord [i] != null)
                        {
                            lleno = true;
                        }
                        else
                        {
                            lleno = false;
                            break;
                        }
                    }

                    if(lleno == false)
                    {
                        for(int i=0; i<15;i++)
                        {
                            if (ord [i] == null)
                            {
                                ord [i] = myorden;
                                session.setAttribute("carrito", ord);
                                session.removeAttribute("nueva");
                                session.setAttribute("nueva", 0);
                                break;
                            }
                        }
                        session.removeAttribute("id_Cliente");
                        session.setAttribute("id_Cliente", myorden.comprador);
                        response.sendRedirect("mainCliente.jsp");
                    }
                    else
                    {
                        out.write("no pudes comprar mas productos");
                        session.removeAttribute("id_Cliente");
                        session.setAttribute("id_Cliente", myorden.comprador);
                    }
                }

                if (existe == true)
                {
                    session.setAttribute("carrito", ord);
                    session.removeAttribute("nueva");
                    session.setAttribute("nueva", 0);
                    out.write("ya haz hecho una orden de este producto, elimina la orden y vuelve a generarla");
                    response.sendRedirect("mainCliente.jsp");
                }
            }
            catch(SQLException e)
            {
                out.write("ha sucedido un error " + e.getMessage());
            }
            
          %>
    </body>
</html>
