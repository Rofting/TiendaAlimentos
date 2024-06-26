<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<!DOCTYPE html>
<html lang="es">
<script type="text/javascript">
    $(document).ready(function() {
        $("#edit-form").on("submit", function(event) {
            event.preventDefault();
            const formValue = $(this).serialize();
            $.post("EditarRegistroAlimentos", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
<body>

<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>Como Familia</p>
                    <h1>Registro de Consumo</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="contact-form-section mt-150 mb-150" >
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mb-5 mb-lg-0">
                <div class="form-title">
                    <h2>Registrar Consumo de Alimentos</h2>
                </div>
                <div class="contact-form">
                    <form class="row g-3 needs-validation" method="post" enctype="multipart/form-data" id="edit-form">
                        <div class="col-md-6">
                            <label for="usuario_id" class="form-label">ID de Usuario</label>
                            <input type="number" name="usuario_id" class="form-control" id="usuario_id" placeholder="Ingrese el ID de usuario" required>
                        </div>
                        <div class="col-md-6">
                            <label for="alimento_id" class="form-label">ID de Alimento</label>
                            <input type="number" name="alimento_id" class="form-control" id="alimento_id" placeholder="Ingrese el ID del alimento" required>
                        </div>
                        <div class="col-md-6">
                            <label for="cantidad_consumida" class="form-label">Cantidad Consumida</label>
                            <input type="number" step="0.01" name="cantidad_consumida" class="form-control" id="cantidad_consumida" placeholder="Ingrese la cantidad consumida" required>
                        </div>
                        <div class="col-md-6">
                            <label for="fecha_consumo" class="form-label">Fecha de Consumo</label>
                            <input type="date" name="fecha_consumo" class="form-control" id="fecha_consumo" required>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary" type="submit">Registrar Consumo</button>
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
