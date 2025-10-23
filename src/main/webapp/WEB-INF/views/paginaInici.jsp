<%-- 
    Document   : paginaInici
    Created on : 28 sept 2025, 17:43:00
    Author     : jmiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ca">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benvingut/da a TotEsBook</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <h1>Hola equip de TotEsBook. Aquesta és la pàgina d'inici</h1>
         <h1> ${benvinguda} </h1>
        <form action="${pageContext.request.contextPath}/mostrarLlibres" method="get">
            <button type="submit">Veure el llistat de llibres</button>
        </form>
        
        <!-- ===== ENCAPÇALAMENT ===== -->
        <header>
            <div class="container d-flex justify-content-between align-items-center">
                <a href="index.jsp" class="navbar-brand text-white">
                    <img src="images/logo.png" alt="TotEsBook Logo" class="logo">
                    TotEsBook
                </a>
                <nav class="nav">
                    <a class="nav-link" href="#">Inici</a>
                    <a class="nav-link" href="#">Les meves reserves</a>
                    <a class="nav-link" href="#">Favorits</a>
                </nav>
            </div>
        </header>

        <!-- ===== RECERCA DE LLIBRES ===== -->
        <section class="search-section">
            <div class="container">
                <h2 class="mb-4 text-dark">Cerca el teu llibre preferit</h2>
                <div class="search-box d-flex justify-content-center">
                    <form action="${pageContext.request.contextPath}/buscarLlibres" method="get" class="d-flex">
                        <input type="text" name="titol" placeholder="Introdueix el títol o autor...">
                        <button type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- ===== LOGIN ===== -->
        <section class="container login-options text-center">
            <h3>Accés al sistema</h3>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <button type="submit" name="rol" value="usuari">Soc Usuari</button>
                <button type="submit" name="rol" value="biblioteca">Personal de biblioteca</button>
                <button type="submit" name="rol" value="sense_registre">Accés sense registre</button>
            </form>
        </section>

        <!-- ===== SECCIÓ DESTACADA ===== -->
        <section class="featured-section">
            <div class="container">
                <div class="featured-card">
                    <h4>📚 Llibre de la setmana: “El nom del vent”</h4>
                    <p>
                        Descobreix el món màgic creat per Patrick Rothfuss, una història plena de misteri,
                        música i aventures. Una recomanació especial per a tots els amants de la fantasia moderna.
                    </p>
                    <a href="#" class="btn btn-outline-info">Llegir més</a>
                </div>
            </div>
        </section>

        <!-- ===== PEU DE PÀGINA ===== -->
        <footer>
            &copy; 2025 TotEsBook | Tots els drets reservats
        </footer>
    </body>
</html>
