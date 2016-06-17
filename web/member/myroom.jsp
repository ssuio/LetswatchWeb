<%@page import="lw.model.PlayListDAO"%>
<%@page import="java.util.List"%>
<%@page import="lw.model.RoomMemberListDAO"%>
<%@page import="lw.domain.Room"%>
<%@page import="lw.model.RoomDAO"%>
<%@page import="lw.domain.Member"%>
<%@page  pageEncoding="UTF-8"%>
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
    List<String> pList = pDAO.getOneById(roomId);
    List<Member> mList = rmlDAO.getOneById(roomId);
    //Check the room is exist or redirect to room_search page
    if (r.getRoomId() == null) {
        response.sendRedirect("/LetsWatchWeb/member/room_search.jsp");
    }
%>
<style>
    video{
        float:left;
        margin:2% 0% 2% 5%;

    }
    #memberlist ul{
        width: 30%;
        float:left;
        background:grey;
        text-align: center;
    }

    #memberlist ul li{
        background:darkred;
        margin:5px;
        color:bisque;
        font-size: 1.5em;

    }
    #memberlist{
        margin:auto;
        float: left;
        width:10%;
        height: 500px;
        background: antiquewhite;
        float:left;
    }
    #playlist{
        margin:auto;
        float: left;
        width:25%;
        height: 500px;
        background: antiquewhite;
        float:left;
    }

    #playlist li{
        background:darkred;
        margin:5px;
        color:bisque;
        font-size: 1.5em;
        float:left;
    }
    

    #seach_engine{
        float: left;
        width:20%;
        height: 300px;
        background: activecaption;
    }
    #videoBar{
        width: 100%;
        background: #ecf0f1;
        border: 1px solid #bdc3c7;
        height: 20px;
        border-radius: 10px;
        cursor : pointer;
    }

    .searchVideo{
        cursor: pointer;
    }

    #contentDiv{
        background-color: darksalmon;
        height: 1200px;
    }
    #player{
        float:left;
    }
    .searchVideo{
        width: 18%;
        height:200px;
        cursor: pointer;
        float:left;
    }
    #searchList{
        
        background-color: chocolate;
        height:200px;
        
    }
    
    .playListDiv{
        height:170px;
        cursor: pointer;
    }
    .playing{
        background-color: #aeaeae;
    }
    .holding{
        background-color: white;
    }
</style>
<script src="../js/youtubeDAO.js" type="text/javascript"></script>
<script src="../js/search.js" type="text/javascript"></script>
<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
<script>
    window.addEventListener("load", init);
    var resultObj;
    function init() {

        document.getElementById("videoBar").addEventListener("click", playAt);
        document.getElementById("searchVideo").addEventListener("click", searchResult);
        document.getElementById("play").addEventListener("click", play);
        document.getElementById("stop").addEventListener("click", stop);
        document.getElementById("pause").addEventListener("click", pause);
        jQuery('#searchList').css("overflow-y", "scroll");
        jQuery('#playlist').css("overflow-y", "scroll");
    }

    setInterval(syncRangeWithVideo, 500);
</script>

<div id="contentDiv">
    <h1><%=r.getRoomName()%></h1>
    <div>
        <div id="player"></div>
        <div id="memberlist">
            <h1>Member List</h1>
            <ul>
                <% for (Member mTmp : mList) {%>
                <li><%=mTmp.getName()%></li>
                    <%}%>
            </ul>
        </div>

        <div id="playlist">
            <h1>Play List</h1>
            <ul>
                <% for (String video : pList) {%>
                <li><%=video%></li>
                    <%}%>
            </ul>
        </div>
    </div>
    <button id="play" >play</button>
    <button id="stop" >stop</button>
    <button id="pause" >pause</button>
    <input type="range" min="0" max="1000" id="videoBar">
    <h1>Search Here</h1>
    <input type="text" id="searchKey"/>
    <button id="searchVideo">search</button>
    <div id="searchList"></div>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
