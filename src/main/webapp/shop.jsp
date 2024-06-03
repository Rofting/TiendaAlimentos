<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<%@ page import="com.svalero.tiendaAlimentos.dao.AlimentoDao" %>
<%@ page import="com.svalero.tiendaAlimentos.domain.Alimentos" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.AlimentosMapper" %>
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
					<h1>Alimentos</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb section -->
<div class="container align-content-center">
	<form class="row g-2" id="search-form" method="GET">
		<div class="mb-1">
			<input type="text" class="form-control entrada-busqueda" placeholder="Nombre del Alimento" name="nombre" id="nombre-input">
		</div>
		<div class="mb-1">
			<input type="number" class="form-control entrada-busqueda" placeholder="Precio" name="precio" id="precio-input">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3 boton-busqueda" id="search-button">Buscar</button>
		</div>
	</form>
</div>
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
				try {
					Database.connect();
					String nombre = request.getParameter("nombre");
					String precioParam = request.getParameter("precio");
					float precio = precioParam != null && !precioParam.isEmpty() ? Float.parseFloat(precioParam) : -1;

					List<Alimentos> alimentos = Database.jdbi.withExtension(AlimentoDao.class, dao -> {
						if (nombre != null && !nombre.isEmpty() && precio > -1) {
							return dao.findAlimentosByNombreAndPrecio(nombre, precio);
						} else if (nombre != null && !nombre.isEmpty()) {
							return dao.findAlimentosByNombre(nombre);
						} else if (precio > -1) {
							return dao.findAlimentosByPrecio(precio);
						} else {
							return dao.getAllAlimentos();
						}
					});

					for (Alimentos alimento : alimentos) {
			%>
			<div class="col-lg-4 col-md-6 text-center">
				<div class="single-product-item">
					<div class="product-image">
						<img src="assets/img/products/" alt="">
					</div>
					<h3><%= alimento.getNombre() %></h3>
					<p class="product-price"><span><%= alimento.getPrecio() %></span> $</p>
					<div class="product-buttons">
						<a href="EliminarElemento?entidad=alimento&id=<%= alimento.getId() %>" class="btn-delete">Eliminar</a>
						<a href="registrarAlimento.jsp?id=<%= alimento.getId() %>" class="btn-edit">Editar</a>
						<a href="single-product.jsp?id=<%= alimento.getId() %>" class="btn-view">Ver</a>
					</div>
				</div>
			</div>
			<%
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					Database.close();
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

<script>
	function deleteProduct(productId) {
		$(".btn-delete").prop("disabled", true);

		$.ajax({
			type: "GET",
			url: "remove-products?id_product=" + productId,
			success: function (data) {
				$(".btn-delete").prop("disabled", false);
			},
			error: function (error) {
				$(".btn-delete").prop("disabled", false);
			}
		});
	}
</script>

</body>
</html>
