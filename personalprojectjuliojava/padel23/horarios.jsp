<%-- 
    Document   : horarios
    Created on : 28-may-2014, 18:56:09
    Author     : Julio Jose
--%>

<%@page import="paquete.usuarios"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="paquete.reservas"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/estiloshorarios.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Horarios</title>
    </head>
    
    
    
<% if(session.getAttribute("idsession")!=null)
        {
    
    Integer sesion = (Integer) session.getAttribute("idsession");
    Integer administrador = (Integer) session.getAttribute("administrador");
    if (administrador == 1){
    ResultSet resultadolunes = reservas.obtenerhoras("LUNES");
    int horaini1lun = 1;
    int horafin1lun = 1;
    int horafin2lun = 1;
    int horaini2lun = 1;
        while(resultadolunes.next())
        {
          horaini1lun= resultadolunes.getInt("horaini1");
          horafin1lun= resultadolunes.getInt("horafin1");
          horaini2lun= resultadolunes.getInt("horaini2");
          horafin2lun= resultadolunes.getInt("horafin2");
         }
        
        
     ResultSet resultadomartes = reservas.obtenerhoras("MARTES");
     int horaini1mar = 1;
     int horafin1mar = 1;
     int horaini2mar = 1;
     int horafin2mar = 1;
        while(resultadomartes.next())
        {
          horaini1mar= resultadomartes.getInt("horaini1");
          horafin1mar= resultadomartes.getInt("horafin1");
          horaini2mar= resultadomartes.getInt("horaini2");
          horafin2mar= resultadomartes.getInt("horafin2");
         }
        
        
     ResultSet resultadomiercoles = reservas.obtenerhoras("MIERCOLES");
     int horaini1mier = 1;
     int horafin1mier = 1;
     int horaini2mier = 1;
     int horafin2mier = 1;
        while(resultadomiercoles.next())
        {
          horaini1mier= resultadomiercoles.getInt("horaini1");
          horafin1mier= resultadomiercoles.getInt("horafin1");
          horaini2mier= resultadomiercoles.getInt("horaini2");
          horafin2mier= resultadomiercoles.getInt("horafin2");
         }
        
     ResultSet resultadojueves = reservas.obtenerhoras("JUEVES");
     int horaini1jue = 1;
     int horafin1jue = 1;
     int horaini2jue = 1;
     int horafin2jue = 1;
        while(resultadojueves.next())
        {
          horaini1jue = resultadojueves.getInt("horaini1");
          horafin1jue = resultadojueves.getInt("horafin1");
          horaini2jue = resultadojueves.getInt("horaini2");
          horafin2jue = resultadojueves.getInt("horafin2");
         }
        
        
     
     ResultSet resultadoviernes = reservas.obtenerhoras("VIERNES");
     int horaini1vier = 1;
     int horafin1vier = 1;
     int horaini2vier = 1;
     int horafin2vier = 1;
        while(resultadoviernes.next())
        {
          horaini1vier = resultadoviernes.getInt("horaini1");
          horafin1vier = resultadoviernes.getInt("horafin1");
          horaini2vier = resultadoviernes.getInt("horaini2");
          horafin2vier = resultadoviernes.getInt("horafin2");
         }
        
        
    
    ResultSet resultadosabado = reservas.obtenerhoras("SABADO");
     int horaini1sab = 1;
     int horafin1sab = 1;
     int horaini2sab = 1;
     int horafin2sab = 1;
        while(resultadosabado.next())
        {
          horaini1sab = resultadosabado.getInt("horaini1");
          horafin1sab = resultadosabado.getInt("horafin1");
          horaini2sab = resultadosabado.getInt("horaini2");
          horafin2sab = resultadosabado.getInt("horafin2");
         }
        
        
    ResultSet resultadodomingo = reservas.obtenerhoras("DOMINGO");
     int horaini1dom = 1;
     int horafin1dom = 1;
     int horaini2dom = 1;
     int horafin2dom = 1;
        while(resultadodomingo.next())
        {
          horaini1dom = resultadodomingo.getInt("horaini1");
          horafin1dom = resultadodomingo.getInt("horafin1");
          horaini2dom = resultadodomingo.getInt("horaini2");
          horafin2dom = resultadodomingo.getInt("horafin2");
         }
        
    %>
    
    
    
    <body>
        
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
        
        
        
        <div id="tablahorarios">
            
   <form id="form" name="form" method="post" action="ControladorHorarios">
       <h1>Horarios</h1>
        <table width="400" border="1">
  <tr>
    <td>DÍA</td>
    <td>HINICIO1</td>
    <td>HFIN1</td>
    <td>HINICIO2</td>
    <td>HFIN2</td>
  </tr>
  <tr>
    <td>LUNES</td>
    <td><input type="text" name="hini1lun" id="hini1lun" value="<% out.println(horaini1lun);%>" size="3"></td>
    <td><input type="text" name="hfin1lun" id="hfin1lun" value="<% out.println(horafin1lun);%>"size="3"></td>
    <td><input type="text" name="hini2lun" id="hini2lun" value="<% out.println(horaini2lun);%>" size="3"></td>
    <td><input type="text" name="hfin2lun" id="hfin2lun" value="<% out.println(horafin2lun);%>"size="3"></td>
  </tr>
  <tr>
    <td>MARTES</td>
    <td><input type="text" name="hini1mar" id="hini1mar" value="<% out.println(horaini1mar);%>" size="3"></td>
    <td><input type="text" name="hfin1mar" id="hfin1mar" value="<% out.println(horafin1mar);%>"size="3"></td>
    <td><input type="text" name="hini2mar" id="hini2mar" value="<% out.println(horaini2mar);%>" size="3"></td>
    <td><input type="text" name="hfin2mar" id="hfin2mar" value="<% out.println(horafin2mar);%>"size="3"></td>
  </tr>
  <tr>
    <td>MIÉRCOLES</td>
    <td><input type="text" name="hini1mier" id="hini1mier" value="<% out.println(horaini1mier);%>" size="3"></td>
    <td><input type="text" name="hfin1mier" id="hfin1mier" value="<% out.println(horafin1mier);%>"size="3"></td>
    <td><input type="text" name="hini2mier" id="hini2mier" value="<% out.println(horaini2mier);%>" size="3"></td>
    <td><input type="text" name="hfin2mier" id="hfin2mier" value="<% out.println(horafin2mier);%>"size="3"></td>
  </tr>
  <tr>
    <td>JUEVES</td>
    <td><input type="text" name="hini1jue" id="hini1jue" value="<% out.println(horaini1jue);%>" size="3"></td>
    <td><input type="text" name="hfin1jue" id="hfin1jue" value="<% out.println(horafin1jue);%>"size="3"></td>
    <td><input type="text" name="hini2jue" id="hini2jue" value="<% out.println(horaini2jue);%>" size="3"></td>
    <td><input type="text" name="hfin2jue" id="hfin2jue" value="<% out.println(horafin2jue);%>"size="3"></td>
  </tr>
  <tr>
    <td>VIERNES</td>
    <td><input type="text" name="hini1vier" id="hini1vier" value="<% out.println(horaini1vier);%>" size="3"></td>
    <td><input type="text" name="hfin1vier" id="hfin1vier" value="<% out.println(horafin1vier);%>"size="3"></td>
    <td><input type="text" name="hini2vier" id="hini2vier" value="<% out.println(horaini2vier);%>" size="3"></td>
    <td><input type="text" name="hfin2vier" id="hfin2vier" value="<% out.println(horafin2vier);%>"size="3"></td>
  </tr>
  <tr>
    <td>SÁBADO</td>
    <td><input type="text" name="hini1sab" id="hini1sab" value="<% out.println(horaini1sab);%>" size="3"></td>
    <td><input type="text" name="hfin1sab" id="hfin1sab" value="<% out.println(horafin1sab);%>"size="3"></td>
    <td><input type="text" name="hini2sab" id="hini2sab" value="<% out.println(horaini2sab);%>" size="3"></td>
    <td><input type="text" name="hfin2sab" id="hfin2sab" value="<% out.println(horafin2sab);%>"size="3"></td>
  </tr>
  <tr>
    <td>DOMINGO</td>
    <td><input type="text" name="hini1dom" id="hini1dom" value="<% out.println(horaini1dom);%>" size="3"></td>
    <td><input type="text" name="hfin1dom" id="hfin1dom" value="<% out.println(horafin1dom);%>"size="3"></td>
    <td><input type="text" name="hini2dom" id="hini2dom" value="<% out.println(horaini2dom);%>" size="3"></td>
    <td><input type="text" name="hfin2dom" id="hfin2dom" value="<% out.println(horafin2dom);%>"size="3"></td>
  </tr>
</table>
       
       <input type="submit" name="enviar" id="enviar" value="Enviar" />
   </form>
     <%
    } else {%>
        
    <h2 style="color:white">No puedes acceder a esta página</h2>
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    
    <%}}else{%>
    <h2 style="color:white">Debes iniciar sesión para acceder</h2>  
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    <%}%>  
        </div>
    </body>
</html>
