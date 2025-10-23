<%-- 
    Document   : recuperarPass
    Created on : 23 oct 2025, 15:20:14
    Author     : edinsonioc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contrasenya - TotEsBook</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">

                <div class="form-page-container">
                    <h2>Recuperar Contrasenya</h2>
                    <p class="text-center mb-4">Introdueix el teu correu electrònic i t'enviarem les instruccions per restablir-la.</p>
                    
                    <form action="#" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Correu Electrònic</label>
                            <input type="email" class="form-control form-control-lg" id="email" required>
                        </div>
                        
                        <button type="submit" class="btn btn-accent-custom mt-3">Enviar Instruccions</button>
                    </form>
                    
                    <div class="text-center mt-4">
                        <a href="login.html">Tornar a l'inici de sessió</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>