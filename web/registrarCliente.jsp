<%-- 
    Document   : registarCliente
    Created on : Jul 11, 2019, 3:39:06 PM
    Author     : ?
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Fontawesome - Icons -->
    <script src="https://kit.fontawesome.com/adc3f3b66c.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Concesionario - Registrar Cliente</title>
    <style>
        .abs-center {
            display: flex;
            align-items: center;
            justify-content: center;
        }
 
        .form {
            width: 70%;
        }
        .icon{
            font-size: 60px;
            color: #4CAF50;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="abs-center mt-5">
        <form action="ClienteServlet?action=registrar" method="post" class="border p-3 needs-validation form">
            <legend class="text-center icon"><i class="fas fa-user"></i></legend>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="name" placeholder="Nombre">
            </div>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="cedula" placeholder="Cédula">
            </div>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="tel" placeholder="Telefono">
            </div>
            <div class="form-group col-md-12">
                <input type="email" class="form-control" id="email" placeholder="Correo Electrónico">
            </div>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="direccion" placeholder="Dirección">
            </div>
            <div class="form-group col-md-12 text-center">
                <button type="reset" value="reset" class="btn btn-outline-secondary">Vaciar</button>
                <button type="submit" class="btn btn-outline-success">Registrar</button>
            </div>
        </form>
    </div>
</div>

    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
