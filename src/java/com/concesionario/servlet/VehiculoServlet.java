/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.servlet;

import com.concesionario.ejb.ClienteFacadeLocal;
import com.concesionario.ejb.VehiculoFacadeLocal;
import com.concesionario.entity.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ?
 */
public class VehiculoServlet extends HttpServlet {

    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String url = "index.jsp";
            Vehiculo v; 
            
            if(action != null) switch(action){ 
                    
                case "buscarPorMatricula" :
                    try {
                        String param = request.getParameter("matricula");
                        v = vehiculoFacade.find(Integer.parseInt(param));

                        if (v == null){
                          url = "vehiculo.jsp?filtered=3";
                        } else {
                            List<Vehiculo> lista = new ArrayList<>();
                            lista.add(v);

                            request.getSession().setAttribute("vehiculo", lista);
                            url = "vehiculo.jsp?filtered=1";
                        }
                    } catch (Exception e){
                        url = "vehiculo.jsp?filtered=2";
                    }
                    break;
                case "list":
                    List<Vehiculo> findAll = vehiculoFacade.findAll();
                    request.getSession().setAttribute("vehiculos", findAll);
                    url = "listaVehiculos.jsp";
                    break;
                case "vender" :
                    try {
                        String param = request.getParameter("matricula");
                        //c = clienteFacade
                        
                    } catch (Exception e) {
                    }
                    break;
                case "eliminar" :
                    try {
                        String id = request.getParameter("id");
                        v = vehiculoFacade.find(Integer.parseInt(id));
                        vehiculoFacade.remove(v);
                        
                    } catch (Exception e) {
                    }
            }
              
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
