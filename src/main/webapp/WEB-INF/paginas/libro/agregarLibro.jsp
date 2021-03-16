<%-- 
    Document   : agregarLibro
    Created on : 9 mar. 2021, 13:21:24
    Author     : diego
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="agregarLibroModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Añadir libro a la coleccion</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
                  method="POST" class="was-validated">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="isbn">ISBN</label>
                        <input type="number" class="form-control" name="isbn" required>
                    </div>
                    <div class="form-group">
                        <label for="titulo">Título</label>
                        <input type="text" class="form-control" name="titulo" required>
                    </div>
                    <div class="form-group">
                        <label for="autor">Autor</label>
                        <input type="text" class="form-control" name="autor" required>
                    </div>
                    <div class="form-group">
                        <label for="autor">Género</label>
                    </div>
                    <div class="input-group form-group">
                        <select class="form-select" name="genero" id="genero" required>
                            <c:forEach  var="genero" items="${generos}">
                                <option value="${genero.genero}">${genero.genero}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="portada">Portada</label>
                        <input type="text" class="form-control" name="portada" required>
                    </div>
                    <div class="form-group">
                        <label for="precio">Precio</label>
                        <input type="number" class="form-control" name="precio" step="any" required>
                    </div>
                    <div class="form-group">
                        <label for="paginas">Páginas</label>
                        <input type="number" class="form-control" name="paginas" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-outline-primary" type="submit">Guardar</button>
                </div>
                 
            </form> 
          
      </div>
    </div>
  </div>
</div>
