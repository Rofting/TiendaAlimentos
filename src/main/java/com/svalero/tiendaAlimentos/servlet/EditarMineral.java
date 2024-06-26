package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.MineralDao;
import com.svalero.tiendaAlimentos.util.Constants;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendError;
import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendMessage;

@WebServlet(name = "EditarMineral", value = "/EditarMineral")
public class EditarMineral extends HttpServlet {

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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String cantidadParam = request.getParameter("cantidad");
        String idParam = request.getParameter("id");

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            double cantidad = Double.parseDouble(cantidadParam);
            int affectedRows;

            if (idParam != null && !idParam.isEmpty()) {
                // Modificar el mineral existente
                long id = Long.parseLong(idParam);
                affectedRows = Database.jdbi.withExtension(MineralDao.class, dao -> dao.updateMineral(nombre, cantidad, id));
                sendMessage("Mineral agregado con exito " ,response);
            } else {
                // Insertar nuevo mineral
                affectedRows = Database.jdbi.withExtension(MineralDao.class, dao -> dao.insertMineral(nombre, cantidad));
                sendMessage("Mineral insertado con exito " ,response);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            sendError("ID invalido" ,response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendError("An error occurred while processing the mineral: " ,response);
        }
    }
}
