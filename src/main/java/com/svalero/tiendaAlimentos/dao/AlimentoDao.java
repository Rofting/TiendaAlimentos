package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Alimentos;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface AlimentoDao {

    @SqlQuery("SELECT * FROM Alimentos")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> getAllAlimentos();

    @SqlQuery("SELECT * FROM Alimentos WHERE id = :id")
    @UseRowMapper(AlimentosMapper.class)
    Alimentos getAlimentoById(long id);

    @SqlQuery("SELECT * FROM Alimentos WHERE nombre = :nombre")
    @UseRowMapper(AlimentosMapper.class)
    Alimentos getAlimentoByNombre(String nombre);

    @SqlQuery("SELECT * FROM Alimentos WHERE categoria_id = :categoria_id")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> getAlimentosByCategoriaId(int categoria_id);

    @SqlUpdate("INSERT INTO Alimentos (nombre, descripcion, categoria_id, contenido_nutricional_id, imagen, precio) VALUES (:nombre, :descripcion, :categoria_id, :contenido_nutricional_id, :imagen, :precio)")
    void insertAlimento(Alimentos alimento);

    @SqlUpdate("UPDATE Alimentos SET nombre = :nombre, descripcion = :descripcion, categoria_id = :categoria_id, contenido_nutricional_id = :contenido_nutricional_id, imagen = :imagen, precio = :precio WHERE id = :id")
    int updateAlimento(Alimentos alimento);

    @SqlUpdate("DELETE FROM Alimentos WHERE id = :id")
    int deleteAlimento(long id);
}

