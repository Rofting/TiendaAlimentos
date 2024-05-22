package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.AlimentoDao;
import com.svalero.tiendaAlimentos.dao.Database;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AlimentoServlet", value = "/AlimentoServlet")
public class AlimentoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del producto a eliminar desde la solicitud
        String productIdStr = request.getParameter("id_product");
        int productId = Integer.parseInt(productIdStr);

        try {
            // Conectar a la base de datos
            Database.connect();

            // Eliminar el producto con el ID especificado
            AlimentoDao alimentoDao = Database.jdbi.onDemand(AlimentoDao.class);

            alimentoDao.deleteAlimento(productId);

            // Redirigir a la página de inicio u otra página según necesites
            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            // Manejar cualquier excepción que pueda ocurrir al eliminar el producto
            e.printStackTrace();
            // Enviar una respuesta de error al cliente si es necesario
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Error al eliminar el producto: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí podrías manejar la eliminación de productos si prefieres usar el método doPost
    }
}
