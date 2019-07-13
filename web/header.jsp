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
                        <a class="nav-link" href="VehiculoServlet?action=listar">Vehículos<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="VentaServlet?action=listar">Historial de ventas</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="ClienteServlet?action=listar">Lista de Clientes</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="UsuarioServlet?action=listar">Lista de administradores</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" 
                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Registrar</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="VehiculoServlet?action=toRegistrar">Registrar vehículo</a>
                            <a class="dropdown-item" href="ClienteServlet?action=toRegistrar">Registrar Cliente</a>
                            <a class="dropdown-item" href="UsuarioServlet?action=toRegistrar">Registrar Administrador</a>
                        </div>
                    </li>
                </ul>
                
                <c:if test="${param.success == 1}">                 
                    <a href="registrarAdmin.jsp" class="nav-link" id="Conectado" style="color: #9A9DA0">Registrar</a>
                </c:if>
                <c:if test="${param.success == 2}">
                    <a href="UsuarioServlet?action=desconectar" class="nav-link" id="Conectado" style="color: #9A9DA0">Desconectarse</a>
                </c:if>
            </div>
        </nav>
    </header>
