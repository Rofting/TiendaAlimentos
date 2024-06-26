package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.Minerales;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface MineralDao {

    @SqlQuery("SELECT * FROM Minerales")
    @UseRowMapper(MineralesMapper.class)
    List<Minerales> getAllMinerales();

    @SqlQuery("SELECT * FROM Minerales WHERE id = :id")
    @UseRowMapper(MineralesMapper.class)
    Minerales getMineralById(@Bind("id") long id);

    @SqlUpdate("INSERT INTO Minerales (nombre, cantidad) VALUES (:nombre, :cantidad)")
    int insertMineral(@Bind("nombre") String nombre, @Bind("cantidad") double cantidad);

    @SqlUpdate("UPDATE Minerales SET nombre = :nombre, cantidad = :cantidad WHERE id = :id")
    int updateMineral(@Bind("nombre") String nombre, @Bind("cantidad") double cantidad, @Bind("id") long id);

    @SqlUpdate("DELETE FROM Minerales WHERE id = :id")
    int deleteMineral(@Bind("id") long id);

    @SqlQuery("SELECT * FROM Minerales WHERE LOWER(nombre) LIKE '%' || LOWER(:nombre) || '%' AND cantidad = :cantidad")
    @UseRowMapper(MineralesMapper.class)
    List<Minerales> findByNombreYCantidad(@Bind("nombre") String nombre, @Bind("cantidad") double cantidad);

    @SqlQuery("SELECT * FROM Minerales WHERE LOWER(nombre) LIKE '%' || LOWER(:nombre) || '%'")
    @UseRowMapper(MineralesMapper.class)
    List<Minerales> findByNombre(@Bind("nombre") String nombre);

    @SqlQuery("SELECT * FROM Minerales WHERE cantidad = :cantidad")
    @UseRowMapper(MineralesMapper.class)
    List<Minerales> findByCantidad(@Bind("cantidad") double cantidad);


}
