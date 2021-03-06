/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
       String remember = request.getParameter("remember");
       HttpSession session = request.getSession();
        //when errors list ar not wrong
        if( email==null || (email=email.trim()).length()==0){
            errors.add("Must input email!");
        }
        
        if( password==null || (password=password.trim()).length()==0){
            errors.add("Must input password!");
        }
        
        if( checkCode==null || (checkCode=checkCode.trim()).length()==0 || !checkCode.matches((String)session.getAttribute("ImageCheckServlet"))){
            errors.add("Must input checkCode!");
            System.out.println("1111");
        }else{
            //Add checkCode business logic
            System.out.println("2222");
        }
        
        if(errors.isEmpty()){ 
               //2. Call MemberService business logic : login(u,p)
               try{
                   MemberService service = new MemberService();
                   Member m = service.login(email, password);
                //3. Show login successfully or login failed forward to success page
                   //request.setAttribute("member", m);
                   //add cookie (optional)
                   Cookie cookie = new Cookie("email", email);
                   
                   if(remember != null){
                       cookie.setMaxAge(30*24*60*60);
                   }else{
                       cookie.setMaxAge(0);
                   }
                   response.addCookie(cookie);
                   
                   Cookie cookie2 = new Cookie("remember", "checked");
                    if(remember != null){
                       cookie2.setMaxAge(30*24*60*60);
                   }else{
                       cookie2.setMaxAge(0);
                    }
                   response.addCookie(cookie2);
                   
                   session.setAttribute("member", m);
                   response.sendRedirect("/LetsWatchWeb");
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
                
        //3.2 show login failed and Exception error
        request.setAttribute("errors", errors);
        response.sendRedirect(request.getContextPath());
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
