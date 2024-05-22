package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Alimentos;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AlimentosMapper implements RowMapper<Alimentos> {
    @Override
    public Alimentos map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Alimentos(rs.getInt("id"),
            rs.getString("nombre"),
            rs.getString("descripcion"),
            rs.getInt("categoria_id"),
            rs.getInt("contenido_nutricional_id"),
            rs.getString("imagen"),
            rs.getFloat("precio"));
    }
}
