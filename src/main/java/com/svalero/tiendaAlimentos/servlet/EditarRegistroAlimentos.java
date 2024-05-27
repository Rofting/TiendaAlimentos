package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.RegistrosConsumoAlimentosDao;
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

@WebServlet(name = "EditarRegistroAlimentos", value = "/EditarRegistroAlimentos")
public class EditarRegistroAlimentos extends HttpServlet {

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
        int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
        int alimento_id = Integer.parseInt(request.getParameter("alimento_id"));
        float cantidad_consumida = Float.parseFloat(request.getParameter("cantidad_consumida"));
        Date fecha_consumo;

        try {
            fecha_consumo = DateUtils.parse(request.getParameter("fecha_consumo"));
        } catch (ParseException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Formato de fecha no válido: " + e.getMessage());
            return;
        }

        if (Database.jdbi == null) {
            throw new ServletException("Database connection is not initialized.");
        }

        try {
            int affectedRows = Database.jdbi.withExtension(RegistrosConsumoAlimentosDao.class, dao -> dao.insertRegistrosConsumoAlimentos(usuario_id, alimento_id, cantidad_consumida, fecha_consumo));
            response.getWriter().println("Registro de consumo de alimentos insertado con éxito, filas afectadas: " + affectedRows);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Ocurrió un error al insertar el registro de consumo de alimentos: " + e.getMessage());
        }

    }
}
