package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Categorias;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CategoriaDao {

    @SqlQuery("SELECT * FROM Categorias")
    @UseRowMapper(CategoriasMapper.class)
    List<Categorias> getAllCategorias();

    @SqlQuery("SELECT * FROM Categorias WHERE id = :id")
    @UseRowMapper(CategoriasMapper.class)
    Categorias getCategoriaById(@Bind("id") long id);

    @SqlUpdate("INSERT INTO Categorias (nombre) VALUES (:nombre)")
    int insertCategoria(@Bind("nombre") String nombre);

    @SqlUpdate("UPDATE Categorias SET nombre = :nombre WHERE id = :id")
    int updateCategoria(@Bind("nombre") String nombre, @Bind("id") long id);

    @SqlUpdate("DELETE FROM Categorias WHERE id = :id")
    int deleteCategoria(@Bind("id") long id);
}
