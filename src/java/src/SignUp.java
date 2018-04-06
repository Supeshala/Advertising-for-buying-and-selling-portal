/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Ad;
import POJOS.Login;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author HP
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");

            Session session = DB.Connection.getSessionFactory().openSession();
            Transaction tr = session.beginTransaction();

            Criteria cr = (Criteria) session.createCriteria(User.class).add(Restrictions.eq("email", email));
            User us = (User) cr.uniqueResult();

            if (us != null) {
                response.sendRedirect("signup.jsp");

            } else {

                User user = new User();
                user.setName(name);
                user.setEmail(email);
                user.setMobile(tel);

                session.save(user);

                Login login = new Login();
                login.setEmail(email);
                login.setPassword(password);
                login.setUser(user);

                session.save(login);

                tr.commit();
                HttpSession s = request.getSession();
                s.setAttribute("User_Email", email);
                DB.userDetails.userEmail = (String) s.getAttribute("User_Email");

                response.sendRedirect("post-ad.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
