<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<%@ page import="com.svalero.tiendaAlimentos.domain.Minerales" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Shop</title>
	<style>
		.product-buttons a {
			display: inline-block;
			margin: 5px 2px;
			padding: 10px 20px;
			color: #fff;
			text-decoration: none;
			border-radius: 5px;
		}
		.btn-delete {
			background-color: red;
		}
		.btn-edit {
			background-color: blue;
		}
		.btn-remove {
			background-color: orange;
		}
		.btn-view {
			background-color: green;
		}
	</style>
</head>
<body>
<!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2 text-center">
				<div class="breadcrumb-text">
					<p>Fresh and Organic</p>
					<h1>Minerales</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb section -->

<form class="row g-2" id="search-form" method="GET" action="BuscarMinerales">
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="Buscar por nombre de vitamina" name="search" id="search-input"
			<% if (request.getParameter("search") != null && !request.getParameter("search").isEmpty()) { %> value="<%= request.getParameter("search") %>"<% } %>>
		<input type="number" class="form-control" placeholder="Cantidad mínima" name="minCantidad" id="minCantidad-input"
			   value="<%= request.getParameter("minCantidad") != null ? request.getParameter("minCantidad") : "" %>">
		<button type="submit" class="btn btn-outline-success" id="search-button">Buscar Mineral</button>
	</div>
</form>

<!-- products -->
<div class="product-section mt-150 mb-150">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="product-filters">
					<ul>
						<li class="active" data-filter="*">All</li>
						<li data-filter=".strawberry">Strawberry</li>
						<li data-filter=".berry">Berry</li>
						<li data-filter=".lemon">Lemon</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row product-lists">
			<%
				List<Minerales> minerales = (List<Minerales>) request.getAttribute("minerales");
				if (minerales != null) {
					for (Minerales mineral : minerales) {
			%>
			<div class="col-lg-4 col-md-6 text-center">
				<div class="single-product-item">
					<div class="product-image">
						<img src="assets/img/products/" alt="">
					</div>
					<h3><%= mineral.getNombre() %></h3>
					<p class="product-price"><span><%= mineral.getCantidad() %></span> $</p>
					<div class="product-buttons">
						<a href="EliminarElemento?entidad=mineral&id=<%= mineral.getId() %>" class="btn-delete">Eliminar</a>
						<a href="registrarMinerales.jsp?id=<%= mineral.getId() %>" class="btn-edit">Editar</a>
						<a href="single-product.jsp" class="btn-view">Ver</a>
					</div>
				</div>
			</div>
			<%
				}
			} else {
			%>
			<p>No se encontraron resultados para la búsqueda.</p>
			<%
				}
			%>
		</div>
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="pagination-wrap">
					<ul>
						<li><a href="#">Prev</a></li>
						<li><a href="#">1</a></li>
						<li><a class="active" href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end products -->

<%@include file="includes/footer.jsp"%>

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
</body>
</html>
