/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Login;
import javax.swing.JFrame;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author HP
 */
@WebServlet(name = "SignIn", urlPatterns = {"/SignIn"})
public class SignIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Session session = DB.Connection.getSessionFactory().openSession();
            Criteria cr = session.createCriteria(POJOS.Login.class).add(Restrictions.eq("email", email));
            cr.add(Restrictions.eq("password", password));
            Login us = (Login) cr.uniqueResult();

            Criteria cr1 = session.createCriteria(POJOS.Login.class).add(Restrictions.eq("email", email));
            POJOS.Login login = (POJOS.Login) cr1.uniqueResult();

//        Login login = new Login();
//        login.setEmail(email);
//        login.setPassword(password);
//         
//        cr.add(Restrictions.and(Restrictions.eq("email", email), Restrictions.eq("password", password))).uniqueResult();
            if (us == null) {
                response.sendRedirect("index.jsp");
            } else {
                if (login.getPassword().equals(password)) {
                    HttpSession ht = request.getSession();
                    ht.setAttribute("User_Email", email);
                    DB.userDetails.userEmail = (String) ht.getAttribute("User_Email");
                    response.sendRedirect("profile.jsp");

                } else {
                    String message = "Your password is wrong..!!!";
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("signin.jsp");
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
