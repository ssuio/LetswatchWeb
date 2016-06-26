/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lw.domain.LWException;
import lw.domain.Room;
import lw.model.RoomDAO;

/**
 *
 * @author Cyruss
 */
@WebServlet(name = "RoomPwdServlet", urlPatterns = {"/RoomPwd.do"})
public class RoomPwdServlet extends HttpServlet {

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
       
            fixHeaders(response);
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            String roomId = request.getParameter("roomId");
            String pwd = request.getParameter("pwd"); 
        try {
            RoomDAO rDAO = new RoomDAO();
            Room r = rDAO.getOneById(roomId);
            if(pwd.matches(r.getRoomPwd())){
                System.out.println("PWD RIGHTTTTTTTTTTTTTTTTTTTTTT");
                response.sendRedirect("/LetsWatchWeb/"+ roomId + ".room");
            
            }else{
                System.out.println("PWD WRONG!!!!!");
            }
        } catch (LWException ex) {
            Logger.getLogger(RoomPwdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RoomPwdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
