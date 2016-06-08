/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.LWException;
import lw.domain.Member;
import lw.domain.Room;
import lw.model.RoomMemberListDAO;
import lw.model.RoomService;

/**
 *
 * @author adm
 */
public class RoomCreateServlet extends HttpServlet {

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
        RoomService rs = new RoomService();
        RoomMemberListDAO rmDAO = new RoomMemberListDAO();
        Room r = new Room();
        Member m;
        HttpSession session = request.getSession();
        try {
            String roomName = request.getParameter("roomName");
            String roomPwd = request.getParameter("roomPwd");
            String roomPrice = request.getParameter("roomPrice");
            String roomType = request.getParameter("roomType");
            m = (Member)session.getAttribute("member");
            r.setRoomName(roomName);
            
            if(roomPwd!=null)
                r.setRoomPwd(roomPwd);
            else
                r.setRoomId("");
            
            if(roomPrice.matches("\\d++"))
                r.setwCoin(Integer.parseInt(roomPrice));
            else
                r.setwCoin(0);

                r.setRoomType(Integer.parseInt(roomType));
            String roomId = rs.createRoom(r);
            System.out.println(m);
            System.out.println(roomId);
            rmDAO.insert(m, roomId);
            session.setAttribute("roomId", roomId);
            response.sendRedirect("/LetsWatchWeb/member/room.jsp");
            
        } catch (LWException ex) {
            Logger.getLogger(RoomCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
