/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Login;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author HP
 */
@WebServlet(name = "Change_Password", urlPatterns = {"/Change_Password"})
public class Change_Password extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cupass = request.getParameter("cpass");
        String nepass = request.getParameter("npass");
        String confirm = request.getParameter("confirm");
        int userId = Integer.parseInt(request.getParameter("uId"));
        
        Session ses = DB.Connection.getSessionFactory().openSession();
        Transaction tr = ses.beginTransaction();
        
        Login login = (Login) ses.load(Login.class, userId);
        
            login.setPassword(nepass);
            ses.update(login);
            tr.commit();
            
            String message = "Your password changed successfully..!!!";
            request.getSession().setAttribute("message", message);
            response.sendRedirect("profile.jsp#parentVerticalTab3");
        
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
