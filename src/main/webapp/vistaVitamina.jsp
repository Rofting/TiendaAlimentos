<%@include file="includes/header.jsp"%>
<%@ page import="com.svalero.tiendaAlimentos.dao.VitaminaDao" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Vitaminas" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>Ve más detalles</p>
                    <h1>Información</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end breadcrumb section -->

<!-- single product -->
<div class="single-product mt-150 mb-150">
    <div class="container">
        <div class="row">
            <%
                Database.connect();
                long id = 0;
                String idParam = request.getParameter("id");
                Vitaminas vitamina = null;
                if (idParam != null && !idParam.isEmpty()) {
                    try {
                        id = Long.parseLong(idParam);
                        final long finalId = id;
                        vitamina = Database.jdbi.withExtension(VitaminaDao.class, dao -> dao.getVitaminaById(finalId));
                    } catch (NumberFormatException e) {
                        // Manejar la excepción si el ID no es un número válido
                    }
                }
            %>
            <%
                if (vitamina != null) {
            %>
            <div class="col-md-5">
                <div class="single-product-img">
                    <img src="assets/img/products/vitaminas.jpg" alt="">
                </div>
            </div>
            <div class="col-md-7">
                <div class="single-product-content">
                    <h3><%= vitamina.getNombre() %></h3>
                    <p class="single-product-pricing"><span>Por Unidad</span><%= vitamina.getCantidad() %> gramos</p>
                    <div class="single-product-form">
                        <form action="index.jsp">
                            <input type="number" placeholder="0" value="<%= vitamina.getCantidad() %>">
                        </form>
                        <a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        <p><strong>Categories: </strong>Vitaminas, Supplements</p>
                    </div>
                    <h4>Share:</h4>
                    <ul class="product-share">
                        <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href=""><i class="fab fa-twitter"></i></a></li>
                        <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                        <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
            <% } else { %>
            <!-- Si el ID es nulo o la vitamina no se encuentra, muestra un mensaje de error -->
            <div class="col-md-12">
                <h3>No se ha proporcionado un ID válido o la vitamina no se encontró.</h3>
            </div>
            <% } %>
        </div>
    </div>
</div>
<!-- end single product -->

<!-- more products -->
<div class="more-products mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Related</span> Products</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae optio.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Aquí puedes agregar otros productos relacionados de manera similar -->
            <%
                List<Vitaminas> vitaminasRelacionadas = Database.jdbi.withExtension(VitaminaDao.class, dao -> dao.getAllVitaminas());
                for (Vitaminas vitaminaRelacionada : vitaminasRelacionadas) {
            %>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="single-product-item">
                    <div class="product-image">
                        <a href="single-product.jsp?id=<%= vitaminaRelacionada.getId() %>"><img src="assets/img/products/product-img-1.jpg" alt=""></a>
                    </div>
                    <h3><%= vitaminaRelacionada.getNombre() %></h3>
                    <p class="product-price"><span>Por Unidad</span> <%= vitaminaRelacionada.getCantidad() %> gramos</p>
                    <a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
<!-- end more products -->
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
