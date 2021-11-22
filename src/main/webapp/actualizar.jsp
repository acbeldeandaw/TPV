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
        <title>Gestión de Departamentos</title>
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
        <form action="Controlador" method="POST" enctype="multipart/form-data">
                <label for="name">Nombre</label>
                <input type="text" id="name" name="name" value="">
                <label for="surname">Apellidos</label>
                <input type="text" id="surname" name="surname" value="">
                <label for="phone">Teléfono</label>
                <input type="number" id="phone" name="phone" value="">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" value="">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password">
                <label for="password2">Repetir contraseña</label>
                <input type="password" id="password2" name="password2">
                <label for="profilePicture">Foto</label>
                <input type="file" id="profilePicture" name="profilePicture" accept="image/jpeg,image/gif,image/png">
                <button type="submit" name="action" value="actualizarDatos">Actualizar</button>
            </form>
        <br>
        <a href="index.html" class="button button-a">Inicio</a>
        <script type="text/javascript">
            alertify.set('notifier','position', 'bottom-center');
            ${msg}
            function performDelete ( a_element ) {
                location.href = a_element.href;
            }
            function confirmAction ( a_element, message, action ) {
                alertify.confirm(message, function(e) {
                    if (e) {
                        if (action) {
                            action(a_element);
                        }
                    }
                });
            }
        </script>
    </body>
</html>
