<%-- 
    Document   : botonesNavegacionEdicion
    Created on : 10 mar. 2021, 9:58:01
    Author     : diego
--%>

<section id="actions" class="py-4 mb-4 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <a href="index.jsp" class="btn btn-light btn-block">
                    <i class="fas fa-arrow-left"></i> Regresar al inicio
                </a>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-success btn-block">
                    <i class="fas fa-check"></i> Guardar libro
                </button>
            </div>
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&id=${libro.id}"
                   class="btn btn-danger btn-block">
                    <i class="fas fa-trash"></i> Eliminar libro
                </a>
            </div>
        </div>
    </div>
</section>
