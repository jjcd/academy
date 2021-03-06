/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tdProfesor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JUAN JOSE
 */
@WebServlet(name = "generarRevisionDivisionDN", urlPatterns = {"/generarRevisionDivisionDN"})
public class generarRevisionDivisionDN extends HttpServlet {

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
            
            String valor = request.getParameter("valor");
            String dividendo = valor.split(":")[0];
            String divisor = valor.split(":")[1];
            
            String cocienteSolucion = request.getParameter("solucion").split(":")[0];
            String solucionString = request.getParameter("solucion").split(":")[1];
            
            String cocienteSolucionString = request.getParameter("solucion").split(":")[0];
            
            int decimales = cocienteSolucionString.split(",")[1].length();
            
            String[] solucion = solucionString.split(";");
            List<Integer> solucionInts = new ArrayList<Integer>();
            
            for(int i=0;i<solucion.length;i++){
                solucionInts.add(Integer.parseInt(solucion[i]));
            }
            
            String cerosString = request.getParameter("solucion").split(":")[2];

            String[] ceros = cerosString.split(";");
            List<Integer> cerosInts = new ArrayList<Integer>();
            
            for(int i=0;i<ceros.length;i++){
                cerosInts.add(Integer.parseInt(ceros[i]));
            }  
            
            String cocienteSolucionUsuarioString = request.getParameter("solucionusuario").split(":")[0];
            
            String solucionusuarioString = request.getParameter("solucionusuario").split(":")[1];

            //setear las soluciones
            request.setAttribute("dividendo", dividendo);
            request.setAttribute("divisor", divisor);
            
            //Convertir ceros y solucion a lista de enteros
            
            request.setAttribute("ceros", cerosInts);
            request.setAttribute("solucion", solucionInts);
            request.setAttribute("solucionusuario", solucionusuarioString);
            
            request.setAttribute("cocienteSolUsuario", cocienteSolucionUsuarioString);
            
            request.setAttribute("decimales", decimales);
            
            request.setAttribute("cocienteSolucion", cocienteSolucion);
            
            request.getRequestDispatcher("Profesor/Matematicas/DivisionConDecimales/visualizarCorreccionDivisionDN.jsp").forward(request, response);
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
