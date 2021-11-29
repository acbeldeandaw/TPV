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
            .fake-a {
                border: 0;
                background-color: rgb(0,0,0,0);
            }
            .fake-a:hover {
                cursor: pointer;
                color: blue;
            }
            .fake-a:focus {
                outline: none;
                box-shadow: none;
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
            .button:hover {
                background-color: purple;
                color: white;
            }
            .paginas {
                display: flex;
                width: 50%;
                flex-wrap: wrap;
                justify-content: space-around;
                margin: auto;
                text-align: center;
            }
            .pag {
                border: 0;
                background: none;
                color: blue;
                font-size: 15px;
            }
            .pag:hover {
                cursor: pointer;
                color: orange;
            }
            .active {
                color: black;
                background-color: transparent;
                border: transparent;
                margin: 0;
                padding: 0;
                text-align: center;
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <h1>LISTADO DE PRODUCTOS</h1>
        <form action="Controlador" method="POST">
            <button class="button" type="submit" name="action" value="insertar">Añadir Producto</button>
            <button class="button" type="button" onclick="location.href='index.html'">Inicio</button>
        </form>
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
                <c:forEach var="prod" items="${lista}">
                    <tr>
                        <td>${prod.nombre}</td>
                        <td>${prod.precio} €</td>
                        <form action="Controlador" method="POST">
                            <input type="hidden" name="id" value="${prod.id}"> 
                            <td><button class="fake-a" type="submit" name="action" onclick="return confirm('¿De verdad quiere eliminar el producto?')" value="borrar">Borrar</button></td>
                            <td><button class="fake-a" type="submit" name="action" value="actualizar">Actualizar</button></td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="paginas">
            <form action="Controlador" method="POST">
                <input type="hidden" name="pag" value="1">
                <button class="pag" type="submit" name="action" value="mostrar"><<</button>
            </form>
            <c:if test="${pag > 1}">  
                  <form action="Controlador" method="POST">
                    <input type="hidden" name="pag" value="${pag-1}">
                    <button class="pag" type="submit" name="action" value="mostrar"><</button>
                </form>
            </c:if> 
            <c:forEach var="p" items="${paginas}">
                <form action="Controlador" method="POST">
                    <input type="hidden" name="pag" value="${p}">
                    <c:if test="${pag == p}">  
                        <a class="active">${p}</a>
                    </c:if> 
                    <c:if test="${pag != p}">  
                        <button class="pag" type="submit" name="action" value="mostrar">${p}</button>
                    </c:if> 
                </form>
            </c:forEach>
            <c:if test="${pag < num_pag}">  
                  <form action="Controlador" method="POST">
                    <input type="hidden" name="pag" value="${pag+1}">
                    <button class="pag" type="submit" name="action" value="mostrar">></button>
                </form>
            </c:if> 
            <form action="Controlador" method="POST">
                <input type="hidden" name="pag" value="${num_pag}">
                <button class="pag" type="submit" name="action" value="mostrar">>></button>
            </form>
        </div>
        <script type="text/javascript">
            alertify.set('notifier','position', 'bottom-center');
            ${msg}
        </script>
    </body>
</html>
