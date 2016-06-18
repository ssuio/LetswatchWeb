/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
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
import lw.domain.PlayList;
import lw.model.PlayListDAO;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Cyruss
 */
public class PlayListServlet extends HttpServlet {

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
        
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html");
            List<PlayList> pList = new ArrayList<>();
            PlayListDAO pDAO = new PlayListDAO();
            PlayList p;
            Member m;
            String roomId;
            HttpSession session = request.getSession();
            String[] vId = request.getParameterValues("videoId[]");
            String[] vTitle = request.getParameterValues("videoTitle[]");
            String[] vTime = request.getParameterValues("videoTime[]");
            String[] vImg = request.getParameterValues("videoImg[]");
            String action=request.getParameter("action");
            String time = request.getParameter("time");
            JSONObject jObj;
            JSONArray jArr;
            JSONObject address;
            m = (Member)session.getAttribute("member");
            roomId = m.getRoomId();
            

            if(action.matches("push")){
                System.out.println("IN PUSH");
                if(vId!=null && vTitle!=null && vTime!=null && vImg!=null){

                    for (int i=0; i< vId.length;i++){
                        p = new PlayList();
                        p.setVideoId(vId[i]);
                        p.setVideoTitle(vTitle[i]);
                        p.setVideoTime(vTime[i]);
                        p.setVideoImg(vImg[i]);
                        pList.add(p);
                    }
                }else{
                    System.out.println("Something is NULL!!!!!!!!!!!!!!!");
                }

                
                try {
                    pDAO.cleanTable(roomId);
                    pDAO.insert(pList, roomId,time);
                } catch (LWException ex) {
                    Logger.getLogger(PlayListServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else if(action.matches("pull")){
                try {
                    String oldTime = pDAO.getTime(roomId);
                    if(!time.matches(oldTime)){
                        try {
                            pList = pDAO.getAll(roomId);
                            if(pList!=null){
                                jArr = new JSONArray();
                                jObj= new JSONObject();
                                for(PlayList pTmp: pList){
                                    address = new JSONObject();
                                    try {
                                        address.put("videoId", pTmp.getVideoId());
                                        address.put("videoTitle", pTmp.getVideoTitle());
                                        address.put("videoTime", pTmp.getVideoTime());
                                        address.put("videoImg", pTmp.getVideoImg());
                                        jArr.put(address);
                                    } catch (JSONException ex) {
                                        Logger.getLogger(PlayListServlet.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                }
                                try {
                                    jObj.put("videos", jArr);
                                    jObj.put("time",oldTime);
                                } catch (JSONException ex) {
                                    Logger.getLogger(PlayListServlet.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                
                                response.setContentType("application/json");
                                response.getWriter().write(jObj.toString());
                                
                            }
                        } catch (LWException ex) {
                            Logger.getLogger(PlayListServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }else{
                        System.out.println("Time is the same!");
                        JSONObject json = new JSONObject();
                        try {
                            json.put("time", "same");
                            response.setContentType("application/json");
                                response.getWriter().write(json.toString());
                        } catch (JSONException ex) {
                            Logger.getLogger(PlayListServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } catch (LWException ex) {
                    Logger.getLogger(PlayListServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
            }else{
                System.out.println("ACTION FLAG WRONG!");
            
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
