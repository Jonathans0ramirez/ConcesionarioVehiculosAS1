/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.ejb;

import com.concesionario.entity.Vehiculo;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ?
 */
@Stateless
public class VehiculoFacade extends AbstractFacade<Vehiculo> implements VehiculoFacadeLocal {

    @PersistenceContext(unitName = "ConcesionarioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VehiculoFacade() {
        super(Vehiculo.class);
    }

    @Override
    public List<Vehiculo> findAllAvailable() {
        Query query = em.createNativeQuery("SELECT v.* FROM Vehiculo v LEFT JOIN Venta b ON v.Placa = b.Placa "
                + "WHERE b.Placa IS NULL GROUP BY v.Placa ORDER BY v.Linea, v.Modelo DESC", Vehiculo.class);
        return query.getResultList();
    }
    
    @Override
    public Vehiculo findAvailable(String placa) {
        Query query = em.createNativeQuery("SELECT v.* FROM Vehiculo v LEFT JOIN Venta b ON v.Placa = b.Placa "
                + "WHERE v.placa=:placa AND b.Placa IS NULL GROUP BY v.Placa ORDER BY v.Linea, v.Modelo DESC", Vehiculo.class);
        query.setParameter(placa, "placa");
        Vehiculo vehiculo = (Vehiculo) query.getSingleResult();
        
        return vehiculo;
    }
}
