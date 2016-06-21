<%@page contentType="text/html" pageEncoding="UTF-8" import="lw.domain.Member"%>
<!DOCTYPE html>
<%-- Comments--%>
<!-- saved from url=(0043)http://localhost:8084/LetsWatchWeb/login.do -->
<html>
<head>
<meta charset="utf-8">
<title>Login Successful!!!</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>

<!--content-->
<div class="wrapper">
 <h1>Login Successful!!!</h1>
 <h1>
  Hi, <% 
        Member m = (Member)session.getAttribute("member");
        out.print(m.getName());
        %>
 </h1>
 <form action="/LetsWatchWeb">
  <input type="submit" value="Home">
 </form>
</div><!--wrapper-->
<!--footer-->
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>

