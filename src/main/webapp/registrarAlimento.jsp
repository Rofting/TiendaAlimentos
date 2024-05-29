<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<%@ page import="com.svalero.tiendaAlimentos.dao.AlimentoDao" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Alimentos" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<script>
  $(document).ready(function () {
    $("#edit-button").click(function (event) {
      event.preventDefault();
      const form = $("#edit-form")[0];
      const data = new FormData(form);

      $("#edit-button").prop("disabled", true);

      $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: "EditarAlimento",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
          $("#result").html(data);
          $("#name").value("");
          $("#edit-button").prop("disabled", false);
        },
        error: function (error) {
          $("#result").html(error.responseText);
          $("#edit-button").prop("disabled", false);
        }
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
          <h1>Inicia Sesion</h1>
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
          <form class="row g-3 needs-validation" method="post" action="EditarAlimento">
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
              <label for="categoria_id" class="form-label">ID de Categoría</label>
              <input type="number" name="categoria_id" class="form-control" id="categoria_id" placeholder="Ingrese el ID de categoría" required <% if (id != 0) { %> value="<%= alimento.getCategoria_id() %>"<% } %>>
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
              <button class="btn btn-primary" type="submit">Agregar Alimento</button>
              <% } else { %>
              <button class="btn btn-primary" type="submit">Modificar Alimento</button>
              <% } %>
            </div>
          </form>
        </div>
      </div>
    </div>
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
