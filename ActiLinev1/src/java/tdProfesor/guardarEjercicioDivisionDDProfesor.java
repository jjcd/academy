/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tdProfesor;

import classes.EjercicioClass;
import constantes.constantesClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
@WebServlet(name = "guardarEjercicioDivisionDDProfesor", urlPatterns = {"/guardarEjercicioDivisionDDProfesor"})
public class guardarEjercicioDivisionDDProfesor extends HttpServlet {

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
        
            //valor,url,tipoejercicio
            String dividendo = request.getParameter("dividendo");
            String divisor = request.getParameter("divisor");
            String decimales = request.getParameter("decimales");
            
            if((dividendo!=null)&&(divisor!=null)&&(!dividendo.equals(""))&&(!divisor.equals(""))&&(!decimales.equals(""))){
                String valor = "División con decimal en denominador: " + dividendo + "/" + divisor;
                String url = constantesClass.urlRaiz + "crearDivisionDecDen?dividendo="+dividendo+"&divisor="+divisor+"&decimales="+decimales;
                String tipoejercicio = "DIVDD";
                
                EjercicioClass ejercicioObject = new EjercicioClass(valor,url,tipoejercicio);
                //request.setAttribute("divisionObject", divisionObject);            
                //request.getRequestDispatcher("CrearEjercicio/InsertDivisionSQL.jsp").forward(request, response);
                
            try {
            
                Class.forName("org.h2.Driver");
                Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
            
                Statement stmt = conn.createStatement();
            
                String sql = "insert into EJERCICIO values (null, '"+ejercicioObject.getValor()+"','"+ejercicioObject.getWeb()+"','"+ejercicioObject.getTipoEjercicio()+"')";
            
                stmt.executeUpdate(sql);
            
                conn.close();
            
                request.getRequestDispatcher("Profesor/confirmacionEjercicioGuardado.jsp").forward(request, response);

            }   
            catch (ClassNotFoundException ex) {
                Logger.getLogger(guardarDivision.class.getName()).log(Level.SEVERE, null, ex);
            }       
            catch (SQLException ex) {
                Logger.getLogger(guardarDivision.class.getName()).log(Level.SEVERE, null, ex);
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
