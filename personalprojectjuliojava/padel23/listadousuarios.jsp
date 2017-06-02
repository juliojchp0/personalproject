<%-- 
    Document   : listadousuarios
    Created on : 08-abr-2014, 12:30:45
    Author     : Pruebas
--%>

<%@page import="paquete.reservas"%>
<%@page import="paquete.usuarios"%>
<%@page import="java.sql.ResultSet"%>
<link rel="stylesheet" type="text/css" href="css/estiloslistadousuarios.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="jquery-ui-1.9.2/themes/base/jquery-ui.css">
<script src="jquery-ui-1.9.2/jquery-1.8.3.js"></script>
<script src="jquery-ui-1.9.2/ui/jquery-ui.js"></script>
<script src="javascript/calendario.js"></script>
<script type="text/javascript" src="javascript/fecha.js"></script>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listado usuarios</title>
    </head>
    <body>
        
        
        
        
        
        
        
        
        <%  if(session.getAttribute("idsession")!=null)
        {
           
        
            String fechaccion =(String)session.getAttribute("fecha");
            if (request.getParameter("f") != null) 
                {
                fechaccion = request.getParameter("f");
                request.getSession().setAttribute("fecha", fechaccion);
                }
           Integer administrador;
           Integer sesion;
         
             sesion = (Integer) session.getAttribute("idsession");
             administrador = (Integer) session.getAttribute("administrador");
         
        
        
         if (administrador == 1)
         {%>
        <h1 style="color:white; text-align: left;">Ayuntamiento de Argamasilla de Alba</h1>
       <div id="logo">
        
                <img src="images/logo.png" />
        </div>
        <h2 style="color:white">Alquiler de Instalaciones deportivas</h2>
        <h5 style="color:white">Fecha de alquiler: <input type="text" name="datepicker" id="datepicker" value="<% out.print(fechaccion);%>" readonly="readonly" onchange="funcion7()"size="9" style="font-size:20;"/> <span style="color:red">Pulse para cambiar la fecha</span></h5>
        
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
        <h1>Usuarios con Pistas alquiladas</h1>
        
        <% String fechalistado = (String)session.getAttribute("fecha");
            ResultSet resultado;
           resultado = usuarios.allUsuariosReservas(fechalistado);
           
          boolean hayfecha = false;   
          while (resultado.next()) {
          hayfecha = true;      
          out.println("<strong>"+"FECHA: "+"</strong>"+ resultado.getString("fecha"));
          out.println("<strong>"+"HORA: "+"</strong>"+resultado.getString("hora"));
          int numero0 = Integer.parseInt(resultado.getString("pista"));
          ResultSet resultadonumero = reservas.pistanumero(numero0);
          resultadonumero.next();
          
          if(resultadonumero.getString("nombre").equals("TENIS"))
          {
          out.println("<strong>"+"PISTA: "+"</strong>"+resultadonumero.getString("nombre")+" "+resultado.getString("pista"));
          }else{
          out.println("<strong>"+"PISTA: "+"</strong>"+resultadonumero.getString("nombre"));    
          }
          out.println("<strong>"+"NOMBRE: "+"</strong>"+resultado.getString("nombre"));
          out.println("<strong>"+"APELLIDOS: "+"</strong>"+resultado.getString("apellidos"));
          out.println("<strong>"+"DNI: "+"</strong>"+resultado.getString("dni"));
          out.println("<strong>"+"TELEFONO: "+"</strong>"+resultado.getString("telefono"));
          out.println("</br>");
                 
                
            }
          if(!hayfecha)
          out.println("No hay usuarios con pistas alquiladas ");
          
                    
          
        
    
    
      
    } else {%>
        
    <h2 style="color:white">No puedes acceder a esta página</h2>
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    
    <%}}else{%>
    <h2 style="color:white">Debes iniciar sesión para acceder</h2>  
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    <%}%> 
    </body>
</html>
