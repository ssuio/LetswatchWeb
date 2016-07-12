<%-- 
    Document   : check_out_ok
    Created on : 2016/7/7, 下午 04:37:19
    Author     : Patty
--%>

<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> Payment OK</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper">
 <div id="article">
 <h2>交易成功！</h2>
 <div class="check_ok">
    
 <p>交易明細已傳送到您的會員信箱。</p>
 <p>感謝您對LetsWatch支持，祝您使用愉快！</p>
 <p><a href="/LetsWatchWeb/">如三秒後沒有跳轉，請點此回到首頁</a></p>

 </div> 
</div> 
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>