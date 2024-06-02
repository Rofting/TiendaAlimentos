<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">
<!-- title -->
<title>Fruitkha</title>

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
        .barra-busqueda {
            width: 300px; /* Ajustar el ancho según sea necesario */
            margin: 20px auto; /* Centrar la barra de búsqueda */
            position: relative; /* Para posicionar el botón */
            display: flex; /* Para alinear el botón */
            border: 1px solid #ccc;
            border-radius: 20px; /* Bordes redondeados */
            overflow: hidden; /* Para ocultar los bordes redondeados del botón */
        }

        .entrada-busqueda {
            flex: 1; /* La entrada de búsqueda ocupa todo el espacio disponible */
            padding: 10px;
            border: none;
            border-radius: 20px 0 0 20px; /* Bordes redondeados */
            font-size: 16px;
        }

        .boton-busqueda {
            background-color: #162133;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 0 20px 20px 0; /* Bordes redondeados */
            cursor: pointer;
            font-size: 16px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="loader">
    <div class="loader-inner">
        <div class="circle"></div>
    </div>
</div>
<!-- PreLoader Ends -->

<!-- header -->
<div class="top-header-area" id="sticker">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 text-center">
                <div class="main-menu-wrap">
                    <!-- logo -->
                    <div class="site-logo">
                        <a href="index.jsp">
                            <img src="assets/img/logo.png" alt="">
                        </a>
                    </div>
                    <!-- logo -->

                    <!-- menu start -->
                    <nav class="main-menu">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">Registrar</a>
                                <ul class="sub-menu">
                                    <li><a href="registrarUsuario.jsp">Usuario</a></li>
                                    <li><a href="registrarContenidoNutricional.jsp">Contenido Nutricional</a></li>
                                    <li><a href="registrarAlimento.jsp">Alimento</a></li>
                                    <li><a href="registrarCategoria.jsp">Categoria</a></li>
                                    <li><a href="registrarMinerales.jsp">Minerales</a></li>
                                    <li><a href="registrarVitaminas.jsp">Vitaminas</a></li>
                                    <li><a href="registrarConsumoAlimentos.jsp">Consumo de Alimentos</a></li>
                                </ul>
                            </li>
                            <li><a href="shop.jsp">Alimentos</a></li>
                            <li><a href="mineral.jsp">Minerales</a></li>
                            <li><a href="vitamina.jsp">Vitaminas</a></li>
                            <li>
                                <div class="header-icons">
                                    <a class="shopping-cart" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
                                    <a class="mobile-hide search-bar-icon" href="login.jsp">
                                        <img src="icons/person.svg" alt="Icono de persona" class="white-icon">
                                    </a>

                                </div>
                            </li>
                        </ul>
                    </nav>
                    <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                    <div class="mobile-menu"></div>
                    <!-- menu end -->
                </div>
            </div>
        </div>
    </div>
</div>


