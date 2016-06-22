package lw.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.LWException;
import lw.domain.Member;
import lw.model.RDBMemberDAO;

/**
 *
 * @author adm
 */
public class MemberUpdateServlet extends HttpServlet {

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
       
            RDBMemberDAO mDAO = new RDBMemberDAO();
            HttpSession session = request.getSession();
            Member m = (Member)session.getAttribute("member");
            fixHeaders(response);
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String epaper = request.getParameter("epaper");
            String introduction = request.getParameter("introduction");
            String roomId = m.getRoomId();
            String memberId = m.getId();
            
            try {
            if(!name.matches(""))
                m.setName(name);
            if(!email.matches(""))
                m.setEmail(email);
            if(!gender.matches("")&&gender.matches("Male"))
                m.setGender('M');
            if(!gender.matches("")&&gender.matches("Female"))
                m.setGender('F');
            if(!birthday.matches(""))
                m.setBirthday(birthday);
            if(!phone.matches(""))
                m.setPhone(phone);
            if(!epaper.matches("")&& epaper.matches("true"))
                m.setEpaper(true);
            if(!epaper.matches("")&& epaper.matches("false"))
                m.setEpaper(false);
            if(!introduction.matches(""))
                m.setIntroduction(introduction);
            
            mDAO.update(m, memberId);
            //if(birthday=="")
            System.out.println("name: "+ name+" email:"+email+" gender:"+ gender +" birthday"+ birthday+" phone:"+phone
                    +" epaper:"+ epaper + " introduction:"+ introduction + " roomId:" + roomId + " memberId:"+memberId);
            System.out.println("!!!!!!"+m);
        } catch (LWException ex) {
            Logger.getLogger(MemberUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void fixHeaders(HttpServletResponse response) {

    response.setContentType("text/html");
    response.setHeader("Cache-control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "-1");

    response.addHeader("Access-Control-Allow-Origin", "*"); // 授權的網址，星號代表接受所有
    response.addHeader("Access-Control-Allow-Methods", "GET, PUT, POST, OPTIONS, DELETE"); // 接受的方式
    response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Content-Length");
    response.addHeader("Access-Control-Max-Age", "86400");
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
