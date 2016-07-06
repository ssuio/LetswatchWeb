/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lw.domain.Product;
import lw.domain.ShoppingCart;

/**
 *
 * @author Patty
 */
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/member/update_cart.do"})
public class UpdateCartServlet extends HttpServlet {

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
       ShoppingCart cart = (ShoppingCart)request.getSession().getAttribute("cart");
        if(cart!=null && !cart.isEmpty()){
            Set<Product> deleteSet = new HashSet<>();
            Set<Product> keySet = cart.keySet();
            for(Product p:keySet){
                String quantity = request.getParameter("quantity_"+p.getId());
                String delete = request.getParameter("delete_"+p.getId());
                if(delete!=null){
                    //cart.remove(p); //Runtime會發生ConcurrentModificationException
                    deleteSet.add(p);
                }else{
                    if(quantity!=null && quantity.matches("\\d+")){
                        int q = Integer.parseInt(quantity);
                        if(q>0){
                            cart.update(p, q);
                        }
                    }else{
                        System.out.println("修改產品數量失敗: " + p.getName() + "," + quantity);
                    }
                }                
            }            
            for(Product p:deleteSet){
                cart.remove(p);
            }
        }        
        response.sendRedirect(request.getContextPath() + "/member/cart.jsp");
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
