package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.UsuarioDao;
import com.svalero.tiendaAlimentos.domain.Usuarios;
import com.svalero.tiendaAlimentos.util.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendError;

@WebServlet("/edit-user")
public class EditUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try {
            int id = 0;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            }

            if (hasValidationErrors(request, response, id))
                return;

            Usuarios usuario = new Usuarios();
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellido(request.getParameter("apellido"));
            usuario.setNombreUsuario(request.getParameter("nombreUsuario"));
            usuario.setContrasena(request.getParameter("contrasena"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setGenero(request.getParameter("genero"));
            usuario.setNivelActividad(request.getParameter("nivelActividad"));
            usuario.setObjetivoSalud(request.getParameter("objetivoSalud"));
            usuario.setPreferenciasAlimenticias(request.getParameter("preferenciasAlimenticias"));
            usuario.setAltura(Double.parseDouble(request.getParameter("altura")));
            usuario.setPeso(Double.parseDouble(request.getParameter("peso")));
            try {
                usuario.setFechaNacimiento(DateUtils.parse(request.getParameter("fechaNacimiento")));
            } catch (ParseException pe) {
                pe.printStackTrace();
                response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                        "Error parsing the date</div>");
                return; // Salir del método si hay un error de parseo
            }

            String rol = "usuario";
            HttpSession currentSession = request.getSession();
            if (currentSession.getAttribute("rol") != null && currentSession.getAttribute("rol").equals("administrador")) {
                if (!request.getParameter("rol").isBlank()) {
                    rol = request.getParameter("rol");
                }
            }
            usuario.setRol(rol);

            Database.connect();
            if (id == 0) {
                Database.jdbi.withExtension(UsuarioDao.class, dao -> {
                    dao.insertUsuario(usuario);
                    return 0; // returning any value as affected rows not needed for insert
                });
                response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                        "Welcome! You are now a registered user.</div>");
            } else {
                usuario.setId(id);
                int affectedRows = Database.jdbi.withExtension(UsuarioDao.class, dao -> dao.updateUsuario(usuario));
                response.getWriter().println("<div class='alert alert-success' role='alert'>" +
                        "User successfully modified.</div>");
            }

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Internal Server Error</div>");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Error connecting to the database</div>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "An unexpected error occurred</div>");
        }
    }

    private boolean hasValidationErrors(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        boolean hasErrors = false;
        if (request.getParameter("nombre").isBlank()) {
            sendError("Name is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("apellido").isBlank()) {
            sendError("Last name is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("nombreUsuario").isBlank()) {
            sendError("Username is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("contrasena").isBlank()) {
            sendError("Password is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("email").isBlank()) {
            sendError("Email is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("genero").isBlank()) {
            sendError("Gender is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("nivelActividad").isBlank()) {
            sendError("Activity level is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("objetivoSalud").isBlank()) {
            sendError("Health goal is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("preferenciasAlimenticias").isBlank()) {
            sendError("Food preferences are a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("altura").isBlank()) {
            sendError("Height is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("peso").isBlank()) {
            sendError("Weight is a required field", response);
            hasErrors = true;
        }

        if (request.getParameter("fechaNacimiento").isBlank()) {
            sendError("Birth date is a required field", response);
            hasErrors = true;
        }

        return hasErrors;
    }
}

