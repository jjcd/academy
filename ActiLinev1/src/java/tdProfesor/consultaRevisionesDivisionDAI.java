/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tdProfesor;

import classes.DivisionClass;
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
import td.guardarDivision;

/**
 *
 * @author JUAN JOSE
 */
@WebServlet(name = "consultaRevisionesDivisionDAI", urlPatterns = {"/consultaRevisionesDivisionDAI"})
public class consultaRevisionesDivisionDAI extends HttpServlet {

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
                    //Para recuperar los tres tipos de division con decimales (tanto dividendo como divisor)
                    List<DivisionClass> listaCorreccionesDIVSS = new ArrayList<DivisionClass>();
                    List<DivisionClass> listaCorreccionesDIVSS2 = new ArrayList<DivisionClass>();
                    List<DivisionClass> listaCorreccionesDIVSS3 = new ArrayList<DivisionClass>();
                    
                    Class.forName("org.h2.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");

                    Statement stmt = conn.createStatement();

                 
                    String sql = "SELECT * FROM EJERCICIORESUELTO WHERE TIPOEJERCICIO='DIVDAI'";

                    ResultSet rst = stmt.executeQuery(sql);
                    
                    while (rst.next()) {
                        DivisionClass ej = new DivisionClass(rst.getString("VALOR"),rst.getString("SOLUCION"),rst.getString("SOLUCIONUSUARIO"),rst.getString("USUARIO"));
                        listaCorreccionesDIVSS.add(ej); 
                    }
 
                    sql = "SELECT * FROM EJERCICIORESUELTO WHERE TIPOEJERCICIO='DIVDAMY'";

                    rst = stmt.executeQuery(sql);
                    
                    while (rst.next()) {
                        DivisionClass ej = new DivisionClass(rst.getString("VALOR"),rst.getString("SOLUCION"),rst.getString("SOLUCIONUSUARIO"),rst.getString("USUARIO"));
                        listaCorreccionesDIVSS2.add(ej); 
                    }

                    sql = "SELECT * FROM EJERCICIORESUELTO WHERE TIPOEJERCICIO='DIVDAMN'";

                    rst = stmt.executeQuery(sql);
                    
                    while (rst.next()) {
                        DivisionClass ej = new DivisionClass(rst.getString("VALOR"),rst.getString("SOLUCION"),rst.getString("SOLUCIONUSUARIO"),rst.getString("USUARIO"));
                        listaCorreccionesDIVSS3.add(ej); 
                    }                         
                    
                    conn.close();
            
                    request.setAttribute("listaEjerciciosResueltos", listaCorreccionesDIVSS);
                    request.setAttribute("listaEjerciciosResueltos2", listaCorreccionesDIVSS2);
                    request.setAttribute("listaEjerciciosResueltos3", listaCorreccionesDIVSS3);
                    
                    request.getRequestDispatcher("Profesor/Matematicas/DivisionConDecimales/correccionDivisionesDAI.jsp").forward(request, response);
                    
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
