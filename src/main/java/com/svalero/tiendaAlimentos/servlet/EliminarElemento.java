package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.CategoriaDao;
import com.svalero.tiendaAlimentos.dao.AlimentoDao;
import com.svalero.tiendaAlimentos.dao.VitaminaDao;
import com.svalero.tiendaAlimentos.dao.MineralDao;
import com.svalero.tiendaAlimentos.dao.RegistrosConsumoAlimentosDao;
import com.svalero.tiendaAlimentos.dao.ContenidoNutricionalDao;
import com.svalero.tiendaAlimentos.dao.UsuarioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EliminarElemento")
public class EliminarElemento extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entidad = request.getParameter("entidad");
        int id = Integer.parseInt(request.getParameter("id"));
        String paginaOrigen = "index.jsp";

        try {
            Database.connect();
            int affectedRows = 0;

            switch (entidad.toLowerCase()) {
                case "categoria":
                    affectedRows = Database.jdbi.withExtension(CategoriaDao.class, dao -> dao.deleteCategoria(id));
                    paginaOrigen = "categoria.jsp";
                    break;
                case "alimento":
                    affectedRows = Database.jdbi.withExtension(AlimentoDao.class, dao -> dao.deleteAlimento(id));
                    paginaOrigen = "shop.jsp";
                    break;
                case "usuario":
                    affectedRows = Database.jdbi.withExtension(UsuarioDao.class, dao -> dao.deleteUsuario(id));
                    paginaOrigen = "usuario.jsp";
                    break;
                case "vitamina":
                    affectedRows = Database.jdbi.withExtension(VitaminaDao.class, dao -> dao.deleteVitamina(id));
                    paginaOrigen = "vitamina.jsp";
                    break;
                case "mineral":
                    affectedRows = Database.jdbi.withExtension(MineralDao.class, dao -> dao.deleteMineral(id));
                    paginaOrigen = "mineral.jsp";
                    break;
                case "registro_alimento":
                    affectedRows = Database.jdbi.withExtension(RegistrosConsumoAlimentosDao.class, dao -> dao.deleteRegistrosConsumoAlimentos(id));
                    paginaOrigen = "registro_alimento.jsp";
                    break;
                case "contenido_nutricional":
                    affectedRows = Database.jdbi.withExtension(ContenidoNutricionalDao.class, dao -> dao.deleteContenidoNutricional(id));
                    paginaOrigen = "contenido_nutricional.jsp";
                    break;
                default:
                    throw new ServletException("Entidad desconocida: " + entidad);
            }

            if (affectedRows > 0) {
                // Eliminación exitosa, establecer mensaje de éxito
                request.setAttribute("mensaje", "Elemento eliminado correctamente");
            } else {
                // Si no se afectaron filas, significa que no se eliminó ningún elemento
                request.setAttribute("mensaje", "No se encontró el elemento a eliminar");
            }

            // Redirigir de nuevo al JSP desde donde se realizó la solicitud
            response.sendRedirect(paginaOrigen);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al eliminar la entidad", e);
        }
    }
}
