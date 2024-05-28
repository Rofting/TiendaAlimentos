package com.svalero.tiendaAlimentos.dao;
import com.svalero.tiendaAlimentos.domain.Usuarios;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioMapper implements RowMapper<Usuarios> {
    @Override
    public Usuarios map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Usuarios(rs.getInt("id"),
                rs.getString("nombre"),
                rs.getString("apellido"),
                rs.getString("nombre_usuario"),
                rs.getString("contrasena"),
                rs.getString("email"),
                rs.getString("genero"),
                rs.getString("nivel_actividad"),
                rs.getString("objetivo_salud"),
                rs.getString("preferencias_alimenticias"),
                rs.getString("rol"));
    }
}
