package com.svalero.tiendaAlimentos.servlet;

import com.svalero.tiendaAlimentos.dao.Database;
import com.svalero.tiendaAlimentos.dao.AlimentoDao;
import com.svalero.tiendaAlimentos.util.Constants;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendError;
import static com.svalero.tiendaAlimentos.util.ErrorUtils.sendMessage;

@MultipartConfig
@WebServlet(name = "EditarAlimento", value = "/EditarAlimento")
public class EditarAlimento extends HttpServlet {

    private static final int MAX_STRING_LENGTH = 255;
    private static final Pattern PRICE_PATTERN = Pattern.compile("\\d+(\\.\\d{1,2})?");

    @Override
    public void init() throws ServletException {
        super.init();
        if (Database.jdbi == null) {
            try {
                Class.forName(Constants.DRIVER);
                Database.jdbi = Jdbi.create(Constants.CONNECTION_STRING, Constants.USERNAME, Constants.PASSWORD);
                Database.jdbi.installPlugin(new SqlObjectPlugin());
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
        String descripcion = request.getParameter("descripcion");
        String categoriaIdParam = request.getParameter("categoria_id");
        String contenidoNutricionalIdParam = request.getParameter("contenido_nutricional_id");
        Part imagenPart = request.getPart("imagen");
        String precioParam = request.getParameter("precio");
        String idParam = request.getParameter("id");

        // Validar campos
        if (nombre == null || nombre.length() > MAX_STRING_LENGTH) {
            sendError("Nombre inválido o demasiado largo.", response);
            return;
        }
        if (descripcion == null || descripcion.length() > MAX_STRING_LENGTH) {
            sendError("Descripción inválida o demasiado larga.", response);
            return;
        }
        if (categoriaIdParam == null || contenidoNutricionalIdParam == null || precioParam == null) {
            sendError("Uno o más parámetros numéricos faltan.", response);
            return;
        }

        try {
            int categoria_id = Integer.parseInt(categoriaIdParam);
            int contenido_nutricional_id = Integer.parseInt(contenidoNutricionalIdParam);
            if (categoria_id <= 0 || contenido_nutricional_id <= 0) {
                sendError("ID de categoría o contenido nutricional debe ser positivo.", response);
                return;
            }

            Matcher matcher = PRICE_PATTERN.matcher(precioParam);
            if (!matcher.matches()) {
                sendError("Formato de precio incorrecto.", response);
                return;
            }
            float precio = Float.parseFloat(precioParam);
            if (precio <= 0) {
                sendError("El precio debe ser positivo.", response);
                return;
            }

            String imagePath = request.getServletContext().getInitParameter("image-path");
            String filename;
            if (imagenPart.getSize() == 0) {
                filename = "no-image.jpg";
            } else {
                filename = UUID.randomUUID() + ".jpg";
                InputStream fileStream = imagenPart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + filename));
            }

            if (Database.jdbi == null) {
                throw new ServletException("Database connection is not initialized.");
            }

            final String finalFilename = filename;
            int affectedRows;
            if (idParam != null && !idParam.isEmpty()) {
                // Modificar el alimento existente
                long id = Long.parseLong(idParam);
                affectedRows = Database.jdbi.withExtension(AlimentoDao.class, dao -> dao.updateAlimento(nombre, descripcion, categoria_id, contenido_nutricional_id, finalFilename, precio, id));
                sendMessage("Alimento modificado correctamente", response);
            } else {
                // Insertar nuevo alimento
                affectedRows = Database.jdbi.withExtension(AlimentoDao.class, dao -> dao.insertAlimento(nombre, descripcion, categoria_id, contenido_nutricional_id, finalFilename, precio));
                sendMessage("Alimento agregado correctamente", response);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            sendError("Formato de número incorrecto en uno de los campos numéricos.", response);
        } catch (IOException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendError("Error de entrada/salida.", response);
        } catch (ServletException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            sendError("Faltan uno o más parámetros.", response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendError("Ha ocurrido un error procesando el alimento.", response);
        }
    }
}

