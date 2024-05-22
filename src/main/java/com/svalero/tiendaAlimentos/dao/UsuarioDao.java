package com.svalero.tiendaAlimentos.dao;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import com.svalero.tiendaAlimentos.domain.Usuarios;
import java.util.List;

public interface UsuarioDao {

    @SqlQuery("SELECT  * FROM usuarios")
    @UseRowMapper(UsuarioMapper.class)
    List<Usuarios> getAllUsuarios();

    @SqlQuery("SELECT * FROM usuarios Where id = :id")
    @UseRowMapper(UsuarioMapper.class)
    Usuarios getUsuarioById(long id);

    @SqlQuery("SELECT * FROM usuarios WHERE nombre_usuario = :nombre_usuario AND contrasena = SHA1(:contrasena)")
    @UseRowMapper(UsuarioMapper.class)
    Usuarios getUsuario(String nombre_usuario, String contrasena);


    @SqlUpdate("INSERT INTO usuarios (nombre, apellido, nombre_usuario, contrasena, email, genero, nivel_actividad, objetivo_salud, preferencias_alimenticias, altura, peso, fecha_Nacimiento,rol) VALUES (:nombre, :apellido, :nombre_usuario, SHA1(:contrasena), :email, :genero, :nivel_actividad, :objetivo_salud, :preferencias_alimenticias, :altura, :peso, :fecha_nacimiento, :rol)")
    void insertUsuario(Usuarios usuario);

    @SqlUpdate("INSERT INTO usuarios (nombre, apellido, nombre_usuario, contrasena, email, genero, nivel_actividad, objetivo_Salud, preferencias_alimenticias, altura, peso, fecha_Nacimiento, rol) VALUES (:nombre, :apellido, :nombre_usuario, SHA1(:contrasena), :email, :genero, :nivel_actividad, :objetivo_salud, :preferencias_alimenticias, :altura, :peso, :fecha_nacimiento, rol)")
    void insertUsuarios(List<Usuarios> usuarios);

    @SqlUpdate("UPDATE Usuarios SET nombre = :nombre, apellido = :apellido, nombre_usuario = :nombre_usuario, contrasena = SHA1(:contrasena), email = :email, genero = :genero, nivel_actividad = :nivel_actividad, objetivo_salud = :objetivo_salud, preferencias_alimenticias = :preferencias_alimenticias, altura = :altura, peso = :peso, fecha_nacimiento = :fecha_nacimiento, rol = :rol WHERE id = :id")
    int updateUsuario(Usuarios usuarios);

    @SqlUpdate("DELETE FROM usuarios WHERE id = :id")
    int deleteUsuario(long id);
}