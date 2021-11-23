<%-- 
    Document   : mostrar
    Created on : 04-nov-2021, 17:32:59
    Author     : DAW-A
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TPV</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Alertify -->
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
        <!-- END Alertify -->
        <style type="text/css">
            body {
                text-align: center;
            }
            .button {
                width: 250px;
                background-color: lightgrey;
                border: none;
                color: black;
                padding: 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                margin: 3px 0;
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button-a {
                width: 230px;
            }
            .button:hover {
                background-color: purple;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>EDICIÓN DE PRODUCTO</h1>
        <form action="Controlador" method="POST">
            <input type="number" id="id" name="id" value="${prod.id}" style="display:none">
            <label for="nombre">Nombre</label><br>
            <input type="text" id="nombre" name="nombre" value="${prod.nombre}"><br>
            <label for="imagen">Imagen</label><br>
            <input type="text" id="imagen" name="imagen" value="${prod.imagen}"><br>
            <label for="categoria">Categoria</label><br>
            <input type="text" id="categoria" name="categoria" value="${prod.categoria}"><br>
            <label for="precio">Precio</label><br>
            <input type="number" id="precio" name="precio" step="0.01" min="0" value="${prod.precio}"><br>
            <br>
            <button class="button" type="submit" name="action" value="actualizarDatos">Actualizar</button><br>
            <button class="button" type="button" onclick="location.href='Controlador?action=mostrar'">Listado de Productos</button><br>
            <button class="button" type="button" onclick="location.href='index.html'">Inicio</button>
        </form>
        <script type="text/javascript">
            alertify.set('notifier','position', 'bottom-center');
            ${msg}
        </script>
    </body>
</html>
