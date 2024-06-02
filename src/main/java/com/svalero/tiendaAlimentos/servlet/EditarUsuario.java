package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.UsuarioDao;
import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.util.Constants;
import com.svalero.tiendaAlimentos.util.ErrorUtils;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendError;
import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendMessage;

@WebServlet(name = "EditarUsuario", value = "/EditarUsuario")
public class EditarUsuario extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        if (Database.jdbi == null) {
            try {
                Class.forName(Constants.DRIVER);
                Database.jdbi = Jdbi.create(Constants.CONNECTION_STRING, Constants.USERNAME, Constants.PASSWORD);
                Database.jdbi.installPlugin(new SqlObjectPlugin());
            } catch (ClassNotFoundException e) {
                throw new ServletException("Database driver not found", e);
            } catch (Exception e) {
                throw new ServletException("Database connection initialization failed", e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nombreUsuario = request.getParameter("nombre_usuario");
        String contrasena = request.getParameter("contrasena");
        String email = request.getParameter("email");
        String genero = request.getParameter("genero");
        String nivelActividad = request.getParameter("nivel_actividad");
        String objetivoSalud = request.getParameter("objetivo_salud");
        String preferenciasAlimenticias = request.getParameter("preferencias_alimenticias");
        String rol = request.getParameter("rol");

        if (nombre == null || apellido == null || nombreUsuario == null || contrasena == null || email == null || genero == null || nivelActividad == null || objetivoSalud == null || preferenciasAlimenticias == null || rol == null ||
                nombre.isEmpty() || apellido.isEmpty() || nombreUsuario.isEmpty() || contrasena.isEmpty() || email.isEmpty() || genero.isEmpty() || nivelActividad.isEmpty() || objetivoSalud.isEmpty() || preferenciasAlimenticias.isEmpty() || rol.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Todos los campos son obligatorios.");
            return;
        }

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            int affectedRows = Database.jdbi.withExtension(UsuarioDao.class, dao -> dao.insertUsuario(nombre, apellido, nombreUsuario, contrasena, email, genero, nivelActividad, objetivoSalud, preferenciasAlimenticias, rol));
            sendMessage("Usuario registrado exitosamente, filas afectadas: " + affectedRows, response);
        } catch (Exception e) {
            e.printStackTrace();
            sendError("Se produjo un error al insertar el usuario: ", response);
            sendError("El correo o el nombre de usuario ya existen ", response);
        }
    }
}

