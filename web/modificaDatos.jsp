<%-- 
    Document   : modificaDatos
    Created on : 21/05/2013, 10:55:38 PM
    Author     : Psitec
--%>

<%@page import="cn.administrador.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modifica tus datos</title>
    <script type="text/javascript">
    function valida()
    {
            if(document.getElementById("nombre").value == "")
            {
                    alert("introduce Nombre");
            }
            else if (document.getElementById("apP").value == "")
            {
                    alert("introduce apellido paterno");
            }
            else if (document.getElementById("apM").value == "")
            {
                    alert("introduce apellido materno");
            }
            else if (document.getElementById("user").value == "")
            {
                    alert("introduce nombre de usuario");
            }
            else if (document.getElementById("cont").value == "")
            {
                    alert("introduce una contraseña");
            }
            else if (document.getElementById("cargo").value == "")
            {
                    alert("introduce tu cargo");
            }
            else
            {
                document.getElementById("frmModifica").submit();
            }
    }
    </script>
    
    <link rel="stylesheet" type="text/css" href="<link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>">
    <style>
      body {
          
       font-family: 'Merriweather Sans', sans-serif;
  font-size: 30px;
  text-shadow: 5px 5px 5px #aaa;
      }
      
     
    </style>
    </head>
    <body background="css/images/bg.jpg">
        <%
             int id = (Integer) session.getAttribute("id_Admin");
            administrador adminAct = new administrador();
            adminAct.generaAdmin(id);
        %>
        <center><form id="frmModifica" name="frmModifica" method="post" action="modifica.jsp">
            <br/>DATOS DEL REGISTRO<br/>
            <p>Nombre &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;
                <input type="text" name="nombre" id="nombre" value="<%out.write(adminAct.getNombre());%>" />
            </p>
            <p>Apellido Paterno&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="text" name="apP" id="apP" value="<%out.write(adminAct.getApPat());%>" />
            </p>
            <p>
              <label for="apP"></label>
              Apellido Materno&nbsp;&nbsp;&nbsp;
              <input type="text" name="apM" id="apM" value="<%out.write(adminAct.getApMat());%>" />
            </p>
            <p>
              <label for="user"></label>
              Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <input type="text" name="user" id="user" value="<%out.write(adminAct.getUsrNom());%>" />
            </p>
            <p>
              <label for="cont"></label>
              Contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
              <input type="text" name="cont" id="cont" value="<%out.write(adminAct.getUsrPass());%>" />
            </p>
            <p>
              <label for="cargo">Cargo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
              <input type="text" name="cargo" id="cargo" value="<%out.write(adminAct.getCargo());%>" />
            </p>
            <p>
              <input type="button" name="btnModifica" id="btnModifica" value="Modificar Datos" onclick="valida()" />
            </p>
            <p>&nbsp;</p>
            </form></center>>
        
    </body>
</html>
