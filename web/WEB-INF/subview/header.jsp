<%-- 
    Document   : menu
    Created on : 2016/6/2, 下午 03:06:24
    Author     : adm
--%>

<%@page import="lw.domain.Room"%>
<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
        <title>
        <%=request.getParameter("sub_title")%>
    </title>
    </head>
    
    <body>
        <div id="header">
            <ul class="leftBotton">
                <li ><a class='menu' href="/LetsWatchWeb" title="首頁">HOME</a></li>
                <li> <a class='menu' href="/LetsWatchWeb/member/about.jsp" title="關於">ABOUT</a></li>
                <li ><a class='menu' href="/LetsWatchWeb/member/room_search.jsp" title="房間瀏覽">ROOMS</a></li>
                <li ><a class='menu' href="/LetsWatchWeb/member/question.jsp" title="建議">FORUM</a></li>
                <li ><a class='menu' href="/LetsWatchWeb/member/shop.jsp" title="購買W幣">BuyWcoin</a></li>
            </ul>
            <%
            Member m = (Member)session.getAttribute("member");
            %>
            <ul class="rightBotton">
                
                <%if(m!=null){%>
                
                <li><a class='menu' href="/LetsWatchWeb/logout.do" title="登出">Logout</a></li>
                <%}else{%>
                <li><a class='menu' href="/LetsWatchWeb/member/login.jsp" title="登入">Login</a></li>
                <li><a class='menu' href="/LetsWatchWeb/member/register.jsp" title="登出">Register</a></li>
                <%}%>
                <%if(m!=null){%>
                <li><a class='menu' href="/LetsWatchWeb/member/Profile.jsp" title="登出">Profile</a></li>
                
                <li><a class='menu' href="${sessionScope.member.roomId==null?"/LetsWatchWeb/member/room_search.jsp":"/LetsWatchWeb/member/myroom.jsp"}" title="登出">myRoom</a></li>
            </ul>
            <ul id="greeting">
                <li><%out.print("Hello,"+m.getName());%></li>
                <li><%out.print("wCoin: "+m.getwCoin());%></li>
            </ul>
                <%}%>
       
        
        </div>
       
