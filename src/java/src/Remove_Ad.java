/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Ad;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author HP
 */
@WebServlet(name = "Remove_Ad", urlPatterns = {"/Remove_Ad"})
public class Remove_Ad extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Session ses = DB.Connection.getSessionFactory().openSession();
        Transaction tr = ses.beginTransaction();
        
        Ad ad = (Ad) ses.load(Ad.class, Integer.parseInt(request.getParameter("AdId")));
       
        ses.delete(ad);
        tr.commit();
        response.sendRedirect("profile.jsp#parentVerticalTab2");
        
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
