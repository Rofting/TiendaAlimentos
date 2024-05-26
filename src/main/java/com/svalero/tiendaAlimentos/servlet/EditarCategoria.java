package com.svalero.tiendaAlimentos.servlet;
import com.svalero.tiendaAlimentos.dao.CategoriaDao;
import com.svalero.tiendaAlimentos.dao.Database;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(name = "EditarCategoria", value = "/EditarCategoria")
public class EditarCategoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");

            int affectedRows = Database.jdbi.withExtension(CategoriaDao.class, dao -> dao.insertCategoria(nombre));
        }catch (ParseException pe){
            pe.printStackTrace();
        }

    }
}