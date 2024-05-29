package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.VitaminaDao;
import com.svalero.tiendaAlimentos.domain.Vitaminas;
import com.svalero.tiendaAlimentos.util.Constants;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditarVitamina", value = "/EditarVitamina")
public class EditarVitamina extends HttpServlet {

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
        double cantidad = Double.parseDouble(request.getParameter("cantidad"));
        long id = Long.parseLong(request.getParameter("id"));

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            int affectedRows;
            if (id == 0) {
                // Insertar nueva vitamina
                affectedRows = Database.jdbi.withExtension(VitaminaDao.class, dao -> dao.insertVitamina(nombre, cantidad));
                response.getWriter().println("Vitamina inserted successfully, affected rows: " + affectedRows);
            } else {
                // Actualizar vitamina existente
                affectedRows = Database.jdbi.withExtension(VitaminaDao.class, dao -> dao.updateVitamina(nombre, cantidad, id));
                response.getWriter().println("Vitamina updated successfully, affected rows: " + affectedRows);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("An error occurred while processing the request: " + e.getMessage());
        }
    }
}
