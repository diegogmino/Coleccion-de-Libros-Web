<%-- 
    Document   : listadoLibrosAutor
    Created on : 10 mar. 2021, 18:10:14
    Author     : diego
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_ES" />

<section id="libros">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>ISBN</th>
                                <th>Titulo</th>
                                <th>Autor</th>
                                <th>Género</th>
                                <th>Paginas</th>
                                <th></th>
                                <th></th>
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
                                    <td>${libro.paginas}</td>
                                    <td>
                                        
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&id=${libro.id}"
                                           class="btn btn-info text-white">
                                             <i class="fas fa-angle-double-right"></i> Editar
                                        </a>
                                           
                                    </td>
                                    <td>
                                        
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&id=${libro.id}"
                                            class="btn btn-danger btn-block">
                                                <i class="fas fa-trash"></i> Eliminar
                                        </a>
                                        
                                    </td>
                                    <td>
                                        
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=visualizar&id=${libro.id}"
                                           class="btn btn-success btn-block">
                                                <i class="fas fa-eye"></i> Visualizar         
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
</section>

