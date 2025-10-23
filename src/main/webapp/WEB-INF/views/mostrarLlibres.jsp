<%-- 
    Document   : mostrarPelicules.jsp
    Created on : 28 sept 2025, 7:01:42
    Author     : jmiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Llibres</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <h1>Aquesta és la pàgina dels llibres que hi ha a la Base de dades!</h1>
        <!--<h2>${llibres}</h2>-->
        <c:forEach var="llibre" items="${llibres}">
            <div>
                <p><strong>ISBN:</strong> ${llibre.isbn}</p>
                <p><strong>Títol:</strong> ${llibre.titol}</p>
                <p><strong>Autor:</strong> ${llibre.autor}</p>
                <p><strong>Sinopsis:</strong> ${llibre.sinopsis}</p>

                <img src="${llibre.imatgeUrl}" alt="Imatge del llibre" width="150" />

                <hr>
            </div>
        </c:forEach>
    </body>
</html>
               