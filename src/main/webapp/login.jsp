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
        <link rel="shortcut icon" href="favicon.png" type="image/x-icon" />
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
                <div class="col-md-7">
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
                            <button type="button" class="btn btn-outline-secondary  position-absolute bottom-0 start-0 mb-3 ms-4" data-bs-toggle="modal" data-bs-target="#agregarUsuarioModal">¿No tienes cuenta?</button>
                            <p class="text-danger">${login}</p>
                            <button class="btn btn-outline-primary" type="submit">Iniciar sesión</button>
                        </div>
                    </form>                          
                    </div>
                </div>
                 <div class="col-md-5">     
                     <img src="https://png2.cleanpng.com/sh/2260ab762b709b292ce79636d6487a76/L0KzQYm3U8I6N5Z9fZH0aYP2gLBuTfJwd5wyi9t1aHB4dcX7hb1zd6pmhOZELXb1dba0gBxqeF5miuY2b4Dofn7pjB9sNWZmetYDN3SzcoSBWfQ2NmE9SqcEMkG8QYa5UsM4OGY2Sqk8NUSxgLBu/kisspng-book-silhouette-royalty-free-clip-art-open-book-5abd87d0b389d5.0825921915223705127354.png" class="rounded float-end w-75 mt-5 mb-5" alt="Imagen no disponible">      
                </div>
            </div>
        </div>
                            
         <jsp:include page="/WEB-INF/paginas/login/agregarUsuario.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>   
                
    </body>
</html>
