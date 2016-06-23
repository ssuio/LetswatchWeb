/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.LWException;
import lw.domain.Member;
import lw.model.PicDAO;

/**
 *
 * @author Cyruss
 */
public class GetMemberPic extends HttpServlet {

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
        
//            response.setContentType("text/html;charset=UTF-8");
//            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            PicDAO pDAO = new PicDAO();
            Member m = (Member)session.getAttribute("member");
            ServletContext application = this.getServletContext();
            String memberId = m.getId();
            byte[] pic;
            try {
                pic = pDAO.getPic(memberId);
                if(pic!=null){
                    response.setContentType("image/jpeg");
                    OutputStream out = response.getOutputStream();
                    ByteArrayInputStream bais = new ByteArrayInputStream(pic);

                    byte[] buf = new byte[1024];
                    int read = 0;
                    while((read = bais.read(buf))!=-1){
                        out.write(buf);
                    }
                    
                    return;
                }
                
                String path = application.getRealPath("/picture/super.jpg");
                File file = new File(path);
                System.out.println(path);
                FileInputStream fis = new FileInputStream(file);
                response.setContentType("image/jpeg");
                OutputStream out = response.getOutputStream();
                
                byte[] buf = new byte[1024];
                int count = 0;
                while((count = fis.read(buf))>=0){
                    out.write(buf);
                }
                
                
        } catch (LWException ex) {
            Logger.getLogger(GetMemberPic.class.getName()).log(Level.SEVERE, null, ex);
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
