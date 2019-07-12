<%-- 
    Document   : index
    Created on : Jul 11, 2019, 2:51:31 PM
    Author     : ?
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Fontawesome - Icons -->
    <script src="https://kit.fontawesome.com/adc3f3b66c.js"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Concesionario - Lista de vehiculos</title>
    </head>
    <body>
        <!--BARRA DE NAVEGACION-->
      <jsp:include page="header.jsp"></jsp:include>
      
      <div class=""><h1><center><b>PAGINA PARA GESTIÓN DE VENTAS DEL CONCESIONARIO</b></center></h1></div>
      
      <c:if test="${param.error == 1}">
          <center><font color="red">Error al registrar el Administrador. Inténtelo de nuevo</font></center>
      </c:if>
        <c:if test="${param.error == 2}">
          <center><font color="red">Error al registrar el Cliente. Inténtelo de nuevo</font></center>
      </c:if>
      <c:if test="${param.error == 3}">
          <center><font color="red">Error al registrar el Vehículo. Inténtelo de nuevo</font></center>
      </c:if> 
      <c:if test="${param.exito == 1}">
          <center><font color="red">Se registró correctamente el administrador</font></center>
      </c:if>
        <c:if test="${param.exito == 2}">
          <center><font color="red">Se registró correctamente el Cliente</font></center>
      </c:if>
      <c:if test="${param.exito == 3}">
          <center><font color="red">Se registró correctamente el vehículo</font></center>
      </c:if> 
    </body>
</html>
