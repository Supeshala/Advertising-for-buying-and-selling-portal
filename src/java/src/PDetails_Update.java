/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Login;
import POJOS.User;
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
@WebServlet(name = "PDetails_Update", urlPatterns = {"/PDetails_Update"})
public class PDetails_Update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()) {
            
            Session session = DB.Connection.getSessionFactory().openSession();
            Transaction tr = session.beginTransaction();
           
            Criteria cr = session.createCriteria(User.class).add(Restrictions.eq("email", request.getSession().getAttribute("User_Email").toString()));
            User us = (User) cr.uniqueResult();
                            
            String name = request.getParameter("name");
            String mobile = request.getParameter("tel");
            
            us.setName(name);
            us.setMobile(mobile);
           
            session.update(us);
            tr.commit();
            response.sendRedirect("profile.jsp#parentVerticalTab1");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
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
