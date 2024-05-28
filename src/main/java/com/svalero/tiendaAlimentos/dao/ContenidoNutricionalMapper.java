package com.svalero.tiendaAlimentos.dao;
import com.svalero.tiendaAlimentos.domain.ContenidoNutricional;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContenidoNutricionalMapper implements RowMapper<ContenidoNutricional> {
    @Override
    public ContenidoNutricional map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new ContenidoNutricional(rs.getInt("id"),
                rs.getFloat("calorias"),
                rs.getFloat("proteinas"),
                rs.getFloat("carbohidratos"),
                rs.getFloat("grasas"));
    }
}
