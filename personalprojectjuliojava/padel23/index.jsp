<%-- 
    Document   : login
    Created on : 27-feb-2014, 19:51:42
    Author     : Julio Jose
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/estiloslogin.css"> 
<%session.setAttribute("nombre2", null);
session.setAttribute("password", null);
session.setAttribute("nombre", null);
session.setAttribute("apellidos", null);
session.setAttribute("email", null);
session.setAttribute("dni", null);
session.setAttribute("telefono", null);
session.setAttribute("administrador",null);
session.setAttribute("idsession",null);

%>
<% if (request.getParameter("u")!=null){
            if (request.getParameter("u").equals("1")){
                %><h1 style="color:white;text-align: center;">Usuario registrado con éxito</h1>
                <%
            }
}%>

<% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("1")){
                %><h1 style="color:white;text-align: center;">Fallo al introducir dni o contraseña</h1>
                <%
            }
}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Acceso</title>
    </head>
    <body>
        <form id="form1" name="form1" method="post" action="ControladorPrincipal">
   <table>
       <tr>
  <p>
  
  <td><label for="dni">D.N.I</label></td>
  <td><input type="text" name="dni" id="dni" /></td>
  </p>
   </tr>
    <tr>
  <p>
    <td><label for="password">Contraseña</label></td>
    <td><input type="password" name="password" id="password" maxlength="10"/></td>
  </p>
  </tr>
  <tr>
  <p>
    <td><input type="submit" name="enviar" id="enviar" value="Entrar" /></td>
    </form>
    </br>  
 </p>
<td></br>
        <form action="registro.jsp" method="post">
            <input type="submit" value="Registrarse"></br>
        </form></td>
  </p>
  </tr>
  </table>

    </body>
</html>
