package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Vitaminas;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface VitaminaDao {

    @SqlQuery("SELECT * FROM vitaminas")
    @UseRowMapper(VitaminasMapper.class)
    List<Vitaminas> getAllVitaminas();

    @SqlQuery("SELECT * FROM vitaminas WHERE id = :id")
    @UseRowMapper(VitaminasMapper.class)
    Vitaminas getVitaminaById(long id);

    @SqlUpdate("INSERT INTO vitaminas (nombre, cantidad) VALUES (:nombre, :cantidad)")
    void insertVitamina(Vitaminas vitaminas);

    @SqlUpdate("UPDATE vitaminas SET nombre = :nombre, cantidad = :cantidad WHERE id = :id")
    int updateVitamina(Vitaminas vitaminas);

    @SqlUpdate("DELETE FROM vitaminas WHERE id = :id")
    int deleteVitamina(long id);
}
