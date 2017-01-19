/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package td;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import classes.DivisionClass;

/**
 *
 * @author JUAN JOSE
 */
@WebServlet(name = "guardarDivision", urlPatterns = {"/guardarDivision"})
public class guardarDivision extends HttpServlet {

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
        
        
            String dividendo = request.getParameter("dividendoAlum");
            String divisor = request.getParameter("divisorAlum");
            
            String cocienteBien = request.getParameter("cocienteAlumBien");
            String restosBien = request.getParameter("restosAlumBien");
            
            String cocienteAlum = request.getParameter("cocienteAlum");
            String restosAlum = request.getParameter("restosAlum");
            
            if((!dividendo.equals(""))&&(!divisor.equals(""))&&(!cocienteBien.equals(""))&&(!restosBien.equals(""))&&(!cocienteAlum.equals(""))&&(!restosAlum.equals(""))){
                String valor = dividendo + "-" + divisor;
                String solucion = cocienteBien + "-" + restosBien;
                String solucionUsuario = cocienteAlum + "-" + restosAlum;
                String usuario = "userExample";
                
                DivisionClass divisionObject = new DivisionClass(valor, solucion, solucionUsuario, usuario);
                
                request.setAttribute("divisionObject", divisionObject);
                
                request.getRequestDispatcher("CrearEjercicio/InsertDivisionSQL.jsp").forward(request, response);
            }
            
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
