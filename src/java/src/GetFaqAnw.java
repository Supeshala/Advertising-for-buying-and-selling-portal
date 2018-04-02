/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Faq;
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
@WebServlet(name = "GetFaqAnw", urlPatterns = {"/GetFaqAnw"})
public class GetFaqAnw extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter ou = response.getWriter();
            String anw = request.getParameter("anw");
            String idfaq = request.getParameter("idfaq");
       
       Session ses = DB.Connection.getSessionFactory().openSession();
       Criteria cr = ses.createCriteria(Faq.class).add(Restrictions.eq("idfaq", ses.load(Faq.class, request.getParameter(idfaq))));
       Faq f = (Faq) cr.uniqueResult();
     
       f.setAnswer(anw);
       ses.save(f);
        
       ses.beginTransaction().commit();
       response.sendRedirect("viewFaq.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
