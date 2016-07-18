<%-- 
    Document   : check_out
    Created on : 2016/7/6, 上午 10:35:34
    Author     : Patty
--%>
<%@page import="lw.domain.PaymentType"%>
<%@page import="lw.domain.Product"%>
<%@page import="lw.domain.ShoppingCart"%>
<%@page import="lw.domain.Member"%>
<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<%--
    Member user = (Member) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
--%>
<head>
<meta charset="utf-8">
<title>Payment</title>
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>
 <div class="wrapper">  
  <div id="main_checkout"> 
   <h2>我要結賬</h2>
   <hr>
   <div class="check_out_info">
  <form method="POST" action="check_out.do">
    <%
       ShoppingCart cart
               = (ShoppingCart) request.getSession().getAttribute("cart");
       cart.setUser((Member)session.getAttribute("member"));
       if (cart == null || cart.isEmpty()) {
    %>
    <h3>購物車是空的</h3>
    <%} else{ %>
    <table class="check_table">
     <thead>
      <tr>
       <th>編號</th>
       <th>名稱</th>
       <th>價格</th>
       <th>數量</th>
       <th>&nbsp;</th>
      </tr>
     </thead>          
     <tbody>
      <% for (Product p : cart.keySet()) {%>
       <tr>
        <th><%= p.getId()%></th>
        <td class="goods_name"><h4><%=p.getName()%></h4></td>
        <td class="goods_price"><p><%=p.getPrice()%></p></td>
        <th class="goods_num"><%= cart.getQuantity(p)%></th>
        <th>&nbsp;</th>
       </tr>    
      <% } %>
     </tbody>
     <tfoot>                
      <tr>
       <td colspan="4" style="text-align: right">購物車內總金額:</td>
       <td><%= cart.getTotalAmount()%></td>
      </tr>
      <td class="paymentway" colspan="4">付款方式:
       <select style="width:20ex" id="payment_type" name="paymentType" required onchange="calculateAmountHandler()" >
        <option value="">請選擇...</option>
        <% for (PaymentType pType : PaymentType.values()) {%>        
        <option value="<%=pType.ordinal()%>"><%= pType.toString()%></option>
        <%}%>
       </select>
      </td>
      <td>&nbsp;</td>
      <tr>
       <td colspan="4" style="text-align: right">含手續費總金額:</td>
       <td><h3 id="total_fee"><%= cart.getTotalAmount()%></h3></td>
      </tr>
     </tfoot>            
    </table>

<script>
      var payment_type_array = [
      <% for(int i=0;i<PaymentType.values().length;i++){%>    
          
               {fee:<%= PaymentType.values()[i].getFee()%>}
                 
          <%= i<PaymentType.values().length-1?",":""%>
      <%}%>
      ];
               
                
      function calculateAmountHandler(){
          var pTypeIndex = $("#payment_type").val();
                    
          if(pTypeIndex>=0){
              var pType = payment_type_array[pTypeIndex];                                                                   
                                                                 
              $("#total_fee").text(<%= cart.getTotalAmount()%>+pType.fee);
          }
      }
</script>
    <div class="check_btn">  
     <input type="button" value="繼續購物" onclick="location.href = 'shop.jsp';">
     <input type="submit" value=" 確認結帳">
    </div>
 <%}%>
   </form><!--form-->     
       
       
       
   </div>
   <div class="website_logo">
      <img src="/LetsWatchWeb/picture/website-logo.png">
  </div>
  <div class="clearfix"></div>
  </div><!--article-->
 </div><!--wrapper-->
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>

