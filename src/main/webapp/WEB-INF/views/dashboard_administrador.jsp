<%-- 
    Document   : dashboard_administrador
    Created on : 23 oct 2025, 14:34:02
    Author     : edinsonioc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Panell - Administrador</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <nav class="navbar">
    <a href="#" class="logo">TotEsBook (Admin)</a>
    <div class="nav-links">
      <a href="#gestionar-usuaris">Gestionar Usuaris</a>
      <a href="dashboard_bibliotecari.jsp">Panell Bibliotecari</a>
      <a href="paginaInici.jsp" class="btn-acento">Tancar Sessió</a>
    </div>
  </nav>

  <div class="container">
    <h2>Panell d'Administrador</h2>
    <p>Gestió d'usuaris del sistema (Bibliotecaris i Usuaris).</p>
    
    <hr style="margin: 20px 0;">

    <section id="gestionar-usuaris">
      <h3>Gestió d'Usuaris</h3>
      <button class="btn-acento">Crear Nou Usuari</button>
      <br><br>
      <p>Llista d'usuaris...</p>
      </section>
  </div>

</body>
</html>