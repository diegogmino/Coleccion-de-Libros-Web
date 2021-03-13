<%-- 
    Document   : login
    Created on : 12 mar. 2021, 12:51:59
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/7523bca391.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <header id="main-header" class="py-2 bg-danger text-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <h1>
                            <i class="fas fa-user-tie"></i> Login
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                    <form action="${pageContext.request.contextPath}/LoginControlador?accion=logear"
                        method="POST" class="was-validated">
                            <div class="form-group ms-4 me-4 mt-3">
                                <label for="usuario">Usuario</label>
                                <input type="text" class="form-control" name="usuario" required>
                            </div>
                            <div class="form-group ms-4 me-4 mb-3">
                                <label for="contrasena">Contraseña</label>
                                <input type="password" class="form-control" name="contrasena" required>
                            </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary  position-absolute bottom-0 start-0 mb-3 ms-4" data-bs-toggle="modal" data-bs-target="#agregarUsuarioModal">¿No tienes cuenta?</button>
                            <p class="text-danger">${login}</p>
                            <button class="btn btn-primary" type="submit">Iniciar sesión</button>
                        </div>
                    </form>                          
                    </div>
                </div>
                 <div class="col-md-6">     
                     <img src="https://png2.cleanpng.com/sh/50e609e03451312c08056973e68c2bef/L0KzQYm3VcA2N6V8j5H0aYP2gLBuTfJwd5wye9HBZYKwf8b7jPlvbV5ohNt5LXH1hH68gfVlPWlnTqo8Y0O7RXA8V8c1OWg7UKMAMkW4QIW4WMI2O2o8RuJ3Zx==/kisspng-book-cover-outline-clip-art-5aed58b683c385.5774176815255041825397.png" class="rounded float-end w-75 mt-5 mb-5" alt="Imagen no disponible">      
                </div>
            </div>
        </div>
                            
                            <jsp:include page="/WEB-INF/paginas/login/agregarUsuario.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>   
                
    </body>
</html>
