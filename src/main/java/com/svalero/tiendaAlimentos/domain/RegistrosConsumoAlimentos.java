package com.svalero.tiendaAlimentos.domain;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.sql.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegistrosConsumoAlimentos {
    private int id;
    private int usuario_id;
    private int alimento_id;
    private float cantidad_consumida;
    private Date fecha_consumo;

}
