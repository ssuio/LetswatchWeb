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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.Member;
import lw.domain.Order;
import lw.domain.OrdersItem;
import lw.domain.PaymentType;
import lw.domain.ShoppingCart;
import lw.model.OrderService;
import lw.model.RDBMemberDAO;

/**
 *
 * @author Patty
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/member/check_out.do"})
public class CheckOutServlet extends HttpServlet {

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
        //1.取得session中的user,cart資料
        HttpSession session =request.getSession(false);
          Member user = null;
        ShoppingCart cart = null;
        if(session == null || session.isNew()){
            errors.add("找不到購物車,請重新登入後繼續購物");
//            response.sendRedirect(request.getContextPath()+"/login.jsp");
         request.setAttribute("errors", errors);
          request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }else{
            user =(Member) session.getAttribute("member");
             cart =(ShoppingCart)session.getAttribute("cart");
            if(user==null || cart == null){
                errors.add("請重新登入後繼續購物!");
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/member/login.jsp").forward(request,response);
                        return;
            }
        }
        //1-2取得並檢查parameter中的Form data
        String payment = request.getParameter("paymentType");
        if (payment == null || payment.length() == 0 || 
                !payment.matches("[0-" + (PaymentType.values().length-1) +"]")) {
            errors.add("請選擇付款方式!");
        }
      
        if(errors.isEmpty()){
        //2.呼叫商業邏輯
        try{
            OrderService service = new OrderService();
            Order order = service.makeOrder(user, cart);
            PaymentType pType =PaymentType.values()[Integer.parseInt(payment)];
            order.setPaymentType(pType);
            order.setPaymentFee(pType.getFee());
            service.create(order);
            
            List<OrdersItem> oiList = order.getOrderItemList();
            RDBMemberDAO mDAO = new RDBMemberDAO();
            
            int sum =0;
            for(OrdersItem oi : oiList){
                int pQuantity = oi.getQuantity();
                int pWcoin = oi.getProduct().getPrice() * 10;
                sum += pQuantity * pWcoin;
                //mDAO.updateWcoin(user, sum);
            }
            //user = mDAO.getOneById(user.getId());
                mDAO.updateWcoin(user, sum);
                user = mDAO.getOneById(user.getId());
                session.setAttribute("member", user);
            
            if(pType!=null && pType==pType.OPAY){
                request.getRequestDispatcher("/member/OPay.do").forward(request,response);
                   session.removeAttribute("cart");
                   return;
            }else{
                request.getRequestDispatcher("/member/ATM.do").forward(request,response);
                session.removeAttribute("cart");
                   return;
            }

           
           //3.1 redirect to "/user/orders_history.jsp"
//             response.sendRedirect(request.getContextPath()+"/member/orders_history.jsp");
//             return;
        }catch(Exception ex){
            errors.add(ex.toString());
        }
        }
        //3.2
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("/member/check_out.jsp").forward(request,response);
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
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
}
