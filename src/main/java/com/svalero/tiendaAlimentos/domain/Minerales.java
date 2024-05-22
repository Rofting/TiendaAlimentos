package com.svalero.tiendaAlimentos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Minerales {
    private int id;
    private String nombre;
    private double cantidad;
}
