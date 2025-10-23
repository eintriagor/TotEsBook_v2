<%-- 
    Document   : registre
    Created on : 23 oct 2025, 15:19:57
    Author     : edinsonioc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registre - TotEsBook</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">

                <div class="form-page-container">
                    <h2>Crear un Compte</h2>
                    
                    <form action="#" method="POST">
                        <div class="mb-3">
                            <label for="nombre" class="form-label fw-bold">Nom</label>
                            <input type="text" class="form-control form-control-lg" id="nombre" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Correu Electrònic</label>
                            <input type="email" class="form-control form-control-lg" id="email" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="password" class="form-label fw-bold">Contrasenya</label>
                            <input type="password" class="form-control form-control-lg" id="password" required>
                        </div>

                        <div class="mb-3">
                            <label for="password_confirm" class="form-label fw-bold">Confirmar Contrasenya</label>
                            <input type="password" class="form-control form-control-lg" id="password_confirm" required>
                        </div>
                        
                        <button type="submit" class="btn btn-primari-custom mt-3">Registrar-se</button>
                    </form>
                    
                    <div class="text-center mt-4">
                        <p>Ja tens un compte? <a href="login.html">Inicia sessió</a></p>
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>