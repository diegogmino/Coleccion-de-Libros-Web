<%-- 
    Document   : botonesNavegacion
    Created on : 9 mar. 2021, 11:58:46
    Author     : diego
--%>

<section id="actions" class="py-4 mb-12 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#agregarLibroModal">Añadir libro</button> 
                        <jsp:include page="/WEB-INF/paginas/libro/agregarLibro.jsp"/>
                     </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#agregarGeneroModal">Añadir género</button>
                        <jsp:include page="/WEB-INF/paginas/libro/agregarGenero.jsp"/>
                     </div>
                     <div class="col-md-2">
                         <a href="${pageContext.request.contextPath}/ServletControlador?accion=mostrarGeneros" class="btn btn-outline-warning">Mostrar géneros</a>           
                     </div>
                     
                </div>
            </div>
</section>