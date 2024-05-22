package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Vitaminas;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VitaminasMapper implements RowMapper<Vitaminas> {
    @Override
    public Vitaminas map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Vitaminas(rs.getInt("id"),
                rs.getString("nombre"),
                rs.getDouble("cantidad"));
    }
}
