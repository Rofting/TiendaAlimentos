<%@ page import="com.svalero.tiendaAlimentos.domain.Vitaminas" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.VitaminaDao" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $("#edit-form").on("submit", function(event) {
            event.preventDefault();
            const formValue = $(this).serialize();
            $.post("EditarVitamina", formValue, function(data) {
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
                    <p>Con mas salud</p>
                    <h1>Vitaminas</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    Database.connect();
    long id = 0;
    String idParam = request.getParameter("id");
    Vitaminas vitamina = null;
    if (idParam != null && !idParam.isEmpty()) {
        id = Long.parseLong(idParam);
        final long finalId = id;
        vitamina = Database.jdbi.withExtension(VitaminaDao.class, dao -> dao.getVitaminaById(finalId));
    }
%>

<div class="contact-form-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mb-5 mb-lg-0">
                <div class="form-title">
                    <h2><% if (vitamina == null) { %>Registrar<% } else { %>Modificar<% } %> Vitamina</h2>
                </div>
                <div class="contact-form">
                    <form class="row g-3 needs-validation" method="post" enctype="multipart/form-data" id="edit-form">
                        <% if (vitamina != null) { %>
                        <input type="hidden" name="id" value="<%= vitamina.getId() %>">
                        <% } %>
                        <div class="col-md-6">
                            <label for="nombre" class="form-label">Nombre de la Vitamina</label>
                            <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese el nombre de la vitamina" required <% if (vitamina != null) { %> value="<%= vitamina.getNombre() %>"<% } %>>
                        </div>
                        <div class="col-md-6">
                            <label for="cantidad" class="form-label">Cantidad</label>
                            <input type="number" step="1" name="cantidad" class="form-control" id="cantidad" placeholder="Ingrese la cantidad" required <% if (vitamina != null) { %> value="<%= vitamina.getCantidad() %>"<% } %>>
                        </div>
                        <div class="col-12">
                            <% if (vitamina == null) { %>
                            <button class="btn btn-primary" type="submit">Registrar Vitamina</button>
                            <% } else { %>
                            <button class="btn btn-primary" type="submit">Modificar Vitamina</button>
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
