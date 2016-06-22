<%-- 
    Document   : menu
    Created on : 2016/6/2, 下午 03:06:24
    Author     : adm
--%>

<%@page import="lw.domain.Room"%>
<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<title><%=request.getParameter("sub_title")%></title>-->

<header>
 <div class="wrapper">
<!--logo-->
  <div class="logo"><a href="/LetsWatchWeb"><img src="/LetsWatchWeb/picture/logo.png"></a></div> 

<!--選單列-->
 <nav>
  <ul>
   <li><a href="/LetsWatchWeb" title="首頁">HOME</a></li>
   <li><a href="/LetsWatchWeb/member/about.jsp" title="關於">ABOUT</a></li>
   <li><a href="/LetsWatchWeb/member/room_search.jsp" title="房間瀏覽">ROOMS</a></li>
   <li><a href="/LetsWatchWeb/member/shop.jsp" title="購買W幣">BuyWcoin</a></li>
   <li><a href="/LetsWatchWeb/member/suggestion.jsp" title="建議">SUGGESTION</a></li>
  </ul>
 </nav>
  <%
  Member m = (Member)session.getAttribute("member");
  %>
<!--login/logout--> 
 <div id="login"> 
  <ul>
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
 </div>
 <div id="greeting">
  <ul>
   <li>Hello,<span><%out.print(m.getName());%></span></li>
   <li>wCoin：&nbsp;<span><%out.print(m.getwCoin());%></span></li>
  </ul>
 </div>
   <%}%>
  <div class="clearfix"></div> 
  </div><!--wrapper-->
</header>
