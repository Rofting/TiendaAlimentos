package com.svalero.tiendaAlimentos.dao;

import com.svalero.tiendaAlimentos.domain.RegistrosConsumoAlimentos;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface RegistrosConsumoAlimentosDao {

    @SqlQuery("SELECT * FROM registros_consumo_alimentos")
    @UseRowMapper(RegistrosConsumoAlimentosMapper.class)
    List<RegistrosConsumoAlimentos> getAllRegistrosConsumoAlimentos();

    @SqlQuery("SELECT * FROM registros_consumo_alimentos WHERE id = :id")
    @UseRowMapper(RegistrosConsumoAlimentosMapper.class)
    RegistrosConsumoAlimentos getRegistrosConsumoAlimentosById(long id);

    @SqlUpdate("INSERT INTO registros_consumo_alimentos (usuario_id, alimento_id, cantidad_consumida, fecha_consumo) VALUES (:usuario_id, :alimento_id, :cantidad_consumida, :fecha_consumo)")
    void insertRegistrosConsumoAlimentos(RegistrosConsumoAlimentos registrosConsumoAlimentos);

    @SqlUpdate("UPDATE registros_consumo_alimentos SET usuario_id = :usuario_id, alimento_id = :alimento_id, cantidad_consumida = :cantidad_consumida, fecha_consumo = :fecha_consumo WHERE id = :id")
    int updateRegistrosConsumoAlimentos(RegistrosConsumoAlimentos registros_consumo_alimentos);

    @SqlUpdate("DELETE FROM registros_consumo_alimentos WHERE id = :id")
    int deleteRegistrosConsumoAlimentos(long id);
}
