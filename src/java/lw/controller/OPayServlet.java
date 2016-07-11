/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.controller;

import AllPay.Payment.Integration.AllInOne;
import AllPay.Payment.Integration.Decimal;
import AllPay.Payment.Integration.DeviceType;
import AllPay.Payment.Integration.ExtraPaymentInfo;
import AllPay.Payment.Integration.HttpMethod;
import AllPay.Payment.Integration.Item;
import AllPay.Payment.Integration.PaymentMethod;
import AllPay.Payment.Integration.PaymentMethodItem;
import AllPay.Payment.Integration.UseRedeem;
import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lw.domain.Product;
import lw.domain.ShoppingCart;

/**
 *
 * @author Patty
 */
@WebServlet(name = "OPayServlet", urlPatterns = {"/member/OPay.do"})
public class OPayServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        ShoppingCart cart
               = (ShoppingCart)session.getAttribute("cart");
        System.out.println(cart);
        /*
* 產生訂單的範例程式碼。
         */
        List<String> enErrors = new ArrayList<String>();
        try {
            AllInOne oPayment = new AllInOne();
            /* 服務參數 */
            oPayment.ServiceMethod = HttpMethod.HttpPOST;
            oPayment.ServiceURL = "http://payment-stage.allpay.com.tw/Cashier/AioCheckOut";
            oPayment.HashKey ="5294y06JbISpM5x9";
            oPayment.HashIV = "v77hoKGq4kWxNNIS";
            oPayment.MerchantID = "2000132";
            /* 基本參數 */
            oPayment.Send.ReturnURL = "http://localhost:8080/LetsWatchWeb/member/check_out_ok.jsp";
            oPayment.Send.ClientBackURL = "http://localhost:8080/LetsWatchWeb/member/check_out.jsp";
            oPayment.Send.OrderResultURL = "http://localhost:8080/LetsWatchWeb/member/check_out_ok.jsp";
            oPayment.Send.MerchantTradeNo = Math.abs(new Date().hashCode()) + "";
            oPayment.Send.MerchantTradeDate = new Date();//"<<您此筆訂單的交易時間>>"
            oPayment.Send.TotalAmount = new Decimal(cart.getTotalAmount()+30+"");
            oPayment.Send.TradeDesc = "buy";
            oPayment.Send.ChoosePayment = PaymentMethod.ALL;
            oPayment.Send.Remark = "wshop";
            oPayment.Send.ChooseSubPayment = PaymentMethodItem.Credit;
            oPayment.Send.NeedExtraPaidInfo = ExtraPaymentInfo.No;
            oPayment.Send.DeviceSource = DeviceType.PC;
            oPayment.Send.IgnorePayment = "WebATM#ATM#CVS#BARCODE#Alipay#Tenpay#TopUpUsed"; // 例財富通):Tenpay;
            oPayment.Send.ChooseUseRedeem = UseRedeem.No; //購物金折抵
// 加入選購商品資料。    
            
            for (Product p : cart.keySet()) {
            Item a1 = new Item();
            a1.Name = p.getName()+"";
            a1.Price = new Decimal(p.getPrice()+"");
            a1.Currency = "NTD";
            a1.Quantity = cart.getQuantity(p);//<<數量>>
            a1.URL = "<<產品說明位址>>";
            oPayment.Send.Items.add(a1);
         
    
     }
            System.out.println();
            /* 產生訂單 */
            enErrors.addAll(oPayment.CheckOut(response.getWriter()));
            /* 產生產生訂單 Html Code 的方法 */
            StringBuilder szHtml = new StringBuilder();
            enErrors.addAll(oPayment.CheckOutString(szHtml));
        } catch (Exception e) {
// 例外錯誤處理。
            enErrors.add(e.getMessage());
        } finally {
// 顯示錯誤訊息。
            if (enErrors.size() > 0) {
                out.print(enErrors);
            }
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
