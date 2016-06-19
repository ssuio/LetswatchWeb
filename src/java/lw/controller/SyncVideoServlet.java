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
import lw.model.RoomDAO;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Cyruss
 */
public class SyncVideoServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
//        Member m = (Member)session.getAttribute("member");
        RoomDAO rDAO = new RoomDAO();
        String roomId = request.getParameter("roomId");
        String remote = request.getParameter("remote");
        String time = request.getParameter("time");
        String action;
        String area;
        String currentTime;
        String videoId;
        String oldTime;
        Room r;
        JSONObject jObj;
        
        
        try {
            if(remote!=null && remote.matches("push")){
                action = request.getParameter("action");
                area   = request.getParameter("area");
                currentTime = request.getParameter("currentTime");
                videoId = request.getParameter("videoId");
                r = new Room();
                r.setAction(action);
                r.setArea(area);
                r.setCurrentTime(currentTime);
                r.setVideoId(videoId);
                
                rDAO.updateSyncInfo(r, roomId);
                rDAO.updateTime(time, roomId);

            }else if(remote!=null && remote.matches("pull")){
               oldTime = rDAO.getTime(roomId);
               if(oldTime != null && time!=null && !time.matches(oldTime)){
                   r = rDAO.getSyncInfo(roomId);
                   action = r.getAction();
                   area = r.getArea();
                   currentTime = r.getCurrentTime();
                   videoId = r.getVideoId();
                   time = oldTime;
                   jObj = new JSONObject();
                   jObj.put("action", action);
                   jObj.put("area", area);
                   jObj.put("currentTime", currentTime);
                   jObj.put("videoId", videoId);
                   jObj.put("time", time);
                   
                   response.setContentType("application/json");
                   response.getWriter().write(jObj.toString());
                   
                   

               }else{
                   System.out.println("Timestamp is the same!!");
                   jObj = new JSONObject();
                   jObj.put("time", "same");
                   response.setContentType("application/json");
                   response.getWriter().write(jObj.toString());
               }
               
            }else{
            
                System.out.println("CAN'T FIND REMOTE VALUE!");
            }
           
           
           
            
        } catch (LWException ex) {
            Logger.getLogger(SyncVideoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(SyncVideoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        fixHeaders(resp);
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
