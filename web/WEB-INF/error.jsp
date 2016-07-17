<%-- 
    Document   : error
    Created on : 2016/5/30, 下午 04:54:07
    Author     : adm
--%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Index</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<style>
#errorPic{
}
img{
    width:80%;
    margin-left: 10%;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Error"/>
</jsp:include>
<div id="errorPic">
        <img src="/LetsWatchWeb/picture/error.jpg" alt=""/>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>