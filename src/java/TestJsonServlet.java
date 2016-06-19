/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(urlPatterns = {"/json.do"})
public class TestJsonServlet extends HttpServlet {

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
        List<PlayList> pList = new ArrayList<>();
        PlayListDAO pDAO = new PlayListDAO();
        PlayList p;
        Member m;
        String roomId="r16060042";
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        JSONObject jObj = new JSONObject();
        JSONArray jArr;
        JSONObject address;
        
        try {
            String oldTime = pDAO.getTime(roomId);
           pList = pDAO.getAll(roomId);
                        if(pList!=null){
                            jArr = new JSONArray();
                            jObj= new JSONObject();

                            for(PlayList pTmp: pList){
                                address = new JSONObject();
                                address.put("videoId", pTmp.getVideoId());
                                address.put("videoTitle", pTmp.getVideoTitle());
                                address.put("videoTime", pTmp.getVideoTime());
                                address.put("videoImg", pTmp.getVideoImg());
                                jArr.put(address);
                            }

                            jObj.put("videos", jArr);
                            jObj.put("time",oldTime);

                            response.setContentType("application/json");
                            response.getWriter().write(jObj.toString());
                        }
    }   catch (JSONException ex) {
            Logger.getLogger(TestJsonServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (LWException ex) {
            Logger.getLogger(TestJsonServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
    
//    @Override
//protected void doOptions(HttpServletRequest req, HttpServletResponse resp)
//                                                         throws ServletException, IOException {
//    fixHeaders(resp);
//}

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
