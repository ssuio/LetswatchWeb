<%-- 
    Document   : cart
    Created on : 2016/6/27, 下午 03:18:12
    Author     : adm
--%>

<%@page import="java.util.Set"%>
<%@page import="lw.domain.Product"%>
<%@page import="lw.domain.Member"%>
<%@page import="lw.domain.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ShoppingCart cart
                    = (ShoppingCart) request.getSession().getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
        %>
    <h1>購物車是空的</h1>
    
    <%} else {%>
    <%
        Member m = (Member) request.getSession().getAttribute("member");
         if(m==null){
            
            response.sendRedirect("/LetsWatchWeb/member/login.jsp");
        }
        Set<Product> keySet = cart.keySet();
        for(Product p : keySet){
     %>
        <p><%="Total: "+cart.getTotalAmount() + "<br> Total Q:"+ cart.getTotalQuentity()+"<br> cart ="+ p.getName()%></p>
    <%   
       
    }
    }%>
</head>
<body>
    <h1>Hello World!</h1>
</body>
</html>
