package com.svalero.tiendaAlimentos.domain;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContenidoNutricional {
    private int id;
    private float calorias;
    private float proteinas;
    private float carbohidratos;
    private float grasas;
}
