<%@ page import="com.svalero.tiendaAlimentos.util.DateUtils" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Usuarios" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.UsuarioDao"%>
<%@ page import="com.svalero.tiendaAlimentos.dao.UsuarioMapper"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $("#edit-form").on("submit", function(event) {
            event.preventDefault();
            const formValue = $(this).serialize();
            $.post("EditarUsuario", formValue, function(data) {
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

<div class="contact-from-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mb-5 mb-lg-0">
                <div class="form-title">
                    <h2>Cuenta</h2>
                    <p>Rellena el formulario para crear una cuenta.</p>
                </div>
                <!-- Formulario de inicio de sesión -->
                <div id="form_status"></div>
                <div class="contact-form">
                    <form class="row g-3 needs-validation" method="post" enctype="multipart/form-data" id="edit-form">
                        <div class="col-md-6">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" name="nombre" class="form-control" id="nombre" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" name="apellido" class="form-control" id="apellido" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="nombre_usuario" class="form-label">Nombre de usuario</label>
                            <input type="text" name="nombre_usuario" class="form-control" id="nombre_usuario" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="contrasena" class="form-label">Contraseña</label>
                            <input type="password" name="contrasena" class="form-control" id="contrasena" placeholder="Example Labcdef1B" required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="genero" class="form-label">Género</label>
                            <input type="text" name="genero" class="form-control" id="genero" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="nivel_actividad" class="form-label">Nivel de Actividad</label>
                            <input type="text" name="nivel_actividad" class="form-control" id="nivel_actividad" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="objetivo_salud" class="form-label">Objetivo Salud</label>
                            <input type="text" name="objetivo_salud" class="form-control" id="objetivo_salud" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="preferencias_alimenticias" class="form-label">Preferencias Alimenticias</label>
                            <input type="text" name="preferencias_alimenticias" class="form-control" id="preferencias_alimenticias" placeholder=".." required>
                        </div>
                        <div class="col-md-6">
                            <label for="rol" class="form-label">Rol</label>
                            <input type="text" name="rol" class="form-control" id="rol" placeholder=".." required>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-danger" type="submit">Registrar Usuario</button>
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

