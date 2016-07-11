<%@page import="lw.domain.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lw.model.RoomDAO"%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>首頁</title>
    <script src="/LetsWatchWeb/js/jquery-1.12.4.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css"/>
    <link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
    <style>
    
    
    #content{
        font-family:fantasy;
        width:100%;
        height: 600px;
    }
    .rooms{
        border:5px solid ;
        border-color: #333;
        border-radius:20px;
        /*color: aliceblue;*/
        padding: 1em 0.5em;
        margin: 1%;
        text-align: center;
        font-size:1.5em;
        font-family:fantasy;
        margin:10px;
        float:left;
        height:100px;
        width:30%;
    }
    .roomImg{
        float:left;
        width:80px;
        height:80px;
    }
    .rooms_inside{
        float:left;
        margin:5px;
    }
        #enter_btn {
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
#enter_btn :hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
#enter_btn :active {
	position:relative;
	top:1px;
}

#key{
    float:left;
    margin:auto;
    width:20px;
    height: 20px;
}
    
    
</style>
<script>
    var host = 'ssuio.idv.tw:58885';
//    $(document).ready(init);
//    function init(){
//        $('.enterBtn').on("click",enterHandler);
//        
//    }
//    
//    function enterHandler(){
//        var roomId = $(this).attr('data-roomId');
//        var pwd = $(this).siblings("input").val();
        
//      $.ajax({
//        type:"POST",
//        url: "http://"+host+"/LetsWatchWeb/chat.do",
//        data: {
//                'roomId':roomId,
//                'pwd':pwd
//
//        },
//        success:function(response){
//               
//        },
//        error: function(){
//            console.log("ajax FAILED!");
//        }
//   });
        
    }
</script>
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>

<div id="content">
    <%RoomDAO dao = new RoomDAO();
    List<Room> rooms = new ArrayList<Room>();
            rooms = dao.getAll();
    for(Room r:rooms){%>
    <div class="rooms">
         <img src="/LetsWatchWeb/picture/couch.png" alt="" class="roomImg" class="rooms_inside"/>
         <p class="rooms_inside"><%=r.getRoomName()%><br>wCoin:<%=r.getwCoin()==0?"FREE":r.getwCoin()%></p>
            <%
//               if (!r.getRoomPwd().matches("") && r.getRoomPwd()!=null){
            %>
<!--         <img src="/LetsWatchWeb/picture/key.png" alt="" id="key"/>
            <input type="password" id="enterPwd" value=""class="rooms_inside"/>-->
            
            <% //}%>
            <a href="/LetsWatchWeb/<%=r.getRoomId()%>.room" class="rooms_inside">
                <button class="enterBtn" class="rooms_inside"  id="enter_btn" data-roomId="<%=r.getRoomId()%>">Enter</button>
            </a>
    </div>
    <%}%>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>