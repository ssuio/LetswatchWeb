<%-- 
    Document   : orders_history
    Created on : 2016/7/6, 上午 10:35:34
    Author     : Patty
--%>
<%@page import="lw.model.RDBOrdersDAO"%>
<%@page import="javafx.animation.Animation.Status"%>
<%@page import="lw.domain.PaymentType"%>
<%@page import="lw.model.OrderService"%>
<%@page import="lw.domain.*"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>pay</title>
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<!--<link rel="stylesheet" href="/resources/demos/style.css">-->
</head>
   
    <%
        Member user = (Member) session.getAttribute("member");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/member/login.jsp");
            return;
        }
    %>
<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
 <jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

 <div class="wrapper">
  <div class="payment_history">
   <%
       RDBOrdersDAO dao = new RDBOrdersDAO();
       List<Order> olist = dao.getOrdersByMemberId(user.getId());
       if (olist != null && olist.size() > 0) {
   %>

   <table cellpadding="5" cellspacing="5">
    <thead>
     <tr>
      <th>No.</th>
      <th>交易時間</th>
      <th>付款方式</th>
      <th>總金額</th>
      <th>&nbsp;</th>
     </tr>            
    </thead>
    <tbody>
     <%for (int i = 0; i < olist.size(); i++) {
             Order order = olist.get(i);
     %>
     <tr>
      <td><%= order.getId()%></td>
      <td><%= order.getCreatedTime()%></td>
      <td><%= order.getPaymentType()%></td>
      <td><%= order.getTotalAmount()+order.getPaymentFee()%></td>
     </tr>                        
     <%}%>
    </tbody>
   </table>
   <%}%>
<!--<div id="detail" title="產品明細"></div>
<script>
    $(function () {
        $("#detail").dialog({
            autoOpen: false, width: 500, height: 350,
            show: {
                effect: "blind",
                duration: 500
                  },
            hide: {
                effect: "blind",
                duration: 300
                  }
        });
    });
function showOrder(orderId) {
    alert(orderId);
        $.ajax({
            url: "http://localhost:8080/LetsWatchWeb/member/show_order.jsp",
            method: "POST",
            data: {oid: orderId}
        }).done(
                function (result) {
                    $("#detail").html(result);
                    $("#detail").dialog("open");
                }
        ).fail(
                function (xhr, status) {
                    console.log(status);
                }
        );
        alert('<%= request.getContextPath()%>');
    }
</script>-->
  </div><!--payment_history-->
  <div class="website_logo">
      <img src="/LetsWatchWeb/picture/website-logo.png">
  </div>
  <div class="clearfix"></div>
 </div><!--wrapper-->  
 <%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>
