<%-- 
    Document   : mostrarGeneros
    Created on : 12 mar. 2021, 10:12:37
    Author     : diego
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/7523bca391.js" crossorigin="anonymous"></script>
        
        <title>Lista de libros</title>
    </head>
    <body>
        
        <header id="main-header" class="py-2 bg-secondary text-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1>
                            <i class="fas fa-list"></i> Listado de géneros
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        
        <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionVisualizar.jsp"/> 
        
        <div class="container mt-5">
        <div class="row">
        <div class="col-md-10">
        <div class="card">
        <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Genero</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="generos" items="${generos}">
                                <tr>
                                    <td>${generos.id}</td>
                                    <td>${generos.genero}</td>
                                    <td>
                                        
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminarGenero&id=${generos.id}"
                                            class="btn btn-danger btn-block">
                                                <i class="fas fa-trash"></i> Eliminar
                                        </a>
                                        
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                            
                        </tbody>
         </table>
        </div>
        </div>
        </div>
        </div>
            
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        
    </body>
</html>
