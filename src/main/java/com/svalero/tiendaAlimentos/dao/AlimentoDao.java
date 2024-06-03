package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Alimentos;
import org.jdbi.v3.sqlobject.customizer.Bind;
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
    Alimentos getAlimentoById(@Bind("id") long id);

    @SqlQuery("SELECT * FROM Alimentos WHERE nombre = :nombre")
    @UseRowMapper(AlimentosMapper.class)
    Alimentos getAlimentoByNombre(@Bind("nombre") String nombre);

    @SqlQuery("SELECT * FROM Alimentos WHERE categoria_id = :categoria_id")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> getAlimentosByCategoriaId(@Bind("categoria_id") int categoria_id);

    @SqlQuery("SELECT * FROM Alimentos WHERE nombre LIKE '%' || :nombre || '%'")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> findAlimentosByNombre(@Bind("nombre") String nombre);

    @SqlQuery("SELECT * FROM Alimentos WHERE nombre LIKE '%' || :nombre || '%' AND precio = :precio")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> findAlimentosByNombreAndPrecio(@Bind("nombre") String nombre, @Bind("precio") float precio);

    @SqlQuery("SELECT * FROM Alimentos WHERE precio = :precio")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> findAlimentosByPrecio(@Bind("precio") float precio);

    @SqlQuery("SELECT * FROM Alimentos WHERE precio = :precio AND categoria_id = :categoria_id")
    @UseRowMapper(AlimentosMapper.class)
    List<Alimentos> findAlimentosByPrecioAndCategoriaId(@Bind("precio") float precio, @Bind("categoria_id") int categoria_id);

    @SqlUpdate("INSERT INTO Alimentos (nombre, descripcion, categoria_id, contenido_nutricional_id, imagen, precio) VALUES (:nombre, :descripcion, :categoria_id, :contenido_nutricional_id, :imagen, :precio)")
    int insertAlimento(@Bind("nombre") String nombre, @Bind("descripcion") String descripcion, @Bind("categoria_id") int categoriaId, @Bind("contenido_nutricional_id") int contenidoNutricionalId, @Bind("imagen") String imagen, @Bind("precio") float precio);

    @SqlUpdate("UPDATE Alimentos SET nombre = :nombre, descripcion = :descripcion, categoria_id = :categoria_id, contenido_nutricional_id = :contenido_nutricional_id, imagen = :imagen, precio = :precio WHERE id = :id")
    int updateAlimento(@Bind("nombre") String nombre, @Bind("descripcion") String descripcion, @Bind("categoria_id") int categoriaId, @Bind("contenido_nutricional_id") int contenidoNutricionalId, @Bind("imagen") String imagen, @Bind("precio") float precio, @Bind("id") long id);

    @SqlUpdate("DELETE FROM Alimentos WHERE id = :id")
    int deleteAlimento(@Bind("id") long id);
}
