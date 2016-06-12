/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.LWException;
import lw.domain.Member;
import lw.model.PlayListDAO;
import lw.model.RDBMemberDAO;
import lw.model.RoomMemberListDAO;
import lw.model.RoomService;

/**
 *
 * @author Cyruss
 */
public class MyRoomServlet extends HttpServlet {

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
            RoomService rs = new RoomService();
            RoomMemberListDAO mlDAO = new RoomMemberListDAO();
            PlayListDAO pDAO = new PlayListDAO();
            String roomId = request.getRequestURI();
            roomId = roomId.replaceAll(".*/", "");
            roomId = roomId.replaceAll(".room", "");
            HttpSession session = request.getSession();
            Member m = (Member)session.getAttribute("member");
            if(m==null){
                response.sendRedirect("/LetsWatchWeb/member/login.jsp");
                return;
            }
            
            //Leaving the room user was in 
            if (m.getRoomId()!=null){
                    rs.leaveRoom(m, m.getRoomId());
                }
            
            //Check the old room if still hav member , if it's empty, delete it 
            List<Member> mlist = new ArrayList<>();
            try{
            mlist = mlDAO.getOneById(m.getRoomId());
            if(mlist.isEmpty()){
                
                
            
            
            }
            
            }catch (SQLException ex){
                Logger.getLogger(MyRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (LWException ex) {
            Logger.getLogger(MyRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            
            if(m!=null)
                m.setRoomId(roomId);
            session.setAttribute("member", m);
            try {
                mDAO.update(m, m.getId());
                rs.enterRoom(m, m.getRoomId());
               
            } catch (LWException ex) {
            Logger.getLogger(MyRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            response.sendRedirect("/LetsWatchWeb/member/myroom.jsp");
        
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
