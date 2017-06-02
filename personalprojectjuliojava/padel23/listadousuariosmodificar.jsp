<%-- 
    Document   : listadousuariosmodificar
    Created on : 22-abr-2014, 10:51:56
    Author     : Pruebas
--%>

<%@page import="paquete.usuarios"%>
<%@page import="java.sql.ResultSet"%>
<link rel="stylesheet" type="text/css" href="css/estiloslistadousuariosmodificar.css"> 
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificar Usuarios</title>
        <script type="text/javascript" src="jquery-ui-1.9.2/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="javascript/ajax.js"></script>
    </head>

    <body>
        <%if(session.getAttribute("idsession")!=null)
        {
            
            
            Integer sesion = (Integer) session.getAttribute("idsession");
        Integer administrador = (Integer) session.getAttribute("administrador");
         if ( administrador == 1){%>
         <h1 style="color:white; text-align: left;">Ayuntamiento de Argamasilla de Alba</h1>
       <div id="logo">
        
                <img src="images/logo.png" />
        </div>
        <h2 style="color:white">Alquiler de Instalaciones deportivas</h2>
        <%
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
        
        <h1>Usuarios registrados</h1>
        <span id="loader">
            <img src="images/ajax-loader.gif" alt="ajax" />
        </span>
        <% ResultSet resultado;
            resultado = usuarios.datosTodosUsuarios();

            while (resultado.next()) {
                out.println("<div>");

                out.println("<strong>" + "DNI: " + "</strong>" + resultado.getString("dni"));
                out.println("<strong>" + "EMAIL: " + "</strong>" + resultado.getString("email"));
                out.println("<strong>" + "NOMBRE: " + "</strong>" + resultado.getString("nombre"));
                out.println("<strong>" + "APELLIDOS: " + "</strong>" + resultado.getString("apellidos"));
                out.println("<strong>" + "TELEFONO: " + "</strong>" + resultado.getString("telefono"));

        %>                                  

        <form action="ControladorTodosModificar?id=<% out.print(resultado.getInt("id"));%>" method="post">
            <input type="submit" value="cambiar">
        </form>
        <% if (resultado.getInt("administrador") != 1) {%>   

        <form action="ControladorBorrarUsuario?id=<% out.print(resultado.getInt("id"));%>" method="post">
            <input class="ajax_borrar" type="submit" value="Borrar Usuario">
            <span class="loader_gif">
                <img src="ajax-loader.gif" alt="ajax" />
            </span>            
        </form>
        <%}
        out.println("</div>");%>
        <%}
            out.println("</br>");%>
        </br></br>
         <%
    } else {%>
        
    <h2 style="color:white">No puedes acceder a esta página</h2>
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    
    <%}}else{%>
    <h2 style="color:white">Debes iniciar sesión para acceder</h2>  
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    <%}%> 
     
    </body>
</html>
