<%-- 
    Document   : listadoLibros
    Created on : 9 mar. 2021, 12:11:56
    Author     : diego
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_ES" />

<section id="libros">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Coleccion de libros</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>ISBN</th>
                                <th>Titulo</th>
                                <th>Autor</th>
                                <th>Género</th>
                                <th>Portada</th>
                                <th>Precio</th>
                                <th>Paginas</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="libro" items="${libros}">
                                <tr>
                                    <td>${libro.id}</td>
                                    <td>${libro.isbn}</td>
                                    <td>${libro.titulo}</td>
                                    <td>${libro.autor}</td>
                                    <td>${libro.genero}</td>
                                    <td>${libro.portada}</td>
                                    <td><fmt:formatNumber value="${libro.precio}" type="currency" currencySymbol="$" /></td>
                                    <td>${libro.paginas}</td>
                                    <td>
                                        
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&id=${libro.id}"
                                           class="btn btn-secondary">
                                             <i class="fas fa-angle-double-right"></i>Editar
                                        </a>
                                           
                                    </td>             
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-3">
                
                <!--Tarjetas de informacion-->
                
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/paginas/libro/agregarLibro.jsp"/>