<%-- 
    Document   : createRoom
    Created on : 2016/6/8, 上午 11:10:07
    Author     : adm
--%>

<%@page import="lw.domain.Member"%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CreateRoom</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--header-->
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>

<!--content-->
<% 
    Member m = (Member)session.getAttribute("member");
    if (m == null)
        response.sendRedirect("/LetsWatchWeb/member/login.jsp");%>

<style>
    #create_room{
        width:100%;
        height:600px;
    }
    #create_form{
        
    }
    fieldset {
        width:50%;
        height: 400px;
	border:1px solid #999;
	border-radius:20px;
	box-shadow:0 0 10px #999;
    }
    
    fieldset p{
        font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
        font-size: 1em;
        font-style: normal;
        font-variant: normal;
        font-weight: 500;
        width:100%;
        float:left;
        padding: 7px;
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
    
    input[type=submit]{
        font-size: 1.2em;
        margin:20px 10px 0px 0px;
        float:right;
        float:bottom;
        width: 45%;
        height:70px;
    }
    
    #create_submit {
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
#create_submit :hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
#create_submit :active {
	position:relative;
	top:1px;
}


  input { 
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
<div class="create_room" id="create_room">   
 <div class="wrapper" >        
  <form method="POST" action="/LetsWatchWeb/roomCreate.do" autocomplete="off" id="create_form">
      <fieldset>
          <legend>Create Room</legend>
          <p><br>
    <label for="email">Name:</label>
    <input type="text" id="roomName" name="roomName" placeholder="輸入房間名稱" value="" required>
   </p>
   <p>
    <label for="email">Password:</label>
    <input type="password" id="roomPwd" name="roomPwd" placeholder="輸入房間密碼" value="">
   </p>
   <p>
    <label for="email">Price:</label>
    <input type="text" id="roomPrice" name="roomPrice" placeholder="輸入房間價錢" value="" >
   </p>
   <p>
    <label for="email">Type:</label>
    <input type="text" id="roomType" name="roomType" placeholder="輸入房間類型" value="">
   </p>
    <input type="submit" value="Create" id="create_submit">
   </fieldset>
  </form>
 </div><!--wrapper-->
</div>

<!--footer-->
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>