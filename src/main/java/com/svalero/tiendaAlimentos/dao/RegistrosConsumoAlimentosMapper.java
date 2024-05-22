package com.svalero.tiendaAlimentos.dao;
import org.jdbi.v3.core.statement.StatementContext;
import com.svalero.tiendaAlimentos.domain.RegistrosConsumoAlimentos;
import org.jdbi.v3.core.mapper.RowMapper;
import java.sql.SQLException;
import java.sql.ResultSet;

public class RegistrosConsumoAlimentosMapper implements RowMapper<RegistrosConsumoAlimentos> {
    @Override
    public RegistrosConsumoAlimentos map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new RegistrosConsumoAlimentos(rs.getInt("id"),
        rs.getInt("usuario_id"),
        rs.getInt("alimento_id"),
        rs.getDouble("cantidad_consumida"),
        rs.getDate("fecha_consumo"));
    }
}