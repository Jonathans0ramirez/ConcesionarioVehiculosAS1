/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.ejb;

import com.concesionario.entity.Vehiculo;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author ?
 */
@Local
public interface VehiculoFacadeLocal {

    void create(Vehiculo vehiculo);

    void edit(Vehiculo vehiculo);

    void remove(Vehiculo vehiculo);

    Vehiculo find(Object id);

    List<Vehiculo> findAll();
    
    Vehiculo findAvailable(String placa);
    
    List<Vehiculo> findAllAvailable();

    List<Vehiculo> findRange(int[] range);

    int count();
    
}
