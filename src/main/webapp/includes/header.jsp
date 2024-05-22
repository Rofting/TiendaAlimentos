<!doctype html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Practicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Teachers:ital,wght@0,400..800;1,400..800&display=swap" rel="stylesheet">
</head>
<%
    HttpSession currentSession = request.getSession();
    String role = "anonymous";
    String username_init ="";
    int user_id=0;
    if (currentSession.getAttribute("role") != null) {
        role = currentSession.getAttribute("role").toString();
    }
    if (currentSession.getAttribute("username") != null) {
        username_init = currentSession.getAttribute("username").toString();
    }
    if (currentSession.getAttribute("id_user") != null) {
        user_id=Integer.parseInt(currentSession.getAttribute("id_user").toString());
    }
%>
<div class="loader">
    <div class="loader-inner">
        <div class="circle"></div>
    </div>
</div>
<!--PreLoader Ends-->

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
                                    <li><a href="registrarConsumo.jsp">Consumo de Alimentos</a></li>
                                </ul>
                            </li>
                            <li><a href="shop.jsp">Alimentos</a></li>
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
<!-- end header -->

<!-- search area -->
