package com.svalero.tiendaAlimentos.dao;


import com.svalero.tiendaAlimentos.domain.Minerales;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;
public interface MineralDao {

    @SqlQuery("SELECT * FROM minerales")
    @UseRowMapper(MineralesMapper.class)
    List<Minerales> getAllMinerales();

    @SqlQuery("SELECT * FROM minerales WHERE id = :id")
    @UseRowMapper(MineralesMapper.class)
    Minerales getMineralById(long id);

    @SqlUpdate("INSERT INTO minerales (nombre, cantidad) VALUES (:nombre, :cantidad)")
    void insertMineral(Minerales mineral);

    @SqlUpdate("UPDATE minerales SET nombre = :nombre, cantidad = :cantidad WHERE id = :id")
    int updateMineral(Minerales mineral);

    @SqlUpdate("DELETE FROM minerales WHERE id = :id")
    int deleteMineral(long id);
}
