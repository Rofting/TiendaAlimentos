<%@include file="includes/header.jsp"%>
<head>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Teachers:ital,wght@0,400..800;1,400..800&display=swap" rel="stylesheet">
</head>
<main>
    <section class="py-5 container">
        <% if (id == 0) { %>
        <h3 class="text-danger">Nuevo Alimento</h3>
        <% } else { %>
        <h3 class="text-danger">Modificar Alimento</h3>
        <% } %>
        <br/>
        <form class="row g-3 needs-validation bg-dark border-dark" method="post" enctype="multipart/form-data" id="edit-form">
            <div class="mb-3 text-white bg-dark">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Nombre del alimento"
                    <% if (id != 0) { %> value="<%= alimento.getNombre() %>" <% } %>>
            </div>
            <div class="mb-3 text-white bg-dark">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea name="descripcion" class="form-control" id="descripcion" cols="30" rows="10" placeholder="Descripción"><% if (id != 0) { %> <%= alimento.getDescripcion() %> <% } %></textarea>
            </div>
            <div class="mb-3 text-white bg-dark">
                <label for="categoriaId" class="form-label">Categoría ID</label>
                <input type="number" name="categoriaId" class="form-control" id="categoriaId" placeholder="Categoría ID"
                    <% if (id != 0) { %> value="<%= alimento.getCategoriaId() %>" <% } %>>
            </div>
            <div class="mb-3 text-white bg-dark">
                <label for="contenidoId" class="form-label">Contenido Nutricional ID</label>
                <input type="number" name="contenidoId" class="form-control" id="contenidoId" placeholder="Contenido Nutricional ID"
                    <% if (id != 0) { %> value="<%= alimento.getContenidoId() %>" <% } %>>
            </div>
            <div class="col-12 text-white bg-dark">
                <input type="submit" value="Enviar" id="edit-button"/>
            </div>
            <input type="hidden" name="id_alimento" value="<%= id %>"/>
        </form>
        <br/>
        <div id="result"></div>
        <br/>
        <p><a href="index.jsp" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Volver al menú inicial</a></p>
    </section>
</main>

<%@ include file="includes/footer.jsp" %>
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