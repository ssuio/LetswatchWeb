/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import lw.domain.LWException;
import lw.domain.Member;
import lw.model.PicDAO;

/**
 *
 * @author Cyruss
 */
public class UploadPicture extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            //response.setContentType("text/html;charset=UTF-8");
            //request.setCharacterEncoding("utf-8");
            PicDAO pDAO = new PicDAO();
            Part pic = request.getPart("photo");
            HttpSession session = request.getSession();
            Member m = (Member)session.getAttribute("member");
            String memberId = m.getId();
            String header = pic.getHeader("Content-Disposition");
            try {
            String filename = header.substring(
                    header.indexOf("filename=\"") + 10, header.lastIndexOf("\""
                    ));
            InputStream in = pic.getInputStream();
//            String name = pic.getName();
//            long size = pic.getSize();
            pDAO.savePic(in, memberId);

//            System.out.println("name:"+name+"  size:"+size);
            in.close();
            
            response.sendRedirect("/LetsWatchWeb/");
        } catch (LWException ex) {
            Logger.getLogger(UploadPicture.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
