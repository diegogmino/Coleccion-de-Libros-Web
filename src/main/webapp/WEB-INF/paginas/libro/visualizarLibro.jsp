<%-- 
    Document   : visualizarLibro
    Created on : 10 mar. 2021, 13:04:10
    Author     : diego
--%>

<%@page import="datos.LibroDaoJDBC"%>
<%@page import="dominio.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/7523bca391.js" crossorigin="anonymous"></script>
        
        <title>Ficha de: ${libro.titulo}</title>
    </head>
    <body>
        
        <!-- ENCABEZADO DE LA PÁGINA-->
        <header id="main-header" class="py-2 bg-success text-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <h1>
                            <i class="fas fa-book"></i> Ficha de: ${libro.titulo}
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        
        <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionVisualizar.jsp"/>                
                        
        <!--FICHA TÉCNICA Y FOTO-->                
                        
         <div class="container">
             <div class="row">
                 <div class="col-md-6">
                     <div class="container mt-5">
                         <div class="row bg-light">
                             <div class="col-md-6  text-center">
                                 <h4>ISBN</h4>
                             </div>
                             <div class="col-md-6 text-center">
                                 <h4>${libro.isbn}</h4>
                             </div>
                         </div>
                         <div class="row bg-secondary">
                             <div class="col-md-6  text-center text-white">
                                 <h4>Titulo</h4>
                             </div>
                             <div class="col-md-6 text-center text-white">
                                 <h4>${libro.titulo}</h4>
                             </div>
                         </div>
                         <div class="row bg-light">
                             <div class="col-md-6  text-center">
                                 <h4>Autor</h4>
                             </div>
                             <div class="col-md-6 text-center">
                                 <h4><a href="${pageContext.request.contextPath}/ServletControlador?accion=autor&autor=${libro.autor}" class="link-success">${libro.autor}</a></h4>
                             </div>
                         </div>
                         <div class="row bg-secondary">
                             <div class="col-md-6  text-center text-white">
                                 <h4>Género</h4>
                             </div>
                             <div class="col-md-6 text-center text-white">
                                 <h4>${libro.genero}</h4>
                             </div>
                         </div>
                         <div class="row bg-light">
                             <div class="col-md-6  text-center">
                                 <h4>Precio</h4>
                             </div>
                             <div class="col-md-6 text-center">
                                 <h4><fmt:formatNumber value="${libro.precio}" type="currency" currencySymbol="€"/></h4>
                             </div>
                         </div>
                         <div class="row bg-secondary">
                             <div class="col-md-6  text-center text-white">
                                 <h4>Páginas</h4>
                             </div>
                             <div class="col-md-6 text-center text-white">
                                 <h4>${libro.paginas}</h4>
                             </div>
                         </div>    
                     </div>                                          
                 </div>
                 <div class="col-md-6">
                     
                     <img src="${libro.portada}" class="rounded float-end w-75 p-3" alt="Portada no disponible">
                 </div>
             </div>
         </div>
        
        
        
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        
    </body>
</html>
