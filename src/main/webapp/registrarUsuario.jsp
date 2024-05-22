<%@ page import="com.svalero.tiendaAlimentos.domain.Usuarios" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.UsuarioDao" %>
<%@ page import="com.svalero.tiendaAlimentos.dao.Database" %>
<%@ page import="com.svalero.tiendaAlimentos.util.ErrorUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-user", formValue, function(data) {
                $("#result").html(data);
            }).fail(function(xhr, status, error) {
                $("#result").html("Error: " + xhr.responseText);
            });
        });
    });
</script>

<%
    Usuarios user = null;
    int id;
    if (request.getParameter("id") == null) {
        id = 0;
    } else {
        id = Integer.parseInt(request.getParameter("id"));
        try {
            Database.connect();
            user = Database.jdbi.withExtension(UsuarioDao.class, dao -> dao.getUsuarioById(id));
        } catch (ClassNotFoundException | SQLException e) {
            ErrorUtils.sendError("Error de conexión a la base de datos", response);
        }
    }
%>
<main>
    <section class="py-5 container">
        <% if (id==0) {%>
        <h3 class="text-white">Nuevo Usuario</h3>
        <% } else { %>
        <h3 class="text-white">Modificar Usuario</h3>
        <% } %>
        <br/>
        <form class="row g-3 needs-validation bg-dark border-dark" method="post" enctype="multipart/form-data" id="edit-form">
            <div class="col-md-6 text-white bg-dark">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" id="nombre" placeholder=".." value="<%= (user != null) ? user.getNombre() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" name="apellido" class="form-control" id="apellido" placeholder=".." value="<%= (user != null) ? user.getApellido() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="nombreUsuario" class="form-label">Nombre de usuario</label>
                <input type="text" name="nombreUsuario" class="form-control" id="nombreUsuario" placeholder=".." value="<%= (user != null) ? user.getNombreUsuario() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="contrasena" class="form-label">Contrasena</label>
                <input type="text" name="contrasena" class="form-control" id="contrasena" placeholder="Example Labcdef1B">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="email" class="form-label">Email</label>
                <input type="email" name="email" class="form-control" id="email" placeholder=".." value="<%= (user != null) ? user.getEmail() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="genero" class="form-label">Genero</label>
                <input type="text" name="genero" class="form-control" id="genero" placeholder=".." value="<%= (user != null) ? user.getGenero() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="nivelActividad" class="form-label">Nivel de Actividad</label>
                <input type="text" name="nivelActividad" class="form-control" id="nivelActividad" placeholder=".." value="<%= (user != null) ? user.getNivelActividad() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="objetivoSalud" class="form-label">objetivoSalud</label>
                <input type="text" name="objetivoSalud" class="form-control" id="objetivoSalud" placeholder=".." value="<%= (user != null) ? user.getObjetivoSalud() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="preferenciasAlimenticias" class="form-label">Preferencias Alimenticias</label>
                <input type="text" name="preferenciasAlimenticias" class="form-control" id="preferenciasAlimenticias" placeholder=".." value="<%= (user != null) ? user.getPreferenciasAlimenticias() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="altura" class="form-label">Altura</label>
                <input type="text" name="altura" class="form-control" id="altura" placeholder=".." value="<%= (user != null) ? user.getPeso() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="peso" class="form-label">Peso</label>
                <input type="text" name="peso" class="form-control" id="peso" placeholder=".." value="<%= (user != null) ? user.getFechaNacimiento() : "" %>">
            </div>
            <div class="col-md-6 text-white bg-dark">
                <label for="fechaNacimiento" class="form-label">fechaNacimiento</label>
                <input type="date" name="fechaNacimiento" class="form-control" id="fechaNacimiento" placeholder=".." value="<%= (user != null) ? user.getEmail() : "" %>">
            </div>
            <div class="col-12">
                <button class="btn btn-danger" type="submit">Registar Usuario</button>
            </div>
            <input type="hidden" name="id" value="<%=id%>"/>
        </form>
        <br/>
        <div id="result"></div>
        <br/>
        <p><a href="index.jsp" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Back to initial menu</a></p>
    </section>
</main>
</html>
<%@include file="includes/footer.jsp"%>
