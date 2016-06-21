<%@page import="lw.domain.PlayList"%>
<%@page import="lw.model.PlayListDAO"%>
<%@page import="java.util.List"%>
<%@page import="lw.model.RoomMemberListDAO"%>
<%@page import="lw.domain.Room"%>
<%@page import="lw.model.RoomDAO"%>
<%@page import="lw.domain.Member"%>
<%@page  pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyRoom</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>
<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="../js/youtubeDAO.js" type="text/javascript"></script>
<script src="../js/search.js" type="text/javascript"></script>
<script src="../js/sync.js" type="text/javascript"></script>
<script src="../js/myvideo.js" type="text/javascript"></script>
<body>
<!--header-->
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
<%
    Member m = (Member) session.getAttribute("member");
    RoomDAO dao = new RoomDAO();
    String roomId = m.getRoomId();
    Room r = dao.getOneById(roomId);
    RoomMemberListDAO rmlDAO = new RoomMemberListDAO();
    PlayListDAO pDAO = new PlayListDAO(); 
    List<PlayList> pList = pDAO.getAll(roomId);
    List<Member> mList = rmlDAO.getOneById(roomId);
    //Check the room is exist or redirect to room_search page
    if (r.getRoomId() == null) {
        response.sendRedirect("/LetsWatchWeb/member/room_search.jsp");
    }
%>

<div class="myroom">
 <div class="wrapper">
  <div id="contentDiv">
   <h1><%=r.getRoomName()%></h1>
  
    <div id="player"></div><!--影片播放位置-->
    <div id="memberlist">成員名單</div>
    <div id="playlist">播放清單</div>
   <div class="clearfix"></div>
   <button id="play" >play</button>
   <button id="stop" >stop</button>
   <button id="pause" >pause</button>
   <button id="pullMemberList" >pullMemberList</button>
   <button id="pushPlayList" >pushPlayList</button>
   <button id="pullPlayList" >pullPlayList</button>
   <button id="pushVideoPlayOnBar" >pushVideoPlayOnBar</button>
   <button id="pushPlayOnSearch" >pushPlayOnSearch</button>
   <button id="pushVideoStop" >pushVideoStop</button>
   <button id="PullToPlay" >PullToPlay</button>
   <button id="getTime" >getTime</button>
   <div class="clearfix"></div>
   
   <input type="range" min="0" max="1000" value="0" id="videoBar">
   
<!--搜尋bar-->
   <h1>Search Here</h1>
   <input type="text" id="searchKey"/>
   <button id="searchVideo">search</button>
   <div class="clearfix"></div>   
   <div id="searchList">
    <div class="clearfix"></div><!--此行不要刪-->
   </div>
  </div>
 </div><!--wrapper-->
</div>
<!--footer-->
<%@include file="/WEB-INF/subview/footer.jsp"%>

</body>
</html>