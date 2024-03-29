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

    <title>Concesionario - Principal</title>
    </head>
    <body>
        <!--BARRA DE NAVEGACION-->
      <jsp:include page="header.jsp"></jsp:include>
      <br>
      <div class=""><h1><center><b>PAGINA PARA GESTIÓN DE VENTAS DEL CONCESIONARIO</b></center></h1></div>
      
      <c:if test="${param.errorRegistrar == 1}">
          <center><font color="red">Error al registrar el Administrador. Inténtelo de nuevo</font></center>
      </c:if>
      <c:if test="${param.errorEliminar == 1}">
          <center><font color="red">Error al eliminar el Administrador. Inténtelo de nuevo</font></center>
      </c:if>      
        <c:if test="${param.errorRegistrar == 2}">
          <center><font color="red">Error al registrar el Cliente. Inténtelo de nuevo</font></center>
      </c:if>
      <c:if test="${param.errorEliminar == 2}">
          <center><font color="red">Error al eliminar el Cliente. Inténtelo de nuevo</font></center>
      </c:if>
      <c:if test="${param.errorRegistrar == 3}">
          <center><font color="red">Error al registrar el Vehículo. Inténtelo de nuevo</font></center>
      </c:if> 
      <c:if test="${param.errorEliminar == 3}">
          <center><font color="red">Error al eliminar el Vehículo. Inténtelo de nuevo</font></center>
      </c:if>
      <c:if test="${param.errorRegistrar == 4}">
          <center><font color="red">Error al registrar la Venta. Inténtelo de nuevo</font></center>
      </c:if> 
      <c:if test="${param.errorEliminar == 4}">
          <center><font color="red">Error al eliminar la Venta. Inténtelo de nuevo</font></center>
      </c:if>
      <c:if test="${param.exitoRegistrar == 1}">
          <center><font color="red">Se registró correctamente el administrador</font></center>
      </c:if>
      <c:if test="${param.exitoEliminar == 1}">
          <center><font color="red">Se eliminó correctamente el administrador</font></center>
      </c:if>
      <c:if test="${param.exitoRegistrar == 2}">
          <center><font color="red">Se registró correctamente el Cliente</font></center>
      </c:if>
      <c:if test="${param.exitoEliminar == 2}">
          <center><font color="red">Se eliminó correctamente el Cliente</font></center>
      </c:if>
      <c:if test="${param.exitoRegistrar == 3}">
          <center><font color="red">Se registró correctamente el Vehículo</font></center>
      </c:if> 
      <c:if test="${param.exitoEliminar == 3}">
          <center><font color="red">Se eliminó correctamente el Vehículo</font></center>
      </c:if>
      <c:if test="${param.exitoRegistrar == 4}">
          <center><font color="red">Se registró correctamente la Venta</font></center>
      </c:if> 
      <c:if test="${param.exitoEliminar == 4}">
          <center><font color="red">Se eliminó correctamente la Venta</font></center>
      </c:if>
    </body>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
