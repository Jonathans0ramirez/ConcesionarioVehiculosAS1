<%-- 
    Document   : vehiculo
    Created on : Jul 11, 2019, 3:33:20 PM
    Author     : ?
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Fontawesome - Icons -->
    <script src="https://kit.fontawesome.com/adc3f3b66c.js"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Concesionario - Lista de vehiculos</title>
    <style>
        table.table td a.delete{
            color: red;
        }
        table.table td a.sell {
            color: #00e676;
        }
        a:hover {
            color:  #4CAF50 !important;
        }
        
	</style>

  </head>
  <body>
      
      <!--BARRA DE NAVEGACION-->
      <jsp:include page="header.jsp"></jsp:include>

    <!--LISTA VEHICULOS-->
    <div class="container mt-5">
        <div class="table-wrapper table-responsive-md">
            <div class="table-title">
                <div class="row">
                    <div class="col-md-4"><h3>Lista <b>Vehículos</b></h3></div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-info add-new" onclick="location.href='VehiculoServlet?action=toRegistrar'" style="background-color: #4CAF50"><i class="fa fa-plus"></i> Añadir Nuevo</button>
                    </div>
                    <div class="col-md-4">
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <table class="table table-bordered text-center mt-2">
                <thead>
                    <tr>
                        <th>Línea</th>
                        <th>Modelo</th>
                        <th>Placa</th>
                        <th>Precio</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                </thead>                              
                <tbody  id="cuerpoTabla">
                <c:if test="${param.filtered == 1}">
                    <c:forEach var = "vehiculo" varStatus="status" items="${vehiculo}">
                        <td><c:out value="${vehiculo.linea}"/></td>
                        <td><c:out value="${vehiculo.modelo}"/></td>
                        <td><c:out value="${vehiculo.placa}"/></td>
                        <td><c:out value="${vehiculo.precio}"/></td>                        
                        <td><a title="ver imagen" href="VehiculoServlet?action=verFoto" ><i class="fas fa-image"></i></a></td>
                        <td>
                            <a class="sell" title="Sell" data-toggle="tooltip" href="VehiculoServlet?action=toVenta&placa=${vehiculo.placa}"><i class="fas fa-dollar-sign"></i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip" href="VehiculoServlet?action=eliminar&placa=${vehiculo.placa}"><i class="fas fa-trash"></i></a>
                        </td>
                    </c:forEach>
                </c:if> 
                <c:if test="${param.filtered == 2 || param.filtered == null}">
                    <c:forEach var = "vehiculo" varStatus="status" items="${vehiculos}">
                        <tr>
                            <td><c:out value="${vehiculo.linea}"/></td>
                            <td><c:out value="${vehiculo.modelo}"/></td>
                            <td><c:out value="${vehiculo.placa}"/></td>
                            <td><c:out value="${vehiculo.precio}"/></td>                        
                            <td><a title="ver imagen" href="VehiculoServlet?action=verFoto" ><i class="fas fa-image"></i></a></td>
                            <td>
                                <a class="sell" title="Sell" data-toggle="tooltip" href="VehiculoServlet?action=toVenta&placa=${vehiculo.placa}&linea=${vehiculo.linea}&modelo=${vehiculo.modelo}"><i class="fas fa-dollar-sign"></i></a>
                                <a class="delete" title="Delete" data-toggle="tooltip" href="VehiculoServlet?action=eliminar&placa=${vehiculo.placa}"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if> 
                <c:if test="${param.filtered == 3}">
                    <center><h1>No se encontraron registros</h1></center>
                </c:if>  
                </tbody>
            </table>
        </div>
    </div>
    
 

    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
