<%-- 
    Document   : dashboard_bibliotecari.jsp
    Created on : 23 oct 2025, 14:27:27
    Author     : edinsonioc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Panell - Bibliotecari</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <nav class="navbar">
    <a href="#" class="logo">TotEsBook (Personal)</a>
    <div class="nav-links">
      <a href="#gestionar-prestecs">Gestionar Préstecs</a>
      <a href="#gestionar-llibres">Gestionar Llibres</a>
      <a href="paginaInici.jsp" class="btn-acento">Tancar Sessió</a>
    </div>
  </nav>

  <div class="container">
    <h2>Panell del Bibliotecari</h2>
    <p>Gestió de préstecs, devolucions i catàleg de llibres.</p>
    
    <hr style="margin: 20px 0;">

    <section id="gestionar-prestecs">
      <h3>Gestió de Préstecs</h3>
      <input type="text" placeholder="Cercar usuari..." style="padding: 8px;">
      <input type="text" placeholder="Cercar llibre (ISBN)..." style="padding: 8px;">
      <button class="btn-primario">Registrar Préstec</button>
    </section>
  </div>

</body>
</html>
