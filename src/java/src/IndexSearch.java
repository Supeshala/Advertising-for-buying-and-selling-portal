/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "IndexSearch", urlPatterns = {"/IndexSearch"})
public class IndexSearch extends HttpServlet {

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
            if(request.getParameter("agileinfo_search").equals("Mobiles")){
                response.sendRedirect("mobiles.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Electronics & Appliances")) {
                response.sendRedirect("electronics-appliances.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Cars")) {
                response.sendRedirect("cars.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Bikes")) {
                response.sendRedirect("bikes.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Furnitures")) {
                response.sendRedirect("furnitures.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Books, Sports & Hobbies")) {
                response.sendRedirect("books-sports-hobbies.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Fashion")) {
                response.sendRedirect("fashion.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Kids")) {
                response.sendRedirect("kids.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Services")) {
                response.sendRedirect("services.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Jobs")) {
                response.sendRedirect("jobs.jsp");
            }else if (request.getParameter("agileinfo_search").equals("Real Estates")) {
                response.sendRedirect("real-estate.jsp");
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
