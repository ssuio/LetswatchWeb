<%-- 
    Document   : cart
    Created on : 2016/7/6, 上午 10:35:34
    Author     : Patty
--%>
<%@page import="java.util.Set"%>
<%@page import="lw.domain.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>
        <meta charset=UTF-8">
        <link href="../../css/indexLayout.css" rel="stylesheet" type="text/css">
        
        <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
        <title>cart</title>
        
</head>

<body>
  <div class="wrapper">
      <div id="article">
      <form method="POST" action="update_cart.do">
 <%
            ShoppingCart cart
                    = (ShoppingCart) request.getSession().getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
        %>
    
     <h3>購物車是空的</h3>

    <%} else {%>
    <%
        Member user = (Member) request.getSession().getAttribute("user");
         if(user !=null && !user.equals(cart.getUser())) {
                cart.setUser(user);
            }%>

            
            
        
            <table style="width:80%;padding: 2px; margin: auto">
            <thead>
                <tr>
                    <th>編號</th>
                    <th>名稱</th>
                    <th>價格</th>
                    <th>數量</th>
                    <th>刪除</th>
                </tr>
            </thead>            
            <tbody>
              <% for (Product p : cart.keySet()) {%>
                <tr>
                    <th><%= p.getId()%></th>
                    <td><h4><%=p.getName()%></h4></td>
                    <td><p><%=p.getPrice()%></p></td>
                    <th><input style="width:5ex;" type="number" name="quantity_<%= p.getId()%>" min="1" value="<%= cart.getQuantity(p)%>"></th>
                    <th><input type="checkbox" name="delete_<%= p.getId()%>"></th>
                </tr>    
                <% } %>
            </tbody>
            <tfoot>                
                <tr>
                  
                    <td colspan="4" style="text-align: right">
                        總金額:
                    </td>
                    <td><%= cart.getTotalAmount()%></td>
                </tr>
            </tfoot>            
        </table>
        <div>
            <div style="float:left">
                <input type="button" value="繼續購物" onclick="location.href='shop.jsp';">
            </div>
            <div style="float:right">
                <input type="submit" value="修改購物車">            
                <input type="button" value="我要結帳" onclick="location.href='check_out.jsp';">
            </div>
        </div>
        <%}%>
    </form>
      </div>
</div> 
    <%@include file="/WEB-INF/subview/footer.jsp"%>  
</body>
</html>
