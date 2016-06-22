<%@page import="lw.domain.Member" info="首頁"%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>首頁</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">

</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>

<div class="content">
 <div class="wrapper">
  <div class="box">
   <div class="logo"><img src="/LetsWatchWeb/picture/logo.png"></div>
   <a href="/LetsWatchWeb/member/createRoom.jsp"><div class="btn">Create Room</div></a>
  </div><!--wrapper-->
 </div>
</div>

<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>