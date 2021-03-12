<%-- 
    Document   : listadoGeneros
    Created on : 12 mar. 2021, 10:38:50
    Author     : diego
--%>

<section id="generos">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Género</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="genero" items="${generos}">
                                <tr>
                                    <td>${genero.id}</td>
                                    <td>${genero.genero}</td>
                                    <td>
                                        
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&id=${libro.id}"
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
</section>
