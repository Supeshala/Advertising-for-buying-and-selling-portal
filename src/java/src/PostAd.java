/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.io.File;
import java.util.List;
import POJOS.Ad;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author HP
 */
@WebServlet(name = "PostAd", urlPatterns = {"/PostAd"})
public class PostAd extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String category = "";
        String title = "";
        String description = "";
        double price = 0;
        String brand = "";
        String location = "";
        String path = "";
        String path1="";
        
        try {
            FileItemFactory factory = new org.apache.commons.fileupload.disk.DiskFileItemFactory();
            org.apache.commons.fileupload.servlet.ServletFileUpload upload = new org.apache.commons.fileupload.servlet.ServletFileUpload(factory);
            List items = upload.parseRequest(request);
            for (Object object : items) {
                org.apache.commons.fileupload.FileItem fileitem = (org.apache.commons.fileupload.FileItem) object;
                if (fileitem.isFormField()) {
                    if (fileitem.getFieldName().equals("category")) {
                        category = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("title")) {
                        title = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("description")) {
                        description = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("price")) {
                        price = Double.parseDouble(fileitem.getString());
                    } else if (fileitem.getFieldName().equals("brand")) {
                        brand = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("location")) {
                        location = fileitem.getString();
                    }
                } else {
                    if (fileitem.getFieldName().equals("image")) {
                        String contentType = fileitem.getContentType();
                        path = "uploads/" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + Math.random() + fileitem.getName();
                        File files = new File(request.getServletContext().getRealPath("/") + "/" + path);
                        System.out.println(files.getPath());
                        try {
                            fileitem.write(files);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("User_Email") != null) {
                Session ses = DB.Connection.getSessionFactory().openSession();
                Transaction tr = ses.beginTransaction();
                Ad ad = new Ad();
                
                Criteria cr = ses.createCriteria(User.class).add(Restrictions.eq("email", request.getSession().getAttribute("User_Email").toString()));
                User user = (User) cr.uniqueResult();
                
                ad.setCategory(category);
                ad.setTitle(title);
                ad.setDescription(description);
                ad.setPrice(price);
                ad.setLocation(location);
                ad.setDate(new Date());
                ad.setBrand(brand);
                ad.setImage(path);
                ad.setImage1(path1);
                ad.setUser(user);
                
                ses.save(ad);
                tr.commit();
                ses.close();
                
                response.sendRedirect("all-classifieds.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}
