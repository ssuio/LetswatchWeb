/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adm
 */
@WebServlet(name = "DumpServlet", urlPatterns = {"/dump.view"})
public class DumpServlet extends HttpServlet {

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
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DumpServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>ContextPath: " + request.getContextPath()  + "</h1>");
            out.println("<h1>RemoteHost: " + request.getRemoteHost() + "</h1>");
            out.println("<h1>RequestURL: " + request.getRequestURL()  + "</h1>");
            out.println("<h1>Request Class Name: " + request.getClass()  + "</h1>");
            
            out.println("<table border='1'>");
            out.println("<caption>Headers List</caption>");
            out.println("<tr><th>Name</th><th>Value</th></tr>");
            Enumeration<String> headerNames = request.getHeaderNames();
            while(headerNames.hasMoreElements()){
                String name = headerNames.nextElement();
                String value = request.getHeader(name);
                out.println("<tr><td>"+name + "</td><td>"+value+"</td></tr>");
            }
            out.println("</table>");
            
            out.println("<br><br><br>");
            
            request.setCharacterEncoding("utf-8");// Must before line getParameterNames();!!!!!!
            //will show request parameters lists
            out.println("<table border='1'>");
            out.println("<caption>Parameters List</caption>");
            out.println("<tr><th>Name</th><th>Value</th></tr>");
            Enumeration<String> parametersNames = request.getParameterNames();
            while(parametersNames.hasMoreElements()){
                String name = parametersNames.nextElement();
                String value = request.getParameter(name);
                out.println("<tr><td>"+name + "</td><td>"+value+"</td></tr>");
            }
            out.println("</table>");
            
            out.println("</body>");
            out.println("</html>");
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
