package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.UsuarioDao;
import com.svalero.tiendaAlimentos.domain.Usuarios;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");
        try {
            Database.connect();
            Usuarios usuario = Database.jdbi.withExtension(UsuarioDao.class,
                    dao -> dao.getUsuario(nombreUsuario, contrasena));
            //Si llego aqui suponemos que es el usuario correcto, entonces...creo la sesion,
            //pero antes tengo que pregunatar si el usuario existe
            if (usuario != null) {
                HttpSession session = request.getSession();
                //la sesion se puede recuperar desde cualquier sitio,
                // y le añadimos atributos: username, role, id_user
                session.setAttribute("nombreUsuario", usuario.getNombreUsuario());
                session.setAttribute("rol", usuario.getRol());
                session.setAttribute("id", usuario.getId());
                //es decir guardo informacion en la sesion y esta la puedo recuperar en cualquier parte de la web
                //simplemete llamando a HttpSession
                response.getWriter().print("ok");

            } else {
                response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                        "Username does not exist</div>");
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Internal Server Error</div>");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" +
                    "Error conecting to the data base</div>");
        }

    }
}

