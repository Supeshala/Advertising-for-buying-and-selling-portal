/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import POJOS.Contact;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author HP
 */
@WebServlet(name = "GetContact", urlPatterns = {"/GetContact"})
public class GetContact extends HttpServlet {

    
   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = "";
        String email = "";
        int adid = 0;
        String phone = "";
        String msg = "";
        String att = "";
        
        try {
            FileItemFactory factory = new org.apache.commons.fileupload.disk.DiskFileItemFactory();
            org.apache.commons.fileupload.servlet.ServletFileUpload upload = new org.apache.commons.fileupload.servlet.ServletFileUpload(factory);
            List items = upload.parseRequest(request);
            for (Object object : items) {
                org.apache.commons.fileupload.FileItem fileitem = (org.apache.commons.fileupload.FileItem) object;
                if (fileitem.isFormField()) {
                    if (fileitem.getFieldName().equals("name")) {
                        name = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("email")) {
                        email = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("id")) {
                        adid = Integer.parseInt(fileitem.getString());
                    } else if (fileitem.getFieldName().equals("tel")) {
                        phone = fileitem.getString();
                    } else if (fileitem.getFieldName().equals("msg")) {
                        msg = fileitem.getString();
                    }
                } else {
                    if (fileitem.getFieldName().equals("attachment")) {
                        String contentType = fileitem.getContentType();
                        att = "uploads/" + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + Math.random() + fileitem.getName();
                        File files = new File(request.getServletContext().getRealPath("/") + "/" + att);
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
            
                Session ses = DB.Connection.getSessionFactory().openSession();
                Transaction tr = ses.beginTransaction();
                Contact c = new Contact();
               
                c.setName(name);
                c.setEmail(email);
                c.setAdid(adid);
                c.setPhone(phone);
                c.setMsg(msg);
                c.setAttachment(att);
                
                ses.save(c);
                tr.commit();
                ses.close();
                
                response.sendRedirect("contacts.jsp");
            
            
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
