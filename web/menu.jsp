<%-- 
    Document   : menu
    Created on : 2016/6/2, 下午 03:06:24
    Author     : adm
--%>

<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/indexLayout.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="navigatorDiv">
            <ul class="leftBotton">
                <li ><a class='menu' href="/LetsWatchWeb" title="首頁">HOME</a></li>
                <li> <a class='menu' href="about.html" title="關於">ABOUT</a></li>
                <li ><a class='menu' href="about.html" title="房間瀏覽">ROOMS</a></li>
                <li ><a class='menu' href="about.html" title="建議">FORUM</a></li>
                <li ><a class='menu' href="shop.jsp" title="購買W幣">BuyWcoin</a></li>
            </ul>
            <%
            Member m = (Member)session.getAttribute("member");
            %>
            <ul class="rightBotton">
                
                <%if(m!=null){%>
                
                <li><a class='menu' href="/LetsWatchWeb/logout.do" title="登出">Logout</a></li>
                <%}else{%>
                <li><a class='menu' href="login.jsp" title="登入">Login</a></li>
                <li><a class='menu' href="register.jsp" title="登出">Register</a></li>
                <%}%>
                <%if(m!=null){%>
                <li><a class='menu' href="Profile.jsp" title="登出">Profile</a></li>
                 
            </ul>
            <ul id="greeting">
                <li><%out.print("Hello,"+m.getName());%></li>
                <li><%out.print("wCoin: "+m.getwCoin());%></li>
            </ul>
                <%}%>
        
        
        </div>
        <h1>Hello World!</h1>
    </body>
</html>
