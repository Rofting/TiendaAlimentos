<%@ page import="com.svalero.tiendaAlimentos.dao.MineralDao" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Minerales" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $("#edit-form").on("submit", function(event) {
            event.preventDefault();
            const formValue = $(this).serialize();
            $.post("EditarMineral", formValue, function(data) {
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
    Minerales mineral = null;
    if (idParam != null && !idParam.isEmpty()) {
        id = Long.parseLong(idParam);
        final long finalId = id; // Almacena el valor en una variable final
        mineral = Database.jdbi.withExtension(MineralDao.class, dao -> dao.getMineralById(finalId));
    }
%>

<div class="contact-form-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mb-5 mb-lg-0">
                <div class="form-title">
                    <% if (id == 0) { %>
                    <h2>Registrar nuevo mineral</h2>
                    <% } else { %>
                    <h2>Modificar Mineral</h2>
                    <% } %>
                </div>
                <div class="contact-form">
                    <form class="row g-3 needs-validation" method="post" enctype="multipart/form-data" id="edit-form">
                        <% if (id != 0) { %>
                        <input type="hidden" name="id" value="<%= id %>">
                        <% } %>
                        <div class="col-md-6">
                            <label for="nombre" class="form-label">Nombre del Mineral</label>
                            <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese el nombre del mineral" required <% if (id != 0) { %> value="<%= mineral.getNombre() %>"<% } %>>
                        </div>
                        <div class="col-md-6">
                            <label for="cantidad" class="form-label">Cantidad</label>
                            <input type="number" step="0.01" name="cantidad" class="form-control" id="cantidad" placeholder="Ingrese la cantidad" required <% if (id != 0) { %> value="<%= mineral.getCantidad() %>"<% } %>>
                        </div>
                        <div class="col-12">
                            <% if (id == 0) { %>
                            <button class="btn btn-primary" type="submit">Registrar Mineral</button>
                            <% } else { %>
                            <button class="btn btn-primary" type="submit">Modificar Mineral</button>
                            <% } %>
                        </div>
                    </form>
                    <br>
                    <div id="result"></div>
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
