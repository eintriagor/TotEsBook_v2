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
        <title>TotEsBook - Inici</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <style>
            /* ===== PALETA DE COLORS ===== */
            :root {
                --color-principal: #92dbe6;
                --color-secundario: #00acd1;
                --color-acento: #e07225;
                --color-alternativa: #e6f4f1;
            }

            body {
                background-color: var(--color-alternativa);
                font-family: 'Segoe UI', sans-serif;
            }

            /* ===== ENCABEZADO ===== */
            header {
                background-color: var(--color-secundario);
                color: white;
                padding: 10px 0;
            }

            header .navbar-brand {
                font-weight: bold;
                font-size: 1.5rem;
                display: flex;
                align-items: center;
            }

            header .logo {
                width: 45px;
                height: auto;
                margin-right: 10px;
            }

            header .nav-link {
                color: white !important;
                margin: 0 10px;
                font-weight: 500;
            }

            header .nav-link:hover {
                color: var(--color-principal) !important;
                text-decoration: underline;
            }

            /* ===== SECCIÓN DE BÚSQUEDA ===== */
            .search-section {
                background-color: var(--color-principal);
                padding: 60px 0;
                text-align: center;
            }

            .search-box input {
                width: 50%;
                max-width: 500px;
                border-radius: 20px;
                border: 2px solid var(--color-secundario);
                padding: 10px 20px;
            }

            .search-box button {
                background-color: var(--color-acento);
                color: white;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                margin-left: 10px;
            }

            .search-box button:hover {
                background-color: #c75f1e;
            }

            /* ===== LOGIN ===== */
            .login-options {
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
                padding: 30px;
                margin-top: -40px;
            }

            .login-options h3 {
                color: var(--color-secundario);
                margin-bottom: 20px;
            }

            .login-options button {
                width: 100%;
                margin-bottom: 10px;
                background-color: var(--color-principal);
                border: none;
                color: #003366;
                font-weight: 600;
                border-radius: 8px;
                padding: 10px;
            }

            .login-options button:hover {
                background-color: var(--color-secundario);
                color: white;
            }

            /* ===== BLOG / LIBRO DESTACADO ===== */
            .featured-section {
                background-color: var(--color-alternativa);
                padding: 60px 20px;
            }

            .featured-card {
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                padding: 30px;
            }

            .featured-card h4 {
                color: var(--color-acento);
            }

            footer {
                background-color: var(--color-secundario);
                color: white;
                padding: 10px;
                text-align: center;
            }
        </style>
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
