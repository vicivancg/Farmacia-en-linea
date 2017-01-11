<%--
    Document   : index
    Created on : 22/05/2013, 07:55:15 PM
    Author     : Psitec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <script type="text/javascript">
            function valida ()
            {
                if (document.frm.txtnombre.value == "" || document.frm.txtap.value == ""
                     && document.frm.txtam.value == "" || document.frm.txtedad.value == ""
                     && document.frm.txtcalle.value == "" || document.frm.txtnumint.value == ''
                     && document.frm.txtnumext.value == '' || document.frm.txtcp.value == ''
                     && document.frm.txtcol.value == '' || document.frm.txtdel.value == ''
                     && document.frm.txtuser.value == '' || document.frm.txtpass.value == '')
                    {alert("Llene Todos Los Campos!");}
             
                else
                    {document.getElementById("frm").submit();}
                      
            }
            
  
  
        </script>
        
      </head>
    <body background="css/images/bg.jpg">
        
        <form id="frm" name="frm" runat="server" method="post" action="ncliente.jsp">
            <table bgcolor="4C4949" align="center" border="1px" width="100%" height="50"> 
                <tr>
                    <td>
                    <font size="10" color="white">Registro</font>
                    </td>
                    <td align="center">
                    <font size="20"><input type="button" value="Guardar" onclick="valida();"/></font>
                    </td>
                </tr>
               
            </table>
            </br>
            <blockquote><h1>Información Personal</h1></blockquote>
     
            <blockquote> <table align="left" border="1px" width="70%" height="300" bgcolor="3329F2"> 
                    <tr>
                        <td bgcolor="9FF6FF">
        
        NOMBRE           
        <input type="text" id="txtnombre" name="txtnombre" />
        APELLIDO PATERNO 
        <input type="text" id="txtap"     name="txtap"     />
        APELLIDO MATERNO 
        <input type="text" id="txtam"     name="txtam"     /></br></br>
        EDAD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="number" id="txtedad"   name="txtedad"   /></br></br></br>
        CALLE &nbsp;&nbsp;&nbsp;&nbsp;     
        <input type="text" id="txtcalle"  name="txtcalle"  />
        NUMERO INTERNO&nbsp;   
        <input type="number" id="txtnumint" name="txtnumint" />
        NUMERO EXTERNO&nbsp;&nbsp;&nbsp;   
        <input type="number" id="txtnumext" name="txtnumext" /></br></br>
        C.P.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             
        <input type="number" id="txtcp"     name="txtcp"     /> 
        COLONIA          
        <input type="text" id="txtcol"    name="txtcol"    /> 
        &nbsp; DELEGACIÓN       
        <input type="text" id="txtdel"     name="txtdel"   /> 
        
        
                        </td> 
                    </tr>
                    
            </table>
            </blockquote>
            
            
            <table align="right" border="1px" width="30%" height="300" bgcolor="3329F2"> 
                <tr>
                    <td bgcolor="9FF6FF" align="center">
                        <font align="right" size="5"><b>CUENTA</b></font></br></br></br>
                      
                      NOMBRE DE USUARIO </br></br> 
                      <input type="text" id="txtuser"  name="txtuser"   /> 
                      </br></br>
                      PASSWORD</br></br>
                      <input type="password" id="txtpass"  name="txtpass"   /> 
                     
                    </td>
                </tr>
                
                
                
            </table>
            </br></br></br></br></br></br></br></br></br></br></br>
            </br></br></br></br></br></br></br></br></br></br></br>
            
            <table border="1px" bgcolor="4C4949"  border="1px" width="100%" height="30">
                <tr><td align="center"><font color="white" size="4">Farmacia Online</font></td></tr>
            </table>
            
            
            
            
            
        </form>
        
    </body>
</html>
