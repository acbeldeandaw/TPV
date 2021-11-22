/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Crud;
import Modelo.Crud;
import Modelo.Productos;
import Modelo.Productos;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DAW-A
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        
        if (action.compareToIgnoreCase("mostrar") == 0) {
            List<Productos> listaProductos = Crud.getProductos();
            request.setAttribute("lista", listaProductos);
            RequestDispatcher rd = request.getRequestDispatcher("mostrar.jsp");
            rd.forward(request, response);
            
        } else if (action.compareToIgnoreCase("borrar") == 0) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (Crud.destroyProducto(id) > 0) {
                request.setAttribute("msg", "alertify.success('Producto " + id + " borrado correctamente');");
            } else {
                request.setAttribute("msg", "alertify.error('No se ha podido borrar el producto " + id + "');");
            }
            List<Productos> listaProductos = Crud.getProductos();
            request.setAttribute("lista", listaProductos);
            RequestDispatcher rd = request.getRequestDispatcher("mostrar.jsp");
            rd.forward(request, response);
            
        } else if (action.compareToIgnoreCase("actualizar") == 0) {
            int id = Integer.parseInt(request.getParameter("id"));
            Productos prod = Crud.getProducto(id);
            request.setAttribute("prod", prod);
            RequestDispatcher rd = request.getRequestDispatcher("actualizar.jsp");
            rd.forward(request, response);
            
        } else if (action.compareToIgnoreCase("actualizarDatos") == 0) {
            int id = Integer.parseInt(request.getParameter("id"));
            Productos prod = Crud.getProducto(id);
            request.setAttribute("prod", prod);
            RequestDispatcher rd = request.getRequestDispatcher("actualizar.jsp");
            rd.forward(request, response);
            
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.forward(request, response);
        }
        
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
