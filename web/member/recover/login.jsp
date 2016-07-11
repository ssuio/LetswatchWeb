<%@page import="lw.domain.Member"%>
<%@taglib prefix="lw" tagdir="/WEB-INF/tags"%>
<%@page import="java.util.List"%>
<%@page  pageEncoding="UTF-8" info="會員登入"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>會員登入</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>
<body>

<!--header-->
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%= this.getServletInfo() %>"/>
</jsp:include>
<style>
     #login{
        width:100%;
        height:600px;
    }
     legend {
        font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
        font-size: 2em;
        font-style: normal;
        font-variant: normal;
        font-weight: 500;
        line-height: 26.4px;
        background:#fff;
    }
    fieldset {
        margin:50px 0px 0px 300px;
        width:500px;
        height: 400px;
	border:1px solid #999;
	border-radius:20px;
	box-shadow:0 0 10px #999;
    }
    form img{
        width:100px;
        height:30px;
    }
    fieldset p{
        margin:10px 0px 10px 30px;
        font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
        font-size: 1.2em;
        font-style: normal;
        font-variant: normal;
        font-weight: 500;
        width:100%;
        float:left;
    }
    
    input[type=submit]{
        font-size: 1.2em;
        margin:30px 60px 20px 0px;
        float:right;
        float:bottom;
        width: 45%;
        height:70px;
    }
    
     #confirm_submit {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
	background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
	background-color:#f9f9f9;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:1.2em;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
#confirm_submit :hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
#confirm_submit :active {
	position:relative;
	top:1px;
}

input[type=text],input[type=password] { 
    font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
    font-size: 1em;
    font-style: normal;
    font-variant: normal;
    font-weight: 500;
    line-height: 26.4px;
    background: white; 
    border: 1px solid #DDD; 
    border-radius: 5px; 
    box-shadow: 0 0 5px #DDD inset; 
    color: #666; 
    outline: none; 
    height:30px; 
    width: 50%;
    margin:auto;
   } 
</style>
<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
<script>
    $(document).ready(init);
    function init(){
        $('#refresh').on("click",refreshHandler);
        
    }
    function refreshHandler(){
        var check_img = document.getElementById("check_code_image");
        check_img.src="/LetsWatchWeb/Image/check.jpg?get=" + new Date();
    }
</script>

<!--內容-->
<div class="wrapper">
<%
 List<String> errors = (List<String>)request.getAttribute("errors");
 if(errors!=null && errors.size()>0){
%>
<ul>
<% for (String msg: errors){%>
 <li><%=msg%></li>
<%}%>
</ul>
<%}%>
            
             <%--
                //Member m = (Member)session.getAttribute("member");
                String email="";
                String remember="";
                Cookie[] cookies =request.getCookies();
                for(Cookie c:cookies){
                    if(c.getName().equals("email")){
                        email=c.getValue();
                    }else if(c.getName().equals("remember")){
                    remember = c.getValue();
                    }
                    
                }
            
            --%> 
 <div class="num_check">
  <lw:checkCodeField imgSrc="/LetsWatchWeb/Image/check.jpg" name="checkCode"/>
 </div>
</div><!--wrapper-->
<!--footer-->
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>