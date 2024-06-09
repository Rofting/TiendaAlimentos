<%@include file="includes/header.jsp"%>
<%@ page import="com.svalero.tiendaAlimentos.dao.AlimentoDao" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Alimentos" %>
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
				if (idParam != null && !idParam.isEmpty()) {
					id = Long.parseLong(idParam);
					final long finalId = id; // Almacena el valor en una variable final
					Alimentos alimento = Database.jdbi.withExtension(AlimentoDao.class, dao -> dao.getAlimentoById(finalId));
			%>
			<div class="col-md-5">
				<div class="single-product-img">
					<img src="../products/<%=alimento.getImagen()%>"  alt=""/>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-content">
					<h3><%= alimento.getNombre() %></h3>
					<p class="single-product-pricing"><span>Por Kilo</span><%= alimento.getPrecio() %></p>
					<p><%= alimento.getDescripcion() %></p>
					<div class="single-product-form">
						<form action="index.jsp">
							<input type="number" placeholder="0" value="<%= alimento.getPrecio() %>">
						</form>
						<a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
						<p><strong>Categories: </strong>Fruits, Organic</p>
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
			<!-- Si el ID es nulo, deja los campos del formulario vacíos -->
			<div class="col-md-12">
				<h3>No se ha proporcionado un ID válido.</h3>
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
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.jsp"><img src="assets/img/products/product-img-1.jpg" alt=""></a>
						</div>
						<h3>Strawberry</h3>
						<p class="product-price"><span>Per Kg</span> 85$ </p>
						<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.jsp"><img src="assets/img/products/product-img-2.jpg" alt=""></a>
						</div>
						<h3>Berry</h3>
						<p class="product-price"><span>Per Kg</span> 70$ </p>
						<a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-lg-0 offset-md-3 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.jsp"><img src="assets/img/products/product-img-3.jpg" alt=""></a>
						</div>
						<h3>Lemon</h3>
						<p class="product-price"><span>Per Kg</span> 35$ </p>
						<a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
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