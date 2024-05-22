package com.svalero.tiendaAlimentos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
@NoArgsConstructor
@Data
@AllArgsConstructor

public class Usuarios {
    private int id;
    private String nombre;
    private String apellido;
    private String nombre_usuario;
    private String contrasena;
    private String email;
    private String genero;
    private String nivel_actividad;
    private String objetivo_salud;
    private String preferencias_alimenticias;
    private double altura;
    private double peso;
    private Date fecha_nacimiento;
    private String rol;
}
