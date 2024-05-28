package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.UsuarioDao;
import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.util.Constants;
import com.svalero.tiendaAlimentos.util.DateUtils;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;

@WebServlet(name = "EditarUsuario", value = "/EditarUsuario")
public class EditarUsuario extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        if (Database.jdbi == null) {
            try {
                Class.forName(Constants.DRIVER);
                Database.jdbi = Jdbi.create(Constants.CONNECTION_STRING, Constants.USERNAME, Constants.PASSWORD);
                Database.jdbi.installPlugin(new SqlObjectPlugin()); // Registrar el plugin
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
        String nombre_usuario = request.getParameter("nombre_usuario");
        String contrasena = request.getParameter("contrasena");
        String email = request.getParameter("email");
        String genero = request.getParameter("genero");
        String nivel_actividad = request.getParameter("nivel_actividad");
        String objetivo_salud = request.getParameter("objetivo_salud");
        String preferencias_alimenticias = request.getParameter("preferencias_alimenticias");
        String rol = request.getParameter("rol");

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            int affectedRows = Database.jdbi.withExtension(UsuarioDao.class, dao -> dao.insertUsuario(
                    nombre, apellido, nombre_usuario, contrasena, email, genero, nivel_actividad,
                    objetivo_salud, preferencias_alimenticias, rol));
            response.getWriter().println("Usuario insertado con éxito, filas afectadas: " + affectedRows);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Ocurrió un error al insertar el usuario: " + e.getMessage());
        }
    }
}
