package com.svalero.tiendaAlimentos.dao;

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
    Usuarios getUsuarioById(long id);

    @SqlQuery("SELECT * FROM usuarios WHERE nombre_usuario = :nombre_usuario AND contrasena = SHA1(:contrasena)")
    @UseRowMapper(UsuarioMapper.class)
    Usuarios getUsuario(String nombre_usuario, String contrasena);

    @SqlUpdate("INSERT INTO usuarios (nombre, apellido, nombre_usuario, contrasena, email, genero, nivel_actividad, objetivo_salud, preferencias_alimenticias, altura, peso, fecha_nacimiento, rol) VALUES (:nombre, :apellido, :nombre_usuario, SHA1(:contrasena), :email, :genero, :nivel_actividad, :objetivo_salud, :preferencias_alimenticias, :altura, :peso, :fecha_nacimiento, :rol)")
    int insertUsuario(String nombre, String apellido, String nombre_usuario, String contrasena, String email, String genero, String nivel_actividad, String objetivo_salud, String preferencias_alimenticias, double altura, double peso, Date fecha_nacimiento, String rol);

    @SqlUpdate("INSERT INTO usuarios (nombre, apellido, nombre_usuario, contrasena, email, genero, nivel_actividad, objetivo_salud, preferencias_alimenticias, altura, peso, fecha_nacimiento, rol) VALUES (:nombre, :apellido, :nombre_usuario, SHA1(:contrasena), :email, :genero, :nivel_actividad, :objetivo_salud, :preferencias_alimenticias, :altura, :peso, :fecha_nacimiento, :rol)")
    int insertUsuarios(String nombre, String apellido, String nombre_usuario, String contrasena, String email, String genero, String nivel_actividad, String objetivo_salud, String preferencias_alimenticias, double altura, double peso, Date fecha_nacimiento, String rol);

    @SqlUpdate("UPDATE usuarios SET nombre = :nombre, apellido = :apellido, nombre_usuario = :nombre_usuario, contrasena = SHA1(:contrasena), email = :email, genero = :genero, nivel_actividad = :nivel_actividad, objetivo_salud = :objetivo_salud, preferencias_alimenticias = :preferencias_alimenticias, altura = :altura, peso = :peso, fecha_nacimiento = :fecha_nacimiento, rol = :rol WHERE id = :id")
    int updateUsuario(int id, String nombre, String apellido, String nombre_usuario, String contrasena, String email, String genero, String nivel_actividad, String objetivo_salud, String preferencias_alimenticias, double altura, double peso, Date fecha_nacimiento, String rol);

    @SqlUpdate("DELETE FROM usuarios WHERE id = :id")
    int deleteUsuario(long id);
}
