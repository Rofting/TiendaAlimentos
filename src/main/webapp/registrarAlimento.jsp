<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="includes/header.jsp"%>
<%@ page import="com.svalero.tiendaAlimentos.dao.AlimentoDao" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Alimentos" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<script type="text/javascript">
  $(document).ready(function() {
    $("#edit-form").on("submit", function(event) {
      event.preventDefault();
      const formValue = $(this).serialize();
      $.post("EditarAlimento", formValue, function(data) {
        $("#result").html(data);
      });
    });
  });
</script>
<!DOCTYPE html>
<html lang="es">

<body>

<div class="breadcrumb-section breadcrumb-bg">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2 text-center">
        <div class="breadcrumb-text">
          <p>Como Familia</p>
          <h1>Alimentos</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<%
  Database.connect();
  long id = 0;
  String idParam = request.getParameter("id");
  Alimentos alimento = null;
  if (idParam != null && !idParam.isEmpty()) {
    id = Long.parseLong(idParam);
    final long finalId = id;
    alimento = Database.jdbi.withExtension(AlimentoDao.class, dao -> dao.getAlimentoById(finalId));
  }
%>
<div class="contact-form-section mt-150 mb-150">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mb-5 mb-lg-0">
        <div class="form-title">
          <% if (id == 0) { %>
          <h2>Registrar nuevo alimento</h2>
          <% } else { %>
          <h2>Modificar Alimento</h2>
          <% } %>
        </div>
        <div class="contact-form">
          <form class="row g-3 needs-validation" method="post" enctype="multipart/form-data" id="edit-form">
            <% if (id != 0) { %>
            <input type="hidden" name="id" value="<%= id %>">
            <% } %>
            <div class="col-md-6">
              <label for="nombre" class="form-label">Nombre del Alimento</label>
              <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese el nombre del alimento" required <% if (id != 0) { %> value="<%= alimento.getNombre() %>"<% } %>>
            </div>
            <div class="col-md-6">
              <label for="descripcion" class="form-label">Descripción</label>
              <input type="text" name="descripcion" class="form-control" id="descripcion" placeholder="Ingrese la descripción del alimento" <% if (id != 0) { %> value="<%= alimento.getDescripcion() %>"<% } %>>
            </div>
            <div class="col-md-6">
              <label for="categoria_id" class="form-label">Categoría</label>
              <select name="categoria_id" class="form-select" id="categoria_id" required>
                <option value="">Seleccione una categoría</option>
                <option value="1" <% if (id != 0 && alimento.getCategoria_id() == 1) { %> selected <% } %>>Hornada</option>
                <option value="2" <% if (id != 0 && alimento.getCategoria_id() == 2) { %> selected <% } %>>Alimentos saludables</option>
                <option value="3" <% if (id != 0 && alimento.getCategoria_id() == 3) { %> selected <% } %>>Especias y condimentos</option>
                <option value="4" <% if (id != 0 && alimento.getCategoria_id() == 4) { %> selected <% } %>>Pastas y Arroz</option>
                <option value="5" <% if (id != 0 && alimento.getCategoria_id() == 5) { %> selected <% } %>>Panadería/Pan</option>
                <option value="6" <% if (id != 0 && alimento.getCategoria_id() == 6) { %> selected <% } %>>Refrigerado</option>
                <option value="7" <% if (id != 0 && alimento.getCategoria_id() == 7) { %> selected <% } %>>Enlatado y en frasco</option>
                <option value="8" <% if (id != 0 && alimento.getCategoria_id() == 8) { %> selected <% } %>>Congelado</option>
                <option value="9" <% if (id != 0 && alimento.getCategoria_id() == 9) { %> selected <% } %>>Mantequillas de frutos secos, mermeladas y miel</option>
                <option value="10" <% if (id != 0 && alimento.getCategoria_id() == 10) { %> selected <% } %>>Aceite, vinagre, aderezo para ensaladas</option>
                <option value="11" <% if (id != 0 && alimento.getCategoria_id() == 11) { %> selected <% } %>>Condimentos</option>
                <option value="12" <% if (id != 0 && alimento.getCategoria_id() == 12) { %> selected <% } %>>Bocadillos salados</option>
                <option value="13" <% if (id != 0 && alimento.getCategoria_id() == 13) { %> selected <% } %>>Leche, huevos, otros productos lácteos</option>
                <option value="14" <% if (id != 0 && alimento.getCategoria_id() == 14) { %> selected <% } %>>Comidas étnicas</option>
                <option value="15" <% if (id != 0 && alimento.getCategoria_id() == 15) { %> selected <% } %>>Té y Café</option>
                <option value="16" <% if (id != 0 && alimento.getCategoria_id() == 16) { %> selected <% } %>>Carne</option>
                <option value="17" <% if (id != 0 && alimento.getCategoria_id() == 17) { %> selected <% } %>>Gastrónomo</option>
                <option value="18" <% if (id != 0 && alimento.getCategoria_id() == 18) { %> selected <% } %>>Bocadillos dulces</option>
                <option value="19" <% if (id != 0 && alimento.getCategoria_id() == 19) { %> selected <% } %>>Sin gluten</option>
                <option value="20" <% if (id != 0 && alimento.getCategoria_id() == 20) { %> selected <% } %>>Bebidas alcohólicas</option>
                <option value="21" <% if (id != 0 && alimento.getCategoria_id() == 21) { %> selected <% } %>>Cereal</option>
                <option value="22" <% if (id != 0 && alimento.getCategoria_id() == 22) { %> selected <% } %>>Marisco</option>
                <option value="23" <% if (id != 0 && alimento.getCategoria_id() == 23) { %> selected <% } %>>Queso</option>
                <option value="24" <% if (id != 0 && alimento.getCategoria_id() == 24) { %> selected <% } %>>Frutos secos</option>
                <option value="25" <% if (id != 0 && alimento.getCategoria_id() == 25) { %> selected <% } %>>Pan</option>
              </select>
            </div>
            <div class="col-md-6">
              <label for="contenido_nutricional_id" class="form-label">ID de Contenido Nutricional</label>
              <input type="number" name="contenido_nutricional_id" class="form-control" id="contenido_nutricional_id" placeholder="Ingrese el ID de contenido nutricional" required <% if (id != 0) { %> value="<%= alimento.getContenido_nutricional_id() %>"<% } %>>
            </div>
            <div class="col-md-6">
              <label for="imagen" class="form-label">URL de la Imagen</label>
              <input type="text" name="imagen" class="form-control" id="imagen" placeholder="Ingrese la URL de la imagen" <% if (id != 0) { %> value="<%= alimento.getImagen() %>"<% } %>>
            </div>
            <div class="col-md-6">
              <label for="precio" class="form-label">Precio</label>
              <input type="number" step="0.01" name="precio" class="form-control" id="precio" placeholder="Ingrese el precio" required <% if (id != 0) { %> value="<%= alimento.getPrecio() %>"<% } %>>
            </div>
            <div class="col-12">
              <% if (id == 0) { %>
              <button class="btn btn-primary" type="submit" id="edit-button">Agregar Alimento</button>
              <% } else { %>
              <button class="btn btn-primary" type="submit" id="edit-button">Modificar Alimento</button>
              <% } %>
            </div>
          </form>
          <br>
          <div id="result"></div>
        </div>
      </div>


      <div class="col-lg-4">
        <div class="contact-form-wrap">
          <div class="contact-form-box">
            <h4><i class="fas fa-map"></i> Shop Address</h4>
            <p>34/8, East Hukupara <br> Gifirtok, Sadan. <br> Country Name</p>
          </div>
          <div class="contact-form-box">
            <h4><i class="far fa-clock"></i> Shop Hours</h4>
            <p>MON - FRIDAY: 8 to 9 PM <br> SAT - SUN: 10 to 8 PM </p>
          </div>
          <div class="contact-form-box">
            <h4><i class="fas fa-address-book"></i> Contact</h4>
            <p>Phone: +00 111 222 3333 <br> Email: support@fruitkha.com</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<%@include file="includes/footer.jsp"%>

<!-- end copyright -->

<!-- jquery -->
<script src="assets/js/jquery-1.11.3.min.js"></script>
<!-- bootstrap -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- count down -->
<script src="assets/js/jquery.countdown.js"></script>
<!-- isotope -->
<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
<!-- waypoints -->
<script src="assets/js/waypoints.js"></script>
<!-- owl carousel -->
<script src="assets/js/owl.carousel.min.js"></script>
<!-- magnific popup -->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<!-- mean menu -->
<script src="assets/js/jquery.meanmenu.min.js"></script>
<!-- sticker js -->
<script src="assets/js/sticker.js"></script>
<!-- main js -->
<script src="assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</body>
</html>
