<%-- 
    Document   : cambiaregistro
    Created on : 10-abr-2014, 10:48:45
    Author     : Pruebas
--%>

<%@page import="paquete.conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="paquete.usuarios"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/estiloscambiaregistro.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Cambiar datos registro</title>
    </head>
    
     

<% 
    if(session.getAttribute("idsession")!=null)
        {
     int idesesion = (Integer)session.getAttribute("idsession");
     ResultSet resultado25 = usuarios.datosUsuario(idesesion);
     Integer administrador = (Integer) session.getAttribute("administrador");

if (request.getParameter("id")!=null){
          idesesion = Integer.parseInt(request.getParameter("id"));
          resultado25 = usuarios.datosUsuario(idesesion);
}%>


<% 
     
        
         
     
         String vdni="";
         String vpassword="";
         String vnombre="";
         String vapellidos="";
         String vemail="";
         String vtelefono="";
         int vadministrador= 0;
     
     while(resultado25.next()){
         int vid= resultado25.getInt("id");
         request.getSession().setAttribute( "idsesion2",vid);
         vdni= resultado25.getString("dni");
         vpassword= resultado25.getString("password");
         vnombre= resultado25.getString("nombre");
         vapellidos= resultado25.getString("apellidos");
         vemail= resultado25.getString("email");
         vtelefono= resultado25.getString("telefono");
         vadministrador= resultado25.getInt("administrador");
     
     }

%>

<body>
        
        <h1 style="color:white; text-align: left;">Ayuntamiento de Argamasilla de Alba</h1>
       <div id="logo">
        
                <img src="images/logo.png" />
        </div>
        <h2 style="color:white">Alquiler de Instalaciones deportivas</h2>
        <%
     Integer sesion = (Integer) session.getAttribute("idsession");
            ResultSet datos = usuarios.datosUsuario(sesion);
            String nombre= "";
            String apellidos="";
            while(datos.next())
            {
              nombre = datos.getString("nombre");
              apellidos = datos.getString("apellidos");
            
            }
        %>
        <h5 style="color:white">Usuario: <%= nombre+" "+apellidos%></h5>
        
        <div id='cssmenu'>
        <ul>
         <li><a href='tabla.jsp'><span>Volver</span></a></li>
         <li><a href='index.jsp'><span>Salir</span></a></li>
        </ul>
            
            </br>
        
            <% if (request.getParameter("e")!=null){
            if (request.getParameter("e").equals("2")){
                %><h1 style="color:white;">Campos Nombre, Apellidos o Contraseña vacíos</h1>
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




</br>

            
        <div id="registro">
            </br>
        <form id="form1" name="form1" method="post" action="controladorcambiaregistro2">
            </br>
  <p><h1>CAMBIAR DATOS DE REGISTRO</h1> <p>
  <table>
      
  
  <tr>
  <p>
      <tr>
    <td><label for="password">Contraseña</label></td>
    <td><input type="password" name="password58" id="password58" value="<% if(session.getAttribute("password58")==null){
          out.println("");
          }else{
    out.println(session.getAttribute("password58"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="nombre">Nombre</label></td>
    <td><input type="text" name="nombre58" id="nombre58" value="<% if(session.getAttribute("nombre58")==null){
          out.println(vnombre);
          }else{
    out.println(session.getAttribute("nombre58"));
}%>" /></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="apellidos">Apellidos</label></td>
    <td><input type="text" name="apellidos58" id="apellidos58" value="<% if(session.getAttribute("apellidos58")==null){
          out.println(vapellidos);
          }else{
    out.println(session.getAttribute("apellidos58"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="email">Email</label></td>
    <td><input type="text" name="email58" id="email58" value="<% if(session.getAttribute("email58")==null){
          out.println(vemail);
          }else{
    out.println(session.getAttribute("email58"));
}%>"/></td>
    </tr>
  </p>
  <p>
      <tr>
    <td><label for="telefono">Teléfono</label></td>
    <td><input type="text" name="telefono58" id="telefono58" value="<% if(session.getAttribute("telefono58")==null){
          out.println(vtelefono);
          }else{
    out.println(session.getAttribute("telefono58"));
    
    
}%>"/></td>
    </tr>
  </p>
  <p>
      
      <tr>
    <td><%if(administrador==1){%><label for="administrador">Administrador</label><%}%></td>
    <td><input type="text" name="administrador" id="administrador" value="<% out.println(vadministrador);%>" <%if(administrador!=1){%>hidden="hidden"<%}%>/></td>
    </tr>
  </p>
  <p>
      
      <tr>
          <td></td>
    <td><input type="submit" name="enviar" id="enviar" value="Enviar" /></td>
    
    </tr>
  </p>
  </table>
</form>
        </div>
    <%} else {%>
        
    <h2 style="color:white">No puedes acceder a esta página</h2>
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    
    <%}%>
    </body>
</html>
