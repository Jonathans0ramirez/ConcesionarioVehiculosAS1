package com.concesionario.entity;

import com.concesionario.entity.Venta;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-13T12:49:52")
@StaticMetamodel(Vehiculo.class)
public class Vehiculo_ { 

    public static volatile SingularAttribute<Vehiculo, Integer> precio;
    public static volatile SingularAttribute<Vehiculo, byte[]> foto;
    public static volatile ListAttribute<Vehiculo, Venta> ventaList;
    public static volatile SingularAttribute<Vehiculo, String> modelo;
    public static volatile SingularAttribute<Vehiculo, String> linea;
    public static volatile SingularAttribute<Vehiculo, String> placa;

}