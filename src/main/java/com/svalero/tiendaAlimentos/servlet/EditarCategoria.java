package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.CategoriaDao;
import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.util.Constants;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditarCategoria", value = "/EditarCategoria")
public class EditarCategoria extends HttpServlet {

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

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            int affectedRows = Database.jdbi.withExtension(CategoriaDao.class, dao -> dao.insertCategoria(nombre));
            response.getWriter().println("Category inserted successfully, affected rows: " + affectedRows);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("An error occurred while inserting the category: " + e.getMessage());
        }
    }
}
