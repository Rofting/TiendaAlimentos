package com.svalero.tiendaAlimentos.dao;
import org.jdbi.v3.core.statement.StatementContext;
import com.svalero.tiendaAlimentos.domain.Categorias;
import org.jdbi.v3.core.mapper.RowMapper;
import java.sql.SQLException;
import java.sql.ResultSet;

public class CategoriasMapper implements RowMapper<Categorias> {
    @Override
    public Categorias map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Categorias(rs.getInt("id"),
                rs.getString("nombre"));
    }
}
