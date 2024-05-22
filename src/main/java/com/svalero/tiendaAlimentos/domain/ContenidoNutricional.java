package com.svalero.tiendaAlimentos.domain;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContenidoNutricional {
    private int id;
    private double calorias;
    private double proteinas;
    private double carbohidratos;
    private double grasas;
}
