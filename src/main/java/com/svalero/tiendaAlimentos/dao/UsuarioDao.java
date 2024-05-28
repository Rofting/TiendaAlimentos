package com.svalero.tiendaAlimentos.dao;

import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import com.svalero.tiendaAlimentos.domain.Usuarios;

import java.util.Date;
import java.util.List;

public interface UsuarioDao {

    @SqlQuery("SELECT * FROM usuarios")
    @UseRowMapper(UsuarioMapper.class)
    List<Usuarios> getAllUsuarios();

    @SqlQuery("SELECT * FROM usuarios WHERE id = :id")
    @UseRowMapper(UsuarioMapper.class)
    Usuarios getUsuarioById(@Bind("id") long id);

    @SqlQuery("SELECT * FROM usuarios WHERE nombre_usuario = :nombre_usuario AND contrasena = :contrasena")
    @UseRowMapper(UsuarioMapper.class)
    Usuarios getUsuario(@Bind("nombre_usuario") String nombre_usuario, @Bind("contrasena") String contrasena);

    @SqlUpdate("INSERT INTO usuarios (nombre, apellido, nombre_usuario, contrasena, email, genero, nivel_actividad, objetivo_salud, preferencias_alimenticias, rol) VALUES (:nombre, :apellido, :nombre_usuario,:contrasena, :email, :genero, :nivel_actividad, :objetivo_salud, :preferencias_alimenticias, :rol)")
    int insertUsuario(@Bind("nombre") String nombre, @Bind("apellido") String apellido, @Bind("nombre_usuario") String nombre_usuario, @Bind("contrasena") String contrasena, @Bind("email") String email, @Bind("genero") String genero, @Bind("nivel_actividad") String nivel_actividad, @Bind("objetivo_salud") String objetivo_salud, @Bind("preferencias_alimenticias") String preferencias_alimenticias, @Bind("rol") String rol);

    @SqlUpdate("UPDATE usuarios SET nombre = :nombre, apellido = :apellido, nombre_usuario = :nombre_usuario, contrasena = :contrasena, email = :email, genero = :genero, nivel_actividad = :nivel_actividad, objetivo_salud = :objetivo_salud, preferencias_alimenticias = :preferencias_alimenticias, rol = :rol WHERE id = :id")
    int updateUsuario(@Bind("id") int id, @Bind("nombre") String nombre, @Bind("apellido") String apellido, @Bind("nombre_usuario") String nombre_usuario, @Bind("contrasena") String contrasena, @Bind("email") String email, @Bind("genero") String genero, @Bind("nivel_actividad") String nivel_actividad, @Bind("objetivo_salud") String objetivo_salud, @Bind("preferencias_alimenticias") String preferencias_alimenticias, @Bind("rol") String rol);

    @SqlUpdate("DELETE FROM usuarios WHERE id = :id")
    int deleteUsuario(@Bind("id") long id);
}
