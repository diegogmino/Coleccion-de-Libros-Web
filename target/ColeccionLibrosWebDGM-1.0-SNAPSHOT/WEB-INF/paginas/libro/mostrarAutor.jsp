<%-- 
    Document   : mostrarAutor
    Created on : 10 mar. 2021, 17:57:27
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libros de ${libros[0].autor}</title>
        <link rel="shortcut icon" href="favicon.png" type="image/x-icon" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/7523bca391.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <!-- ENCABEZADO DE LA PÁGINA-->
        <header id="main-header" class="py-2 bg-primary text-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1>
                            <i class="fas fa-book"></i> Libros de ${libros[0].autor}
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        
        <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionVisualizar.jsp"/>
        <jsp:include page="/WEB-INF/paginas/libro/listadoLibrosAutor.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        
    </body>
</html>
