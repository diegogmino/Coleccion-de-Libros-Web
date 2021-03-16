<%-- 
    Document   : editarLibro
    Created on : 10 mar. 2021, 9:39:17
    Author     : diego
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="shortcut icon" href="favicon.png" type="image/x-icon" />
        <script src="https://kit.fontawesome.com/7523bca391.js" crossorigin="anonymous"></script>
        
        <title>Editar libro</title>
    </head>
    <body>
        
        <!-- ENCABEZADO DE LA PÁGINA-->
        <header id="main-header" class="py-2 bg-info text-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <h1>
                            <i class="fas fa-book"></i> Editar: ${libro.titulo}
                        </h1>
                    </div>
                </div>
            </div>
        </header>
       
        <form action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&id=${libro.id}"
              method="POST" class="was-validated">
            
            <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionEdicion.jsp"/>
            
            <section id="details">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="isbn">ISBN</label>
                                        <input type="number" class="form-control" name="isbn" required
                                               value="${libro.isbn}">
                                    </div>
                                    <div class="form-group">
                                        <label for="titulo">Título</label>
                                        <input type="text" class="form-control" name="titulo" required
                                               value="${libro.titulo}">
                                    </div>
                                    <div class="form-group">
                                        <label for="autor">Autor</label>
                                        <input type="text" class="form-control" name="autor" required
                                               value="${libro.autor}">
                                    </div>
                                    <div class="form-group">
                                        <label for="genero">Género</label>
                                    </div>
                                    <div class="input-group form-group">
                                        <select class="form-select"  name="genero" id="genero" required>
                                            <option selected class="text-primary">${libro.genero}</option>
                                            <c:forEach  var="genero" items="${generos}">
                                                <option value="${genero.genero}">${genero.genero}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="portada">Portada</label>
                                        <input type="text" class="form-control" name="portada" required
                                               value="${libro.portada}">
                                    </div>
                                    <div class="form-group">
                                        <label for="precio">Precio</label>
                                        <input type="number" class="form-control" name="precio"  step="any" required
                                               value="${libro.precio}">
                                    </div>
                                    <div class="form-group">
                                        <label for="paginas">Páginas</label>
                                        <input type="number" class="form-control" name="paginas" required
                                               value="${libro.paginas}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>  
        </form>
        
        
        
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
       
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        
    </body>
</html>
