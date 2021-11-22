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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        <h1>LISTADO DE PRODUCTOS</h1>
        <table class="table">
            <thead class="">
                <tr>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Borrar</th>
                    <th>Actualizar</th>
                </tr>
            </thead>
            <tbody class="">
                <c:forEach var="p" items="${lista}">
                    <tr>
                        <td>${p.nombre}</td>
                        <td>${p.precio} €</td>
                        <td><a href="Controlador?action=borrar&id=${p.id}" onclick="confirmAction(this, '¿Estás seguro?', performDelete); return false;">Borrar</a></td>
                        <td><a href="Controlador?action=actualizar&id=${p.id}" onclick="confirmAction(this, '¿Estás seguro?', performDelete); return false;">Actualizar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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
