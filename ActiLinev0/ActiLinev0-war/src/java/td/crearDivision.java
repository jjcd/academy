/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package td;

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
@WebServlet(name = "crearDivision", urlPatterns = {"/crearDivision"})
public class crearDivision extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet crearDivision</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet crearDivision at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
                try {
            // Handle a new guest (if any):
            String divd = request.getParameter("dividendo");
            String divs = request.getParameter("divisor");
            boolean valido = true;
            int dividendoInt=0;
            int divisorInt=0;
            
            try{
                dividendoInt = Integer.parseInt(divd);
                divisorInt = Integer.parseInt(divs);
            }
            catch(Exception ex)
            {
                valido = false;
            }
            if(valido){           
            //Zona de cálculo de pasos

            		//Division
		List<Integer> cocientes = new ArrayList<Integer>();
		List<Integer> numeros = new ArrayList<Integer>();
                List<Integer> pasos = new ArrayList<Integer>();
                			
                //inicializar flag para saber si dejó un cero a la izquierda
                List<Integer> pasosCeroIzq = new ArrayList<Integer>();
		
		int dividendo = dividendoInt;
		int divisor = divisorInt;
		
		int c = dividendo / divisor;
                
		while(c > 9){
			cocientes.add(c%10);
			c = c / 10;
			
		}
		
		cocientes.add(c);

		while(dividendo > 9){
			numeros.add(dividendo%10);
			dividendo = dividendo / 10;
		}

		numeros.add(dividendo%10);
		
		
		int numeroDividir = 0;
		
		while(cocientes.size()>0){			
			
			//cojo el primer divisor y me lo cargo
			int cociente = cocientes.get(cocientes.size()-1);
			cocientes.remove(cocientes.size()-1);


			while(numeros.size() > 0 && numeroDividir < divisor){
				//cojo otro numero y me lo cargo
				int numeroAnadir = numeros.get(numeros.size()-1);
				numeros.remove(numeros.size()-1);
				
				numeroDividir = (numeroDividir*10) + numeroAnadir;
			}
			
			int pasoDivision = 0;
			
			if(cociente!=0){
				System.out.println("Paso dividir " + numeroDividir);		
				pasoDivision = numeroDividir % divisor;
			}

                        pasos.add(numeroDividir);
                        
                        //Para añadir a si tiene ceros a la izquierda y cuantos
                        this.AnadirCerosPasos(pasosCeroIzq, numeroDividir, pasoDivision);
                        
                        //Fin para añadir a si tiene ceros a la izquierda y cuantos
                        
			numeroDividir = pasoDivision;
			
		}
                
                //En numeroDividir tendremos el paso anterior al resto
                //Comparamos también para saber si el resto tendrá 0 a la izq
                int resto = dividendoInt%divisorInt;
                
                //this.AnadirCerosPasos(pasosCeroIzq, numeroDividir, resto);
                
                //Fin comparamos tambien para saber si el resto tendrá 0 a la izq
                
                pasos.add(resto);
                pasosCeroIzq.remove(0);
                pasos.remove(0);
            //Fin zona de cálculo de pasos
            
            
                request.setAttribute("dividendo", divd);
                request.setAttribute("divisor", divs);
                request.setAttribute("solucion", pasos);
                request.setAttribute("ceros", pasosCeroIzq);
                
            
                //request.setAttribute("resultado", resultado);
                request.getRequestDispatcher("CrearEjercicio/resolverDivision.jsp")
                    .forward(request, response);
            }
 
        } finally {
            // Close the database connection:

        }
    }
    
    private void AnadirCerosPasos(List<Integer> ceros, Integer pasoOld, Integer pasoNew){
        //Para añadir a si tiene ceros a la izquierda y cuantos
        String numeroOld = pasoOld + "";
        String numeroNew = pasoNew + "";

        //Si sólo es un numero el paso quiere decir
        //que sólo hemos bajado la cifra siguiente
        //por lo que habrá tantos 0 como cifras
        //tenga el numero anterior
        if(pasoNew == 0){
            ceros.add(numeroOld.length());
        }
        else if(numeroOld.length() > numeroNew.length()){
            ceros.add(numeroOld.length()-numeroNew.length());
        }
        else
        {
            ceros.add(0);
        }
                        
        //Fin para añadir a si tiene ceros a la izquierda y cuantos
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
        doGet(request, response);
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
