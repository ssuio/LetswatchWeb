<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>LetsWatch</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/indexLayout.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="navigatorDiv">
            <ul class="leftBotton">
                <li ><a class='menu' href="/LetsWatchWeb" title="首頁">HOME</a></li>
                <li> <a class='menu' href="about.html" title="關於">ABOUT</a></li>
                <li ><a class='menu' href="about.html" title="房間瀏覽">ROOMS</a></li>
                <li ><a class='menu' href="about.html" title="建議">FORUM</a></li>
                <li ><a class='menu' href="about.html" title="購買W幣">BuyWcoin</a></li>
                
            </ul>
            <%
            Member m = (Member)session.getAttribute("member");
            %>
            <ul class="rightBotton">
                
                <%if(m!=null){
                    out.print("Hello,"+m.getName());%>
                <li><a class='menu' href="/LetsWatchWeb/logout.do" title="登出">Logout</a></li>
                <%}else{%>
                <li><a class='menu' href="login.jsp" title="登入">Login</a></li>
                <li><a class='menu' href="register.jsp" title="登出">Register</a></li>
                  <%}%>
                
                <li><a class='menu' href="MemberInfo.html" title="登出">Member</a></li>
            </ul>
        
        
        
        </div>
        
        
        <div id="indexContentDiv">
              
            <span>LetsWatch</span><br>
            Create Room
        </div>
        
        <div id="officailInfoContent">TODO contact or some infomation about this site</div>
    </body>
</html>
