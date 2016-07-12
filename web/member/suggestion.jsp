<%-- 
    Document   : suggestion
    Created on : 2016/7/6, 上午 10:35:34
    Author     : Patty
--%>

<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>About</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<script>
    
    function getTime(){
        var time = new Date();
        var Year = time.getFullYear();
        var Month = time.getMonth();
        var day = time.getDate();
        var hour = time.getHours();
        var min = time.getMinutes();
        var sec = time.getSeconds();
        return Year + '/'+ Month + '/' + day + ' '+ hour + ':' + min +':' + sec;
    }
</script>
</head>
   
<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper">
    
    <div>
        
    </div>
</div>     
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>