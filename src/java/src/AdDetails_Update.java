/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Ad;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
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
@WebServlet(name = "AdDetails_Update", urlPatterns = {"/AdDetails_Update"})
public class AdDetails_Update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                Session ses = DB.Connection.getSessionFactory().openSession();
                Transaction tr = ses.beginTransaction();

                int id = Integer.parseInt(request.getParameter("adId"));
                String category = request.getParameter("category");
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                Double price = Double.parseDouble(request.getParameter("price"));
//                Double price1 = Double.parseDouble(request.getParameter("price"));
//                DecimalFormat dcf = new DecimalFormat("#,##0.00");
//                String price2 = dcf.format(price1);
//                Double price = 
                String location = request.getParameter("location");
                String brand = request.getParameter("brand");

                Criteria cr = ses.createCriteria(Ad.class).add(Restrictions.eq("idad", id));
                Ad ad = (Ad) cr.uniqueResult();

                ad.setCategory(category);
                ad.setTitle(title);
                ad.setDescription(description);
                ad.setPrice(price);
                ad.setLocation(location);
                ad.setDate(new Date());
                ad.setBrand(brand);

                ses.update(ad);
                tr.commit();
                ses.close();

                response.sendRedirect("profile.jsp#parentVerticalTab2");
            }
    }

