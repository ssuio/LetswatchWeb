/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.Member;
import lw.model.IdGenerateService;
import lw.model.MemberService;
import lw.model.RDBMemberDAO;
import lw.model.StickersDAO;

/**
 *
 * @author adm
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register.do"})
public class RegisterServlet extends HttpServlet {

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
            RDBMemberDAO dao = new RDBMemberDAO();
            MemberService memberService = new MemberService();
            Member m = new Member();
            IdGenerateService idGernerator = new IdGenerateService();
//1. read and check register.jsp form data
            HttpSession session = request.getSession();
            String email = request.getParameter("uid");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            String name = request.getParameter("name");
            String checkCode = request.getParameter("checkCode");
            request.setAttribute("test", email);
            if(email==null || (email=email.trim()).length()==0){
                errors.add("會員信箱必須輸入");
            }
//            
            if(password1==null || password2==null || !password1.equals(password2)){
                errors.add("會員密碼與確認密碼必須輸入且內容一致");
            }
            
            if(checkCode == null || !checkCode.matches((String)session.getAttribute("ImageCheckServlet")) ){
                errors.add("驗證碼為空或不符合" );
                session.removeAttribute("ImageCheckServlet");
            }
            
            
            if (errors.isEmpty()){
                //2. Call MemberService register(Member)
                try{
                    m.setEmail(email);
                    m.setPwd(password2);
                    m.setId(idGernerator.generateMemberId());
                    m.setName(name);
                    memberService.register(m);
                    session.removeAttribute("ImageCheckServlet");
                    //3.1 forward to register_ok.jsp
                    StickersDAO sDAO = new StickersDAO();
                    for(int i=1; i<=3; i++ )
                        sDAO.buySticker(m.getId(), i);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/register_ok.jsp");
                    dispatcher.forward(request, response);
                    return;
                }catch (Exception ex){
                    errors.add(ex.toString());
                
                }
            }
        
            //3.2 forward to register.jsp
            request.setAttribute("errors", errors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
            dispatcher.forward(request, response);
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
