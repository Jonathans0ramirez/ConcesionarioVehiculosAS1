<%-- 
    Document   : header
    Created on : Jul 11, 2019, 3:44:36 PM
    Author     : ?
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp"><b>MARCA</b> CONCESIONARIO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="VehiculoServlet?action=list">Vehículos<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="VentasServlet?action=list">Historial de ventas</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" 
                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Registrar</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="VehiculoServlet?action=registrar">Registrar vehículo</a>
                            <a class="dropdown-item" href="ClienteServlet?action=registrar">Registrar Cliente</a>
                            <a class="dropdown-item" href="UsuarioServlet?action=registrar">Registrar Administrador</a>
                        </div>
                    </li>
                </ul>
                
                <c:if test="${param.success == 1}">                 
                    <a href="registarUsuario.jsp" class="nav-link" id="Conectado" style="color: #9A9DA0">Desconectarse</a>
                </c:if>
                <c:if test="${param.success == 2}">
                    <a href="UsuarioServlet?action=desconectar" class="nav-link" id="Conectado" style="color: #9A9DA0">Desconectarse</a>
                </c:if>
            </div>
        </nav>
    </header>
