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
    <script src="/LetsWatchWeb/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script>
        var flag=true;
        $(document).ready(headerInit);
        function headerInit(){
            $('#profile').css('display','none');
            $('#profile_li').on("click",profileSwitch);
        }
        
        function profileSwitch(){
            if (flag===true){
                $('#profile').animate({
                    opacity: 1,
                    left: "+=0",
                    height: "show"
                  }, 800, function() {
                    // Animation complete.
                  });
            }else if(flag===false){
                 $('#profile').animate({
                    opacity: 0,
                    left: "+=0",
                    height: "hide"
                  }, 800, function() {
                    // Animation complete.
                  });
            }
            
            flag=!flag;
        }
    </script>
    
 <div class="wrapper" id="wrapper_header">
<!--logo-->
  <div class="logo"><a href="/LetsWatchWeb"><img src="/LetsWatchWeb/picture/logo.png"></a></div> 

<!--選單列-->
 <nav>
  <ul>
   <li><a title="首頁">HOME</a></li>
   <li><a href="/LetsWatchWeb/member/about.jsp" title="關於">ABOUT</a></li>
   <li><a href="/LetsWatchWeb/member/room_search.jsp" title="房間瀏覽">ROOMS</a></li>
   <li><a href="/LetsWatchWeb/member/shop.jsp" title="W商城">WSHOP</a></li>
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
    <li><a class='menu' href="/LetsWatchWeb/member/cart.jsp" title="購物車">Cart</a></li>
    <%}else{%>
    <li><a class='menu' href="/LetsWatchWeb/member/login.jsp" title="登入">Login</a></li>
    <li><a class='menu' href="/LetsWatchWeb/member/register.jsp" title="註冊">Register</a></li>
   <%}%>
   <%if(m!=null){%>
<!--    <li><a class='menu' href="/LetsWatchWeb/member/Profile.jsp" title="登出">Profile</a></li>-->
   <li id="profile_li" ><a class='menu'  title="個人頁面">Profile</a></li>
   <li><a class='menu' href="<%=m.getRoomId()==null?"/LetsWatchWeb/member/room_search.jsp":"/LetsWatchWeb/member/"+m.getRoomId()+".room"%>" title="我的房間">myRoom</a></li>
  </ul>

  <div id="greeting">
  <ul>
   <li>Hello,<span><%=m.getName()%></span></li>
   <li>wCoin：&nbsp;<span><%=m.getwCoin()%></span></li>
  </ul>
 </div>



 </div>

   <%}%>
  <div class="clearfix"></div> 
  </div><!--wrapper-->
</header>
<%@include file="/member/profile_div.jsp"%>