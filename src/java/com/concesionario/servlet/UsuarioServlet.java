/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.concesionario.servlet;

import com.concesionario.ejb.UsuarioFacadeLocal;
import com.concesionario.entity.Usuario;
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
 * @author ?
 */
public class UsuarioServlet extends HttpServlet {

    @EJB
    private UsuarioFacadeLocal usuarioFacade;

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
            Usuario usuario;

            if (action != null) {
                switch (action) {
                    case "login":
                        try {
                            String u = request.getParameter("usuario");
                            String p = request.getParameter("contrasena");
                            boolean checkLogin = usuarioFacade.checkLogin(u, p);

                            if (checkLogin) {
                                request.getSession().setAttribute("login", u);
                                url = "index.jsp?exito=1";
                            } else {
                                url = "index.jsp?error=1";
                            }
                        } catch (Exception e) {
                        }
                        break;
                    case "registrar":
                        try {
                            String contraseña = request.getParameter("password");
                            if (contraseña.equals(request.getParameter("conPassword"))) {
                                usuario = new Usuario();
                                usuario.setId(null);
                                usuario.setNombre(request.getParameter("name"));
                                usuario.setUsuario(request.getParameter("user"));
                                usuario.setContrasena(contraseña);
                                usuarioFacade.create(usuario);
                                url = "index.jsp?exito=1";
                            } else {
                                url = "index.jsp=error=1";
                            }
                        } catch (Exception e) {
                            url = "index.jsp=error=1";
                        }
                        break;
                    case "listar":
                        List<Usuario> findAll = usuarioFacade.findAll();
                        request.getSession().setAttribute("admin", findAll);
                        url = "listaAdmins.jsp";
                        break;
                    case "toRegistrar":
                        try {
                            url = "registrarAdmin.jsp";
                        } catch (Exception e) {
                            url = "index.jsp=error=2";
                        }
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
