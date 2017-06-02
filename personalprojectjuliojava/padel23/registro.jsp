<%-- 
    Document   : registro
    Created on : 27-feb-2014, 20:12:55
    Author     : Julio Jose
--%>
<link rel="stylesheet" type="text/css" href="css/estilosregistro.css"> 
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Registro</title>
    </head>
    <body>
        
        <% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("1")){
                %><h1 style="color:white;">Usuario Registrado</h1>
                <%
            }
}%>

<% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("2")){
                %><h1 style="color:white;">Campos DNI, Nombre, Apellidos o Contraseña vacíos</h1>
                <%
            }
}%>

<% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("3")){
                %><h1 style="color:white;">Email no válido</h1>
                <%
            }
}%>
<% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("4")){
                %><h1 style="color:white;">Email repetido</h1>
                <%
            }
}%>
<% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("5")){
                %><h1 style="color:white;">DNI no válido</h1>
                <%
            }
}%>

<% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("6")){
                %><h1 style="color:white;">Teléfono no válido</h1>
                <%
            }
}%>

        <div id="registro">
        <form id="form1" name="form1" method="post" action="ControladorRegistro2">
  <p><h1>FORMULARIO DE REGISTRO</h1> <p>
  <table>
      <tr>
          <td><label for="dni2">D.N.I.</label></td>
          <td><input type="text" name="dni2" id="dni2" value="<% if(session.getAttribute("dni")==null){
          out.println("");
          }else{
    out.println(session.getAttribute("dni"));
}%>"/></td>
  </tr>
  </p>
  <tr>
  <p>
      <tr>
    <td><label for="password">Contraseña</label></td>
    <td><input type="password" name="password2" id="password" value="<% if(session.getAttribute("password")==null){
          out.println("");
          }else{
    out.println(session.getAttribute("password"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="nombre">Nombre</label></td>
    <td><input type="text" name="nombre" id="nombre" value="<% if(session.getAttribute("nombre2")==null){
          out.println("");
          }else{
    out.println(session.getAttribute("nombre2"));
}%>" /></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="apellidos">Apellidos</label></td>
    <td><input type="text" name="apellidos" id="apellidos" value="<% if(session.getAttribute("apellidos")==null){
          out.println("");
          }else{
    out.println(session.getAttribute("apellidos"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="email">Email</label></td>
    <td><input type="text" name="email" id="email" value="<% if(session.getAttribute("email")==null){
          out.println("");
          }else{
    out.println(session.getAttribute("email"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="telefono">Teléfono</label></td>
    <td><input type="text" name="telefono" id="telefono" value="<% if(session.getAttribute("telefono")==null){
          out.println(" ");
          }else{
    out.println(session.getAttribute("telefono"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
          <td></td>
    <td><input type="submit" name="enviar" id="enviar" value="Enviar" /></td>
    <td><a href="index.jsp" style="color:#ffffff">Volver a inicio</a></td>
    </tr>
  </p>
  </table>
</form>
    
    </br>    </br>
    </br>
    </br>
    

    
    
    <p style="color:white;">PROTECCIÓN DE DATOS. En cumplimiento de lo establecido en la Ley Orgánica de 13-XII-1999,
        de Protección de Datos de Carácter Personal,se le informa que los datos de carácter personal facilitados en 
        el presente formulario, se utilizarán exclusivamente para el ejercicio de las competencias propias de esta 
        Administración y serán incorporados a los ficheros que conforman la base de datos del Ayuntamiento de Argamasilla 
        de Alba, ante el que podrá ejercitar los derechos de acceso, rectificación, cancelación y oposición dirigiéndose 
        al Registro General (Plaza de España, nº 1, 13710 ? Argamasilla deAlba (Ciudad Real).</p>
    </div>
    </body>
</html>
