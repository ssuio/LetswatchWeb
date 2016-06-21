<%@page import="lw.domain.PlayList"%>
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
<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="../js/youtubeDAO.js" type="text/javascript"></script>
<script src="../js/search.js" type="text/javascript"></script>
<script src="../js/sync.js" type="text/javascript"></script>
<script>
    window.addEventListener("load", init);
    
    var gVideoId = 'j68LY3fKbrg';
    var videoTitle;
    var videoTime;
    var videoImg;
    var pushPlaylistObj;
    var pullPlaylistObj;
    var resultObj;
    var playListTime='0';
    var time='0';
    var area;
    var action;
    var currentTime='0';
    //var host="localhost:8084";
    //var host="ssuio.idv.tw:58885";
    var host="10.0.1.9:8084";
    var roomId ="<%=m.getRoomId()%>";
    function init() {
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
        
        document.getElementById("videoBar").addEventListener("click", pushVideoPlayOnBar);
        document.getElementById("searchVideo").addEventListener("click", searchResult);
        document.getElementById("play").addEventListener("click", play);
        document.getElementById("stop").addEventListener("click", stop);
        document.getElementById("pause").addEventListener("click", pause);
        document.getElementById("pushPlayList").addEventListener("click", pushPlayList);
        document.getElementById("pullMemberList").addEventListener("click", pullMemberList);
        document.getElementById("pullPlayList").addEventListener("click", pullPlayList);
        
        
        $('#pushVideoPlayOnBar').on("click",pushVideoPlayOnBar);
        $('#pushPlayOnSearch').on("click",pushPlayOnSearch);
        $('#getTime').on("click",getTime);
        $('#pushVideoStop').on("click",pushVideoStop);
        $('#PullToPlay').on("click",PullToPlay);
        
        
        
        
        
        //document.getElementById("getTime").addEventListener("click", getTime);
        jQuery('#searchList').css("overflow-y", "scroll");
        jQuery('#playlist').css("overflow-y", "scroll");
    }
    
    function getTime(){
        console.log("roomId: "+ roomId);
        console.log("action: "+action);
        console.log("currentTime: "+currentTime);
        console.log("area: "+area);
        console.log("videoId: "+ gVideoId);
        console.log("time: "+time);
    }

    
    
    

function PullToPlay(){
    
    $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            
            data:{
                'roomId': roomId,
                'remote': 'pull',
                'time':time
            },
            success:function(response){
                if(response.time!=="same"){
                    gVideoId = response.videoId;
                    area =response.area;
                    action =response.action;
                    currentTime =response.currentTime;
                    time = response.time;
                    
                    if(action==='stop'){
                        pause();

                    }else if(area==='play' && currentTime==='0' && action==='play'){
                        $('#playlist div').attr("class","playListDiv");
                        $('.playListDiv[data-videoid='+gVideoId+']').addClass("playing");
                        player.cueVideoById(gVideoId,0,'default').playVideo();
                    }else if(area==='search'&& currentTime==='0' && action==='play'){
                        $('#playlist div').attr("class","playListDiv");
                        player.cueVideoById(gVideoId,0,'default').playVideo();

                    }else{
                        player.cueVideoById(gVideoId,currentTime,'default').playVideo();

                    }
                }else{
                    console.log("Video Time is the same , didn't do anytime!");
                    
                    
                }
                
                
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
 
}


function pushPlayOnPlayList(videoId){
    area="play";
    action="play";
    time = Date.now();
//    videoId = player.getVideoData()['video_id'];
    gVideoId = videoId;
        $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': '0',
                   'videoId': videoId,
                   'time' : time
            },
            success:function(response){
                
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
}

function pushPlayOnSearch(videoId){
    area="search";
    action="play";
    time = Date.now();
//    videoId = player.getVideoData()['video_id'];
    gVideoId = videoId;
    
     $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': '0',
                   'videoId': gVideoId,
                   'time' : time
            },
            success:function(response){
                console.log(response);
                 
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
    
}

function pushVideoPlayOnBar(){
    var afterClick = document.getElementById("videoBar").value;
    var duration = player.getDuration();
    var final = afterClick*duration/1000;
    player.seekTo(final);
    currentTime = final;
    time = Date.now();
    action="play";
    $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': currentTime,
                   'videoId': gVideoId,
                   'time' : time
            },
            success:function(response){
            
            
            
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
}

function pushVideoStop(){
    action="stop";
     $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': currentTime,
                   'videoId': gVideoId,
                   'time' : time
            },
            success:function(response){
                console.log(response);
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
}
    

    
       
    
        
        
</script>

<div id="contentDiv">
    <h1><%=r.getRoomName()%></h1>
    <div>
        <div id="player"></div>
        <div id="memberlist"></div>
        

        <div id="playlist"></div>
       
    </div>
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
    <input type="range" min="0" max="1000" value="0" id="videoBar">
    <h1>Search Here</h1>
    <input type="text" id="searchKey"/>
    <button id="searchVideo">search</button>
    <div id="searchList"></div>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
