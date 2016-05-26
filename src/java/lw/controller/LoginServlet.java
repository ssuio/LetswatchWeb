/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lw.domain.LWException;
import lw.domain.Member;
import lw.model.MemberService;

/**
 *
 * @author adm
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login.do"})
public class LoginServlet extends HttpServlet {

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
        List<String> errors = new ArrayList<>();
//1. read and check the query stream/formdata/parameters from form 
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String checkCode = request.getParameter("checkCode");
        //when errors list ar not wrong
        if( email==null || (email.trim()).length()==0){
            errors.add("Must input email!");
        }
        
        if( password==null || (password=password.trim()).length()==0){
            errors.add("Must input password!");
        }
        
        if( checkCode==null || (checkCode=checkCode.trim()).length()==0){
            errors.add("Must input checkCode!");
        }else{
            //Add checkCode business logic
        }
        
        if(errors.isEmpty()){ 
               //2. Call MemberService business logic : login(u,p)
               try{
                   MemberService service = new MemberService();
                   Member m = service.login(email, password);
                //3. Show login successfully or login failed
                response.setContentType("text/html");
                response.setCharacterEncoding("utf-8");
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Login Successful!!!</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Login Successful!!!" + "</h1>");
                    out.println("<h1>Hi, "+ m.getName() + "</h1>");
                    out.println("</body>");
                    out.println("</html>");
                }
                return;
               }catch(LWException ex){
                   errors.add(ex.getMessage());
                   
                   if(ex.getCause()!=null){
                    ex.printStackTrace();
                   }
               }
               catch(Exception ex){
                   errors.add(ex.toString());
               }
               
        }

        
        response.setContentType("text/html");
                response.setCharacterEncoding("utf-8");
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Login Failed!!!</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Login Failed!!!" + "</h1>");
                    out.println(errors);
                    out.println("</body>");
                    out.println("</html>");
                }
        //3.2 show login failed and Exception error
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

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
