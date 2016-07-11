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
import lw.domain.Room;
import lw.model.RDBMemberDAO;
import lw.model.RoomDAO;
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
            RoomDAO rDAO = new RoomDAO();
            String roomId = request.getRequestURI();
            roomId = roomId.replaceAll(".*/", "");
            roomId = roomId.replaceAll(".room", "");
            HttpSession session = request.getSession();
            Member m = (Member)session.getAttribute("member");
            int memberCoin ;
            Room r;
            int roomPrice;
            int difference;
            if(m==null){
                response.sendRedirect("/LetsWatchWeb/member/login.jsp");
                return;
            }

            //Leaving the room user was in 
            if (m.getRoomId()!=null)
                    rs.leaveRoom(m, m.getRoomId());
               
            m.setRoomId(roomId);
            //Check the old room if still hav member , if it's empty, delete it 
            List<Member> mlist = new ArrayList<>();
            try{
                mlist = mlDAO.getOneById(m.getRoomId());
                
            if(mlist.isEmpty())
                rs.deleteRoom(m.getRoomId());
            
            //Pay for room 
            memberCoin = m.getwCoin();
            r = rDAO.getOneById(roomId);
            roomPrice = r.getwCoin();
            difference = memberCoin - roomPrice;
            
            if(difference>=0){
                String memberId = m.getId();
                //m.setwCoin(difference);
                m.setRoomId(roomId);
                mDAO.update(m, m.getId());
                mDAO.updateWcoin(m, -roomPrice);
                m = mDAO.getOneById(memberId);
                session.setAttribute("member", m);
                rs.enterRoom(m, m.getRoomId());
            }else{
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Dont have enough wCoin!');</script>");
                response.sendRedirect("/LetsWatchWeb/member/room_search.jsp");
                out.close();
                return;
            }
            } catch (LWException ex) {
            Logger.getLogger(MyRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
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
