/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.IOException;
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
import lw.model.RoomMemberListDAO;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Cyruss
 */
public class MemberListServlet extends HttpServlet {

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
            response.setContentType("text/html");
            HttpSession session = request.getSession();
            Member m = (Member)session.getAttribute("member");
            List<Member> mList ;
            String roomId = m.getRoomId();
            RoomMemberListDAO rmDAO = new RoomMemberListDAO();
            JSONArray jArr = new JSONArray();
            JSONObject jObj= new JSONObject();
        try {
           mList =  rmDAO.getOneById(roomId);
           
           
           for(Member mTmp :mList){
               JSONObject address = new JSONObject();
                address.put("name",mTmp.getName());
                
                jArr.put(address);
           }
           jObj.put("member", jArr);
           
           response.setContentType("application/json");
           response.getWriter().write(jObj.toString());
           
        } catch (LWException ex) {
            Logger.getLogger(MemberListServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MemberListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }catch (JSONException ex) {
                   Logger.getLogger(MemberListServlet.class.getName()).log(Level.SEVERE, null, ex);
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
