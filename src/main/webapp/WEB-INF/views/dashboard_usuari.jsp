<%-- 
    Document   : dashboard_usuari.jsp
    Created on : 23 oct 2025, 14:26:50
    Author     : edinsonioc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Panell - Usuari</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <nav class="navbar">
    <a href="paginaInici.jsp" class="logo">TotEsBook</a>
    <div class="nav-links">
      <a href="#els-meus-llibres">Els Meus Préstecs</a>
      <a href="#buscar">Cercar Llibres</a>
      <a href="paginaInici.jsp" class="btn-acento">Tancar Sessió</a>
    </div>
  </nav>

  <div class="container">
    <h2>Benvingut/da, [Nom d'Usuari]</h2>
    <p>Aquest és el teu panell personal. Aquí pots veure els llibres que tens en préstec i cercar nous títols.</p>
    
    <hr style="margin: 20px 0;">

    <section id="els-meus-llibres">
      <h3>Els Meus Préstecs Actuals</h3>
      <div class="llibre-item">
        <p><strong>El nombre del viento</strong> - Venciment: 30/10/2025</p>
        <button class="btn-primari" style="width: auto; padding: 8px;">Renovar</button>
      </div>
      <div class="llibre-item">
        <p><strong>Cien años de soledad</strong> - Venciment: 05/11/2025</p>
        <button class="btn-primari" style="width: auto; padding: 8px;">Renovar</button>
      </div>
    </section>
  </div>

</body>
</html>
