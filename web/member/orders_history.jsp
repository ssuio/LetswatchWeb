<%-- 
    Document   : orders_history
    Created on : 2016/7/6, 上午 10:35:34
    Author     : Patty
--%>

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
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
</head>
<%
    Member user = (Member) session.getAttribute("member");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper">
    <div id="article">
<%
        OrderService service = new OrderService();
        List<Order> list = service.getByMember(user.getId());
        if (list != null && list.size() > 0) {
        %>
   
    <table cellpadding="5" cellspacing="5">
        <thead>
            <tr>
                <th>No.</th>
                <th>交易時間</th>
                <th>付款方式</th>
                
                <th>總金額</th>
              
                
                <th></th>
            </tr>            
        </thead>
<!--        <tbody>
            <%--for (int i = 0; i < list.size(); i++) {
                    Order order = list.get(i);
            --%>
            <tr>
                <td><%--= order.getId()%></td>
                <td><%= order.getCreatedTime()%></td>
                <td><%= order.getPaymentType()%></td>
                
                <td><%= order.getTotalAmount()%></td>
                
                
            </tr>                        
            <%}--%>
        </tbody>-->
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
        //alert(orderId);
        $.ajax({
            
            method: "POST",
            data: {oid: orderId}
        }).done(
                function (result) {
                    //alert(result);
                    $("#detail").html(result);
                    $("#detail").dialog("open");
                }
        ).fail(
                function (xhr, status) {
                    console.log(status);
                }
        );
    }
    
</script>-->
</div>
</div>  

<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>
