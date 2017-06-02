<%-- 
    Document   : tabla
    Created on : 27-feb-2014, 18:33:01
    Author     : Julio Jose
--%>
<%@page import="paquete.usuarios"%>
<%@page import="paquete.reservas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="paquete.conexion"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="jquery-ui-1.9.2/themes/base/jquery-ui.css">
<script src="jquery-ui-1.9.2/jquery-1.8.3.js"></script>
<script src="jquery-ui-1.9.2/ui/jquery-ui.js"></script>
<script src="calendario.js"></script>

<link rel="stylesheet" type="text/css" href="css/estilostabla.css">
<%@page import="paquete.ComprobarReservas"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alquiler de Pistas</title>
    </head>
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
        int hora = horas +6;
        int minutos = gc.get(java.util.Calendar.MINUTE);
        int dia = gc.get(java.util.Calendar.DAY_OF_MONTH);
        int mes = gc.get(java.util.Calendar.MONTH);
        int year = gc.get(java.util.Calendar.YEAR);

        mes = mes + 1;
        String diacon0 = "0";
        String mescon0 = "2";
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
            Integer administrador = (Integer) session.getAttribute("administrador");
    %>
    
    <body>
  
        
        <h1 style="color:white">Ayuntamiento de Argamasilla de Alba</h1>
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
        

        <h5><span style="color:red">El pago de las pistas se hará en las mismas instalaciones</span></h5> 
        <div id='cssmenu'>
        <ul>
         <li><a href='index.jsp'><span>Salir</span></a></li>
        <li><a href='cambiaregistro.jsp'><span>Cambiar Datos de Registro</span></a></li>
        <li><a href='precios.jsp'><span>Precios</span></a></li>
        <%
        if (administrador == 1) 
            {%>
            <li><a href='listadousuarios.jsp'><span>Usuarios con Pistas Alquiladas</span></a></li>
            <li><a href='listadousuariosmodificar.jsp'><span>Modificar Registro Usuarios</span></a></li>
            <li><a href='horarios.jsp'><span>Horarios</span></a></li>
           <%}%>
            
      
            
            

</ul>
</div>    
        </br>
        </br>
        
        
        
        <table  cellpadding= "15" width="250" border="3">
            <tr>
                <td ><a href="fronton.jsp"> FRONTÓN </a></br></br><a href="fronton.jsp"><img src="images/polideportivo_fronton.jpg"/></a></td>
                <td  ><a href="padel.jsp"> PÁDEL </a></br></br><a href="padel.jsp"><img src="images/polideportivo_padel.JPG"/></a></td>
                <td  ><a href="tenis.jsp">TENIS </a></br></br><a href="tenis.jsp"><img src="images/polideportivo_tenis.jpg"/></a></td>
            </tr>
            
            <tr>
                <td  ><a href="multipista.jsp"> MULTIPISTA </a></br></br><a href="multipista.jsp"><img src="images/polideportivo_multipista.JPG"/></a></td>
                <td  ><a href="futbol.jsp"> FÚTBOL </a></br></br><a href="futbol.jsp"><img src="images/polideportivo_futbol.JPG"/></a></td>
                <td  ><a href="pabellon.jsp"> PABELLÓN </a></br></br><a href="pabellon.jsp"><img src="images/PABELLON9.png"/></a></td>
            </tr>
        </table>
        
        
        
        
        
        </br>
        
        
    

    <%} else{%>
        
    <h3 style="color:white">Debes estar logueado para acceder</h3>
    <a style="color:white" href="index.jsp"> Loguearse </a>
    
    <%}//fin del if de la variable sesion %> 
     

</body>
</html>
