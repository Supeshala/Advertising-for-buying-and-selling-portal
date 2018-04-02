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
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import POJOS.Feedback;

/**
 *
 * @author HP
 */
@WebServlet(name = "GetFeedback", urlPatterns = {"/GetFeedback"})
public class GetFeedback extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String feedback = request.getParameter("feedback");
        
        Session ses = DB.Connection.getSessionFactory().openSession();
        Transaction tr = ses.beginTransaction();
        
        Feedback fed = new Feedback();
        fed.setFname(fname);
        fed.setLname(lname);
        fed.setEmail(email);
        fed.setPhone(phone);
        fed.setFeedback(feedback);
        
        ses.save(fed);
        tr.commit();
        ses.close();
        
        response.sendRedirect("feedback.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
