package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.ContenidoNutricionalDao;
import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.util.Constants;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendError;
import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendMessage;

@WebServlet(name = "EditarContenidoNutricional", value = "/EditarContenidoNutricional")
public class EditarContenidoNutricional extends HttpServlet {

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
        float calorias = Float.parseFloat(request.getParameter("calorias"));
        float proteinas = Float.parseFloat(request.getParameter("proteinas"));
        float carbohidratos = Float.parseFloat(request.getParameter("carbohidratos"));
        float grasas = Float.parseFloat(request.getParameter("grasas"));

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            int affectedRows = Database.jdbi.withExtension(ContenidoNutricionalDao.class, dao -> dao.insertContenidoNutricional(calorias, proteinas,carbohidratos,grasas));
            sendMessage("Contenido nutricional insertado correctamente", response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendError("Hubo un error en agregar el contenido", response);
        }
    }
}