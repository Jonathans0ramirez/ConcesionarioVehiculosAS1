/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.servlet;

import com.concesionario.ejb.ClienteFacadeLocal;
import com.concesionario.entity.Cliente;
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
public class ClienteServlet extends HttpServlet {

    @EJB
    private ClienteFacadeLocal clienteFacade;

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
            String url = "principal.jsp";
            Cliente cliente;
            
            if (action != null) {
                switch (action) {
                    case "registrar":
                        try {                            
                            cliente = new Cliente();
                            cliente.setCedula(request.getParameter("cedula"));
                            cliente.setNombre(request.getParameter("nombre"));
                            cliente.setTelefono(request.getParameter("telefono"));
                            cliente.setCorreo(request.getParameter("correo"));
                            cliente.setDireccion(request.getParameter("direccion"));
                            clienteFacade.create(cliente);
                            url = "principal.jsp?exitoRegistrar=2";
                        } catch (Exception e) {
                            url = "principal.jsp=errorRegistrar=2";
                        }
                        break;
                    case "toRegistrar":
                        url = "registrarCliente.jsp";
                        break;
                    case "listar":
                        List<Cliente> findAll = clienteFacade.findAll();
                        request.getSession().setAttribute("clientes", findAll);
                        url = "listaClientes.jsp";
                        break;
                    case "eliminar":
                        try {
                            cliente = clienteFacade.find(request.getParameter("cedula"));
                            clienteFacade.remove(cliente);
                            url = "principal.jsp?exitoEliminar=2";

                        } catch (Exception e) {
                            url = "principal.jsp?errorEliminar=2";
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
