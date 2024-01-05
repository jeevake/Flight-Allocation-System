/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBConnector;
import model.AirlineDAO;
import model.Airline;

/**
 *
 * 
 */
public class DefaultFlightHandler extends HttpServlet {

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

        Airline airline = new Airline();
        AirlineDAO airline_op = new AirlineDAO();

        HttpSession session = request.getSession();
        DBConnector dbcon = (DBConnector) session.getAttribute("dbcon");

        airline.setDefaultAirline(request.getParameter("air_way"));

        String operation = request.getParameter("operation");

        String view;

        if (operation.equals("add")) {
            try {
                if (airline_op.RegisterAvailableAirlines(dbcon, airline)) {

                    view = "Admin/regDefaultFlights.jsp?update=1";
                } else {
                    view = "Admin/regDefaultFlights.jsp?update=0";
                }
            } catch (Exception ex) {
                throw new ServletException(ex.getMessage());
            }
        } else if (operation.equals("remove")) {

            try {
                if (airline_op.Delete(dbcon, airline)) {
                    view = "Admin/regDefaultFlights.jsp?delete=1";
                } else {
                    view = "Admin/regDefaultFlights.jsp?delete=0";
                }
            } catch (Exception ex) {
                throw new ServletException(ex.getMessage());
            }
        } else {
            view = "Admin/regDefaultFlights.jsp";
        }

        response.sendRedirect(view);

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeHandler</title>");
            out.println("</head>");
            out.println("<body>");
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
