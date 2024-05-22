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
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Shop</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css">

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
					<h1>Ingredientes</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb section -->

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
		<%
		Database.connect();
		List<Alimentos> alimentos = Database.jdbi.withExtension(AlimentoDao.class, dao -> dao.getAllAlimentos());
		for (Alimentos alimento : alimentos) {
		%>
		<div class="row product-lists">
			<div class="col-lg-4 col-md-6 text-center ${alimento.categoria}">
				<div class="single-product-item">
					<div class="product-image">
						<img src="assets/img/products/${alimento.imagen}" alt="">
					</div>
					<h3>nombre</h3>
					<p class="product-price"><span>Per Kg</span> ${alimento.precio} $</p>
					<div class="product-buttons">
						<a href="#" class="btn-delete" onclick="deleteProduct(1)">Borrar</a>
						<!-- Replace '1' with the actual product ID -->
						<a href="#" class="btn-edit">Editar</a>
						<a href="#" class="btn-remove">Eliminar</a>
						<a href="single-product.jsp" class="btn-view">Ver</a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
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
		// Deshabilitar solo el botón clicado
		$(".btn-delete").prop("disabled", true);

		$.ajax({
			type: "GET",
			url: "remove-products?id_product=" + productId,
			success: function (data) {
				// Manejar la respuesta si es necesario
				$(".btn-delete").prop("disabled", false);
				// Actualizar la interfaz según sea necesario
			},
			error: function (error) {
				// Manejar el error si es necesario
				$(".btn-delete").prop("disabled", false);
			}
		});
	}
</script>

</body>
</html>