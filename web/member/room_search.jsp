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
    <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
    <script src="/LetsWatchWeb/js/jquery-1.12.4.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
<style>
    p{
        float:left;
        margin:10px;
    }
    
    .room_search_ul li{
        float:left;
        width: 10%;
        height:100px;
        background-color: crimson;
        color: aliceblue;
        padding: 1em 0.5em;
        margin: 1%;
        text-align: center;
        font-size:1.5em;
        font-family:fantasy;
    }
</style>
<div>        
    <h1>Rooms Search</h1>
    <ul class="room_search_ul">
    <%RoomDAO dao = new RoomDAO();
    List<Room> rooms = new ArrayList<Room>();
            rooms = dao.getAll();
    for(Room r:rooms){%>
    <a href="/LetsWatchWeb/<%=r.getRoomId()%>.room"><li><%=r.getRoomName()%><br>wCoin:<%=r.getwCoin()%><br>Pwd:<%=r.getRoomPwd()%></li></a>
    <%}%>
    </ul>
        
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>