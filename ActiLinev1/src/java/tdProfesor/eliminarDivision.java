/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tdProfesor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "eliminarDivision", urlPatterns = {"/eliminarDivision"})
public class eliminarDivision extends HttpServlet {

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

        if((request.getParameter("idDivision")!=null))
        {
            //Recogemos el id de la division a borrar
            //Transaccion con rollback, por si uno de los executes no saliera bien
            Connection conn = null;
            
            int idDivision = Integer.parseInt(request.getParameter("idDivision"));
            
            try {
                
                
                Class.forName("org.h2.Driver");

                conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");

                conn.setAutoCommit(false);

                PreparedStatement st = conn.prepareStatement("DELETE FROM EJERCICIORESUELTO WHERE IDEJERCICIO = ?");
                
                st.setInt(1, idDivision);
                
                st.execute();

                PreparedStatement pst = conn.prepareStatement("DELETE FROM EJERCICIO WHERE ID = ?");

                pst.setInt(1, idDivision);

                pst.execute();

                conn.commit();

                if (!conn.isClosed()) {
                    conn.close();
                }
                
            } catch (SQLException e) {
              if (conn != null) {
                  try
                  {
                      conn.rollback();
                      
                      if (!conn.isClosed()) {
                        conn.close();
                      }
                  } catch (SQLException ex) {
                      Logger.getLogger(eliminarDivision.class.getName()).log(Level.SEVERE, null, ex);
                  }
              }

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(eliminarDivision.class.getName()).log(Level.SEVERE, null, ex);
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
