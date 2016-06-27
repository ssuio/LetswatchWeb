/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.view;

import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.ChatUser;
import lw.domain.Member;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author adm
 */
public class ChatServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Member m = (Member) session.getAttribute("member");
        String roomId = request.getParameter("roomId");
        String action = request.getParameter("action");
        String msg = request.getParameter("msg");
        String cliTime = request.getParameter("time");
        ServletContext application = this.getServletContext();
        String serTime = (String) application.getAttribute(roomId + "time");
        ChatUser c;
        String memberName;
        Calendar cal = Calendar.getInstance();
        String time;

        if (serTime == null) {
            serTime = "0";
            application.setAttribute(roomId + "time", serTime);
        }

        List<ChatUser> clist;
        JSONObject jObj;
        JSONArray jArr;

        clist = (List<ChatUser>) application.getAttribute(roomId + "chat");
        if (clist == null) {
            clist = new ArrayList<>();
            application.setAttribute(roomId + "chat", clist);
        }

        try {

            switch (action) {

                case ("push"):
                    System.out.println("PUSH_START");
                    c = new ChatUser();
                    time = cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE);
                    memberName = request.getParameter("memberName");
                    c.setTime(time);
                    c.setMsg(msg);
                    c.setName(memberName);
                    clist.add(c);
                    application.setAttribute(roomId + "time", cliTime);
                    System.out.println("PUSH_END");
                    System.out.println("1111servTime:" + serTime);

                case ("pull"):
                    if (cliTime != null && !serTime.matches(cliTime)) {
                        System.out.println("PULL_START");
                        jObj = new JSONObject();
                        jArr = new JSONArray();

                        for (ChatUser ctmp : clist) {
                            JSONObject address = new JSONObject();
                            address.put("name", ctmp.getName());
                            address.put("time", ctmp.getTime());
                            address.put("msg", ctmp.getMsg());

                            jArr.put(address);
                        }

                        jObj.put("talk", jArr);
                        jObj.put("serTime", serTime);
                        response.setContentType("application/json");
                        response.getWriter().write(jObj.toString());
                        System.out.println("PULL_END");
                        System.out.println("333servTime:" + serTime);

                    } else {
                        System.out.println("SAME START");
                        jObj = new JSONObject();
                        jObj.put("time", "same");
                        response.setContentType("application/json");
                        response.getWriter().write(jObj.toString());
                        System.out.println("SAME END");
                    }
                    break;
                default:
                    System.out.println("Can't verify action!");
            }

        } catch (JSONException ex) {
            Logger.getLogger(ChatServlet.class.getName()).log(Level.SEVERE, null, ex);
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
