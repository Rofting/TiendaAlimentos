package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Vitaminas;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface VitaminaDao {

    @SqlQuery("SELECT * FROM Vitaminas")
    @UseRowMapper(VitaminasMapper.class)
    List<Vitaminas> getAllVitaminas();

    @SqlQuery("SELECT * FROM Vitaminas WHERE id = :id")
    @UseRowMapper(VitaminasMapper.class)
    Vitaminas getVitaminaById(@Bind("id") long id);

    @SqlUpdate("INSERT INTO vitaminas (nombre, cantidad) VALUES (:nombre, :cantidad)")
    int insertVitamina(@Bind("nombre") String nombre, @Bind("cantidad") double cantidad);

    @SqlUpdate("UPDATE vitaminas SET nombre = :nombre, cantidad = :cantidad WHERE id = :id")
    int updateVitamina(@Bind("nombre") String nombre, @Bind("cantidad") double cantidad, @Bind("id") long id);

    @SqlUpdate("DELETE FROM Vitaminas WHERE id = :id")
    int deleteVitamina(@Bind("id") long id);

    @SqlQuery("SELECT * FROM Vitaminas WHERE nombre LIKE '%' || :nombre || '%'")
    @UseRowMapper(VitaminasMapper.class)
    List<Vitaminas> findVitaminasByNombre(@Bind("nombre") String nombre);

    @SqlQuery("SELECT * FROM Vitaminas WHERE cantidad = :cantidad")
    @UseRowMapper(VitaminasMapper.class)
    List<Vitaminas> findVitaminasByCantidad(@Bind("cantidad") double cantidad);

    @SqlQuery("SELECT * FROM Vitaminas WHERE nombre LIKE '%' || :nombre || '%' AND cantidad = :cantidad")
    @UseRowMapper(VitaminasMapper.class)
    List<Vitaminas> findVitaminasByNombreAndCantidad(@Bind("nombre") String nombre, @Bind("cantidad") double cantidad);
}

