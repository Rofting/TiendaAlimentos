package com.svalero.tiendaAlimentos.servlet;
import com.svalero.tiendaAlimentos.util.Constants;
import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.UsuarioDao;
import com.svalero.tiendaAlimentos.domain.Usuarios;
import com.svalero.tiendaAlimentos.util.ErrorUtils;
import com.svalero.tiendaAlimentos.util.CurrencyUtils;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendError;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String nombre_usuario = request.getParameter("nombre_usuario");
        String contrasena = request.getParameter("contrasena");

        try {
            Database.connect();
            Usuarios usuario = Database.jdbi.withExtension(UsuarioDao.class,
                    dao -> dao.getUsuario(nombre_usuario, contrasena));
            if (usuario != null) {
                HttpSession session = request.getSession();
                session.setAttribute("id", usuario.getId());
                session.setAttribute("nombre_usuario", usuario.getNombre_usuario());
                session.setAttribute("rol", usuario.getRol());
                response.getWriter().print("ok");
            } else {
                sendError("El usuario no existe", response);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("Internal Server Error", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("Error conectando con la base de datos", response);
        }
    }
}


