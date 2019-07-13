/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.servlet;

import com.concesionario.ejb.VehiculoFacadeLocal;
import com.concesionario.entity.Vehiculo;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ?
 */
public class VehiculoServlet extends HttpServlet {

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
            Vehiculo vehiculo;

            if (action != null) {
                switch (action) {

                    case "buscarPorMatricula":
                        try {
                            String param = request.getParameter("matricula");
                            vehiculo = vehiculoFacade.find(Integer.parseInt(param));

                            if (vehiculo == null) {
                                url = "listarVehiculos.jsp?filtered=3";
                            } else {
                                List<Vehiculo> lista = new ArrayList<>();
                                lista.add(vehiculo);

                                request.getSession().setAttribute("vehiculo", lista);
                                url = "listaVehiculos.jsp?filtered=1";
                            }
                        } catch (Exception e) {
                            url = "listaVehiculos.jsp?filtered=2";
                        }
                        break;
                    case "listar":
                        List<Vehiculo> findAll = vehiculoFacade.findAll();
                        request.getSession().setAttribute("vehiculos", findAll);
                        url = "listaVehiculos.jsp";
                        break;
                    case "registrar":
                        try {                            
                            vehiculo = new Vehiculo();
                            vehiculo.setPlaca(request.getParameter("placa"));
                            vehiculo.setLinea(request.getParameter("linea"));
                            vehiculo.setModelo(request.getParameter("modelo"));                            
                            vehiculo.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    /*TROZO INSERTAR FOTO*/        
                            Part part = request.getPart("foto");                            
                            System.out.println("oli");                
                            if (part != null && part.getSize() != 0) {
                                byte[] buffer;
                                try (InputStream is = part.getInputStream()) {
                                    buffer = new byte[is.available()];
                                    is.read(buffer);
                                }
                                vehiculo.setFoto(buffer);
                            } else {
                                vehiculo.setFoto(null);
                            }                                                                
                            vehiculoFacade.create(vehiculo);
                            url = "index.jsp?exitoRegistrar=3";
                        } catch (Exception e) {
                            url = "index.jsp=errorRegistrar=3";
                        }
                        break;
                    case "toVenta":
                        String placa = request.getParameter("placa");
                        String linea = request.getParameter("linea");
                        String modelo = request.getParameter("modelo");
                        request.getSession().setAttribute("placaLbl", placa);
                        request.getSession().setAttribute("lineaLbl", linea);
                        request.getSession().setAttribute("modeloLbl", modelo);

                        url = "registrarVenta.jsp";
                        break;
                    case "toRegistrar":
                        url = "registrarVehiculo.jsp";
                        break;

                    case "eliminar":
                        try {                            
                            vehiculo = vehiculoFacade.find(request.getParameter("placa"));
                            vehiculoFacade.remove(vehiculo);
                            url = "index.jsp?exitoEliminar=3";

                        } catch (Exception e) {
                            url = "index.jsp?errorEliminar=3";
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
