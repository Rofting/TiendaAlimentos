package com.svalero.tiendaAlimentos.domain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Vitaminas {
    private int id;
    private String nombre;
    private double cantidad;
}
