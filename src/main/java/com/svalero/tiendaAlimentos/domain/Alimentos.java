package com.svalero.tiendaAlimentos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Alimentos {
    private int id;
    private String nombre;
    private String descripcion;
    private int categoria_id;
    private int contenido_nutricional_id;
    private String imagen;
    private float precio;
}