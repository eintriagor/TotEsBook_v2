<%-- 
    Document   : paginaInici
    Created on : 28 sept 2025, 17:43:00
    Author     : jmiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola Josep. Pàgina inici totEsBook</h1>
         <h1> ${benvinguda} </h1>
        <form action="mostrarLlibres" method="get">
            <button type="submit">Anar a la següent pàgina</button>
        </form>
    </body>
</html>
