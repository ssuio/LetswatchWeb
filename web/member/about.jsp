<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="../../css/indexLayout.css" rel="stylesheet" type="text/css">
<title>About</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
   
<div class="wrapper">
 <div id="main_about">
  <div class="title">關於LetsWatch</div>
  <div id="about_mainpic"><img src="/LetsWatchWeb/picture/about_pic01.jpg"></div>
  
  <div id="about_txt">文字區塊</div>
  <div class="clearfix"></div>
 </div>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>
