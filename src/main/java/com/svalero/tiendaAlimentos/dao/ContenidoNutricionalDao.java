package com.svalero.tiendaAlimentos.dao;

import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;
import com.svalero.tiendaAlimentos.domain.ContenidoNutricional;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;


public interface ContenidoNutricionalDao {

    @SqlQuery("SELECT * FROM contenido_nutricional")
    @UseRowMapper(ContenidoNutricionalMapper.class)
    List<ContenidoNutricional> getAllContenidosNutricionales();

    @SqlQuery("SELECT * FROM contenido_nutricional WHERE id = :id")
    @UseRowMapper(ContenidoNutricionalMapper.class)
    ContenidoNutricional getContenidoNutricionalById(long id);

    @SqlUpdate("INSERT INTO contenido_nutricional (calorias, proteinas, carbohidratos, grasas) VALUES (:calorias, :proteinas, :carbohidratos, :grasas)")
    int insertContenidoNutricional(@Bind("calorias") float calorias,@Bind("proteinas") float proteinas,@Bind("carbohidratos") float carbohidratos,@Bind("grasas") float grasas);

    @SqlUpdate("UPDATE Contenido_Nutricional SET calorias = :calorias, proteinas = :proteinas, carbohidratos = :carbohidratos, grasas = :grasas WHERE id = :id")
    int updateContenidoNutricional(@Bind("calorias") float calorias,@Bind("proteinas") float proteinas,@Bind("carbohidratos") float carbohidratos,@Bind("grasas") float grasas,@Bind("id") long id);

    @SqlUpdate("DELETE FROM Contenido_Nutricional WHERE id = :id")
    int deleteContenidoNutricional(long id);
}
