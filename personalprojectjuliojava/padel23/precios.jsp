<%-- 
    Document   : precios
    Created on : 29-abr-2014, 9:46:19
    Author     : Pruebas
--%>

<%@page import="paquete.usuarios"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/estilosprecios.css"> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Precios</title>
    </head>
    <body>
         <%
            if(session.getAttribute("idsession")!=null)
        {%>
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
            
            
            
        <table border="2" bordercolor="#FFCC00" style="background-color:#FFFFFF" width="650" cellpadding="3" cellspacing="3">
            <tr>
                <td></td>
                <td style="font-weight: bold; text-align: center;">Precio sin Luz (Euros)</td>
                <td style="font-weight: bold; text-align: center;">Precio con Luz (Euros)</td>
            </tr>
            <tr>
                <td style="font-weight: bold; " colspan="3">a) Pista de tenis, pádel, frontón / hora:</td>
                
            </tr>
            <tr>
                <td>Por pista y hora de 14 a 17 años inclusive</td>
                <td style="text-align: center;">1,00</td>
                <td style="text-align: center;">3,00</td>
            </tr>
            <tr>
                <td>Por pista y hora, mayores de 18 años</td>
                <td style="text-align: center;">3,00</td>
                <td style="text-align: center;">5,00</td>
            </tr>
            <tr>
                <td>Abono de 10 horas, de 14 a 17 años inclusive</td>
                <td style="text-align: center;">6,00</td>
                <td style="text-align: center;">18,00</td>
            </tr>
            <tr>
                <td>Abono de 10 horas, mayores de 18 años</td>
                <td style="text-align: center;">18,00</td>
                <td style="text-align: center;">30,00</td>

            </tr>
            <tr>      
                <td style="font-weight: bold; " colspan="3">b) Pista Polideportiva (baloncesto, balonmano... ) / hora:</td>
                

            </tr>
            <tr>
                <td>Actividad libre</td>
                <td style="text-align: center;">Exento</td>
                <td style="text-align: center;">Exento</td>

            </tr>
            <tr>
                <td>Actividad organizada</td>
                <td style="text-align: center;">5,00</td>
                <td style="text-align: center;">8,00</td>
            </tr>
            <tr>
                <td>Abono de 5 horas de uso</td>
                <td style="text-align: center;">15,00</td>
                <td style="text-align: center;">25,00</td>
            </tr>
            <tr>
                <td style="font-weight: bold; " colspan="3">c) Pabellón / hora:</td>
                
            </tr>
            <tr>
                <td>Utilización hasta 17 años incluidos</td>
                <td style="text-align: center;">5,00</td>
                <td style="text-align: center;">8,00</td>
            </tr>
            <tr>
                <td>Utilización mayores de 18 años</td>
                <td style="text-align: center;">10,00</td>
                <td style="text-align: center;">15,00</td>
            </tr>
            <tr>
                <td>Abono de 5 horas de uso hasta 17 años</td>
                <td style="text-align: center;">15,00</td>
                <td style="text-align: center;">25,00</td>
            </tr>
            <tr>
                <td>Abono de 5 horas de uso, mayores de 18 años</td>
                <td style="text-align: center;">36,00</td>
                <td style="text-align: center;">52,00</td>
            </tr>
            <tr>
                <td style="font-weight: bold; " colspan="3">d) Campo de Fútbol / hora</td>
                
            </tr>
            <tr>
                <td>Utilización en general</td>
                <td style="text-align: center;">20,00</td>
                <td style="text-align: center;">40,00</td>
            </tr>
            <tr>
                <td style="font-weight: bold; " colspan="3">e) Campo de Fútbol 7 / hora:</td>
                
            </tr>
            <tr>
                <td>Utilización en general</td>
                <td style="text-align: center;">10,00</td>
                <td style="text-align: center;">20,00</td>
            </tr>
        </table>
        <%} else {%>
        
    <h2 style="color:white">No puedes acceder a esta página</h2>
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    
    <%}%>    

    </body>
</html>
