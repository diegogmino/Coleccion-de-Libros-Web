<%-- 
    Document   : botonesNavegacion
    Created on : 9 mar. 2021, 11:58:46
    Author     : diego
--%>

<section id="actions" class="py-4 mb-12 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregarLibroModal">Añadir libro</button> 
                        <jsp:include page="/WEB-INF/paginas/libro/agregarLibro.jsp"/>
                     </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-warning text-white" data-bs-toggle="modal" data-bs-target="#agregarGeneroModal">Añadir género</button>
                        <jsp:include page="/WEB-INF/paginas/libro/agregarGenero.jsp"/>
                     </div>
                     <div class="col-md-2">
                         <a href="${pageContext.request.contextPath}/ServletControlador?accion=mostrarGeneros" class="btn btn-secondary text-white">Mostrar géneros</a>           
                     </div>
                     <div class="col-md-2">
                        <a href="index.jsp" class="btn btn-info btn-block text-white">Cerrar sesión</a>
                    </div>
                </div>
            </div>
</section>