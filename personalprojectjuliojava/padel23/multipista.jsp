<%-- 
    Document   : multipista
    Created on : 23-may-2014, 20:42:08
    Author     : Julio Jose
--%>

<%@page import="paquete.usuarios"%>
<%@page import="paquete.reservas"%>
<%@page import="paquete.ComprobarReservas"%>
<%@page import="paquete.conexion"%>
<%@page import="java.sql.ResultSet"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="jquery-ui-1.9.2/themes/base/jquery-ui.css">
<script src="jquery-ui-1.9.2/jquery-1.8.3.js"></script>
<script src="jquery-ui-1.9.2/ui/jquery-ui.js"></script>
<script src="javascript/calendario.js"></script>
<script type="text/javascript" src="javascript/fecha.js"></script>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="css/estilosmultipista.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Multipista</title>
    </head>
    <body>
        
       <%session.setAttribute("nombre58", null);
        session.setAttribute("password58", null);
        session.setAttribute("nombre58", null);
        session.setAttribute("apellidos58", null);
        session.setAttribute("email58", null);
        session.setAttribute("dni58", null);
        session.setAttribute("telefono58", null);
        session.setAttribute("idsesion2", null);
      
        java.util.Date ahora = new java.util.Date();
        java.util.GregorianCalendar gc = new java.util.GregorianCalendar();
        gc.setTime(ahora);
        int horas = gc.get(java.util.Calendar.HOUR_OF_DAY);
        int hora = horas + 6;
        int minutos = gc.get(java.util.Calendar.MINUTE);
        int dia = gc.get(java.util.Calendar.DAY_OF_MONTH);
        int mes = gc.get(java.util.Calendar.MONTH);
        int year = gc.get(java.util.Calendar.YEAR);

        mes = mes + 1;
        String diacon0;
        String mescon0;
        if (mes <= 9) {
            mescon0 = "0" + mes;
        }else{
           mescon0 = mes+"";
        }
        if (dia <= 9) {
            diacon0 = "0" +  dia;
        }else{
           diacon0 = dia+"";
        }
        int diasemana2 = 15;
        if (session.getAttribute("nombre") != null) 
            {
            String fechaccion = request.getParameter("datepicker");
            request.getSession().setAttribute("fecha", fechaccion);
            if (fechaccion != null && fechaccion != "") 
                {
                diasemana2 = conexion.getDiaSemana(fechaccion);
                }
            if (request.getParameter("f") != null) 
                {
                fechaccion = request.getParameter("f");
                request.getSession().setAttribute("fecha", fechaccion);
                diasemana2 = conexion.getDiaSemana(fechaccion);
                } else if (fechaccion == null || fechaccion.indexOf("/") == -1) 
                {
                fechaccion = diacon0 + "/" + mescon0 + "/" + year;
                request.getSession().setAttribute("fecha", fechaccion);
                diasemana2 = conexion.getDiaSemana(fechaccion);
                }

            String[] myStringArray = new String[3];
            myStringArray = fechaccion.split("/");
            int mes2 = Integer.parseInt(myStringArray[1]);
            int year2 = Integer.parseInt(myStringArray[2]);
            if (session.getAttribute("idsession") == null) 
                {
                System.out.println("");
                } else {
                System.out.println(session.getAttribute("idsession"));
                }

            Integer sesion = (Integer) session.getAttribute("idsession");
    %>
    
         <h1 style="color:white">Ayuntamiento de Argamasilla de Alba</h1>
       <div id="logo">
        
                <img src="images/logo.png" />
        </div>
        <h2 style="color:white">Alquiler de Instalaciones deportivas</h2>
        
        <h5 style="color:white">Fecha de alquiler: <input type="text" name="datepicker" id="datepicker" value="<% out.print(fechaccion);%>" readonly="readonly" onchange="funcion4()"size="9" style="font-size:20;"/><span style="color:red"> Pulse para cambiar la fecha</span></h5>
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
            
        <h5><span style="color:red">Pulse Reservar para alquilar pista, vuelva a pulsar para quitar reserva</span></h5>        
    
    
        <%  ResultSet resultado37 = reservas.pistanombre("MULTIPISTA");
         while (resultado37.next()) 
            {
             String nombrepista = resultado37.getString("nombre");
             int numeropista = resultado37.getInt("numero");
        %>

            <table  width="250" border="3">
            <tr>
                <td colspan="2"><h2><%=nombrepista%></h2></td>
            </tr>
            <tr>
                <td>Hora</td>
                <td>Estado</td>
            </tr>
        
        
        
         <% ResultSet resultado33 = reservas.allHorarios();
               while (resultado33.next()) 
                    {
                    int diahorario = resultado33.getInt("numdia");
                    int horainicio1 = resultado33.getInt("horaini1");
                    int horafin1 = resultado33.getInt("horafin1");
                    int horainicio2 = resultado33.getInt("horaini2");
                    int horafin2 = resultado33.getInt("horafin2");

                    if (diasemana2 == diahorario) 
                        {
                        if (horainicio1 == 0) 
                            {%>
                            <td style="background-color:red;"/><center>PISTA CERRADA</center></td>  
                            <%} else {
                            for (int i = horainicio1; i < horafin1; i++) 
                                {
            %>
                                <tr>
                                <td><%=i%>-<%=i + 1%></td>
            <%
                                 if (i <= hora && Integer.parseInt(fechaccion.substring(0, fechaccion.indexOf("/"))) == dia && mes == mes2 && year == year2) 
                                       {%>
                                       <td style="background-color: #999;color:white"/><center>No disponible</center></a></td>  
                                       <%} else if (ComprobarReservas.reservar(fechaccion, i + "", numeropista+"", sesion) == true)
                                       {%>
                                       <td style="background-color:green; color:white;"/><a href="ControladorDesReserva?fecha=<% out.print(fechaccion);%>&hora=<% out.print(i + "");%>&pista=<%=numeropista%>"><center>RESERVADO</center></a></td>  
                                        <% } else if (ComprobarReservas.reservar2(fechaccion, i + "", numeropista+"")) 
                                        {%>
                                        <td style="background-color:red;"/><center>RESERVADO</center></td>  
                                        <% } else {%>
                                             <td><a href="ControladorReserva?fecha=<% out.print(fechaccion);%>&hora=<% out.print(i + "");%>&pista=<%=numeropista%>&usuario=<%out.print(session.getAttribute("idsession"));%>">Reservar</a></td>
                                                <%} %>   

                                </tr>

                                <%} //fin for i
                            for (int j = horainicio2; j <horafin2; j++) 
                                {%>
                                <tr>
                                <td><%=j%>-<%=j + 1%></td>
            <%
                                 if (j <= hora && Integer.parseInt(fechaccion.substring(0, fechaccion.indexOf("/"))) == dia && mes == mes2 && year == year2) 
                                       {%>
                                       <td style="background-color: #999;color:white"/><center>No disponible</center></a></td>  
                                       <%} else if (ComprobarReservas.reservar(fechaccion, j + "", numeropista+"", sesion) == true)
                                       {%>
                                       <td style="background-color:green; color:white;"/><a href="ControladorDesReserva?fecha=<% out.print(fechaccion);%>&hora=<% out.print(j + "");%>&pista=<%=numeropista%>"><center>RESERVADO</center></a></td>  
                                        <% } else if (ComprobarReservas.reservar2(fechaccion, j + "", numeropista+"")) 
                                        {%>
                                        <td style="background-color:red;"/><center>RESERVADO</center></td>  
                                        <% } else {%>
                                             <td><a href="ControladorReserva?fecha=<% out.print(fechaccion);%>&hora=<% out.print(j + "");%>&pista=<%=numeropista%>&usuario=<%out.print(session.getAttribute("idsession"));%>">Reservar</a></td>
                                                <%} %>   

                                </tr>
                            
                <%              }//fin for j
                }//fin del else de horainicio=0
            }//fin if diasemana2
        }//fin while horarios
    }//fin while pistas

         %>
   
   <image id="fotomultipista1" src="images/polideportivo_multipista.JPG"/>
   <image id="fotomultipista2" src="images/polideportivo_multipista2.JPG"/>
   
   <%
   }else{%>
        
    <h2 style="color:white">Debes iniciar sesión para acceder</h2>  
    <a style="color:white" href="index.jsp"> Iniciar sesión </a>
    
    <%}//fin del if de la variable sesion %> 
    </body>
</html>