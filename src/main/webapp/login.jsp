<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
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
                            <p>Por favor introduce tu nombre de usuario y contraseña para iniciar sesion.</p>
                        </div>
                        <!-- Formulario de inicio de sesión -->
                        <div id="form_status"></div>
                        <div class="contact-form">
                            <form>
                                <div class="form-floating">
                                    <label for="floatingInput">Usuario</label>
                                    <input type="text" name="nombre_usuario" class="form-control" id="floatingInput" placeholder="Usuario">
                                </div>
                                <div class="form-floating">
                                    <label for="floatingPassword">Contraseña</label>
                                    <input type="password" name="contrasena" class="form-control" id="floatingPassword" placeholder="Contraseña">
                                </div>
                                <button class="btn btn-danger w-100 py-2" type="submit">Iniciar</button>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
                                    <a href="RegistrarUsuario.jsp" class="btn btn-secondary w-100 py-2" type="button">Registrate</a>
                                </div>
                            </form>
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
