/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.servlet;

import com.concesionario.ejb.ClienteFacadeLocal;
import com.concesionario.ejb.VehiculoFacadeLocal;
import com.concesionario.ejb.VentaFacadeLocal;
import com.concesionario.entity.Cliente;
import com.concesionario.entity.Vehiculo;
import com.concesionario.entity.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jonathans.ramirez
 */
public class VentaServlet extends HttpServlet {

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private VentaFacadeLocal ventaFacade;

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
            String placa = request.getParameter("placa");

            String url = "principal.jsp";
            Venta venta;

            if (action != null) {
                switch (action) {
                    case "registrar":
                        try {
                            String cedula = request.getParameter("cedula");
                            Cliente cliente = clienteFacade.find(cedula);
                            Vehiculo vehiculo = vehiculoFacade.find(placa);
                            
                            boolean checkCedula = clienteFacade.checkCliente(cedula);
                            
                            if(checkCedula){
                                venta = new Venta();
                                venta.setId(null);
                                venta.setCedula(cliente);
                                venta.setPlaca(vehiculo);
                                ventaFacade.create(venta);
                                url = "principal.jsp";
                            } else {
                                url = "registrarCliente.jsp";
                            }
                        } catch (Exception e) {

                        }
                        break;
                    case "toRegistrar":
                        url = "registrarVenta.jsp";
                        break;
                    case "listar":
                        List<Venta> findAll = ventaFacade.findAll();
                        request.getSession().setAttribute("ventas", findAll);
                        url = "listaVentas.jsp";
                        break;
                    case "eliminar":
                        try {
                            String id = request.getParameter("id");
                            venta = ventaFacade.find(Integer.parseInt(id));
                            ventaFacade.remove(venta);
                            url = "principal.jsp?exitoEliminar=4";
                        } catch (Exception e){
                            url = "principal.jsp?errorEliminar=4";
                        }
                        break;
                    default:
                        break;
                }
            }
            response.sendRedirect(url);
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
