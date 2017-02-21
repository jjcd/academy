/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package td;

import classes.EjercicioClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JUAN JOSE
 */
@WebServlet(name = "consultaDivisionesSS", urlPatterns = {"/consultaDivisionesSS"})
public class consultaDivisionesSS extends HttpServlet {

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
        
                try {
            
                    List<EjercicioClass> listaEjercicios = new ArrayList<EjercicioClass>();
                    
                    Class.forName("org.h2.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");

                    Statement stmt = conn.createStatement();

                    String sql = "SELECT * FROM EJERCICIO WHERE TIPOEJERCICIO='DIVSS'";

                    ResultSet rst = stmt.executeQuery(sql);
                    
                    while (rst.next()) {
                        EjercicioClass ej = new EjercicioClass(rst.getString("VALOR"),rst.getString("WEB"));
                        listaEjercicios.add(ej); 
                    }
                    
                    conn.close();
            
                    request.setAttribute("listaEjercicios", listaEjercicios);            
                    request.getRequestDispatcher("Alumno/Matematicas/DivisionSinSigno/listadoDivisionesSS.jsp").forward(request, response);
                    
                }   
                catch (ClassNotFoundException ex) {
                    Logger.getLogger(guardarDivision.class.getName()).log(Level.SEVERE, null, ex);
                }       
                catch (SQLException ex) {
                    Logger.getLogger(guardarDivision.class.getName()).log(Level.SEVERE, null, ex);
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
