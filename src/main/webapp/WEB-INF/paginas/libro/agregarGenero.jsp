<%-- 
    Document   : agregarGenero
    Created on : 11 mar. 2021, 9:58:36
    Author     : diego
--%>

<div class="modal fade" id="agregarGeneroModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Añadir genero</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertarGenero"
                  method="POST" class="was-validated">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="genero">Género</label>
                        <input type="text" class="form-control" name="genero" required>
                    </div>
                    <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">Guardar</button>
                </div>
            </form>
      </div>
    </div>
  </div>
</div>
</div>
