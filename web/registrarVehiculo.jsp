<%-- 
    Document   : registrarVehiculo
    Created on : Jul 11, 2019, 3:42:04 PM
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

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Concesionario - Registrar Vehiculo</title>
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
        #CImagen{
            width: 150px;
            padding: 20px;
            margin: 20px;
            position: relative;
            font-size: 40px;
        }
        #imagen{
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            position: absolute;
            opacity: 0;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('.custom-file-input').on('change', function() { 
                let fileName = $(this).val().split('\\').pop(); 
                $(this).next('.custom-file-label').addClass("selected").html(fileName); 
            });
        });
    </script>
</head>
<body>

<div class="container">
    <div class="abs-center mt-5">
        <form action="VehiculoServlet?action=registrar" method="post" class="border p-3 needs-validation form">
            <legend class="text-center icon"><i class="fas fa-car"></i></legend>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="linea" placeholder="Linea">
            </div>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="modelo" placeholder="Modelo">
            </div>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="placa" placeholder="Placa">
            </div>
            <div class="form-group col-md-12">
                <input type="text" class="form-control" id="precio" placeholder="Precio">
            </div>
            <div class="custom-file col-md-8 ml-3">
                <input type="file" class="custom-file-input" id="customFile" lang="es">
                <label class="custom-file-label text-truncate" for="customFile">Seleccionar Imagen...</label>
            </div>
            <div class="form-group col-md-12 text-center mt-4">
                <button type="reset" value="reset" class="btn btn-outline-secondary">Vaciar</button>
                <button type="submit" class="btn btn-outline-success">Registrar vehículo</button>
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
