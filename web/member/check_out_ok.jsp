<%-- 
    Document   : check_out_ok
    Created on : 2016/7/7, 下午 04:37:19
    Author     : Patty
--%>

<%@page import="lw.domain.Member"%>
<%@page import="lw.model.RDBMemberDAO"%>
<%@page import="java.net.InetAddress"%>
<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> Payment OK</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<script>
    <%
        RDBMemberDAO mDAO = new RDBMemberDAO();
        Member m = (Member)session.getAttribute("member");
        if (session.getAttribute("sum")!=null){
            int sum = (Integer)session.getAttribute("sum");
            mDAO.updateWcoin(m, sum);
            m = mDAO.getOneById(m.getId());
            session.setAttribute("member", m);
        }
        
    %>
    window.addEventListener("load",init);
    function init(){
        setTimeout(three,3000);
    }
    function three(){
        window.location="http://<%=InetAddress.getLocalHost().toString().replaceAll(".*/", "")%>:8084/LetsWatchWeb/member/orders_history.jsp";

    }
</script>
</head>

<body>
 <jsp:include page="/WEB-INF/subview/header.jsp">
 <jsp:param name="sub_title" value="Shop!P"/>
 </jsp:include>
 <div class="wrapper">
  <div id="article">
   <div class="check_ok">
    <h2>交易成功！</h2>
    <hr>
    <p>交易明細已傳送到您的會員信箱。</p>
    <p>感謝您對LetsWatch支持，祝您使用愉快！</p>
    <p><a href="/LetsWatchWeb/member/orders_history.jsp">如三秒後沒有跳轉，請點此查詢交易記錄</a></p>
   </div> 
  </div> 
 </div>
 <%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>