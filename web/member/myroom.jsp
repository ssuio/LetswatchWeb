<%@page import="lw.model.StickersDAO"%>
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
        <script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="../js/youtubeDAO.js" type="text/javascript"></script>
        <script src="../js/search.js" type="text/javascript"></script>
        <script src="../js/sync.js" type="text/javascript"></script>
        <script src="../js/myvideo.js" type="text/javascript"></script>
        <script src="/LetsWatchWeb/js/chat.js" type="text/javascript"></script>
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
        <script>
            window.addEventListener("load", init);

            var gVideoId = 'j68LY3fKbrg';
            var videoTitle;
            var videoTime;
            var videoImg;
            var pushPlaylistObj;
            var pullPlaylistObj;
            var resultObj;
            var playListTime = '0';
            var time = '0';
            var ctime = '1';
            var area;
            var action;
            var currentTime = '0';
            var host="localhost:8084";
//            var host = "ssuio.idv.tw:58885";
            var roomId = "<%=m.getRoomId()%>";
            var memberName = "<%=m.getName()%>";
            function init() {
                var tag = document.createElement('script');
                tag.src = "https://www.youtube.com/iframe_api";
                var firstScriptTag = document.getElementsByTagName('script')[0];
                firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
                var player;

                document.getElementById("videoBar").addEventListener("click", pushVideoPlayOnBar);
                document.getElementById("searchVideo").addEventListener("click", searchResult);
                document.getElementById("play").addEventListener("click", play);
                document.getElementById("pause").addEventListener("click", pause);
                
                $('.stickers').on("click",pasteSticker);
                
                $('.stickers').mouseenter(handlerIn).mouseleave(handlerOut);
                
                
                
                jQuery('#searchList').css("overflow-y", "scroll");
                jQuery('#playlist').css("overflow-y", "scroll");
                jQuery('#talkFrame').css("overflow-y", "scroll");
                jQuery('#memberlist').css("overflow-y", "scroll");
                //jQuery('#sticker').css("overflow-y", "scroll");

                $('#sendText').keypress(function (e) {
                    if (e.which === 13) {
                        pushChat();
                    }
                });


                $(window).bind("beforeunload", function () {
                    $.ajax({
                        type: "POST",
                        url: "http://" + host + "/LetsWatchWeb/leaveRoom.do",
                        data: {
                            'roomId': roomId,
                            'memberId': '<%=m.getId()%>'
                        },
                        success: function (response) {
                            console.log(response);
                        },
                        error: function () {
                            console.log("ajax FAILED!");
                        }
                    });

                });


            }
            
            function handlerIn(){
                $(this).animate({
                        width: $(this).width() * 1.5,
                        height: $(this).height() * 1.5
                    });
            
            }
            function handlerOut(){
                $(this).animate({
                        width: 60,
                        height: 60
                    });
            
            }
            
            
            setTimeout(talkFrameDown, 3000);

        </script>
        <style>
            #talkFrame{
                float:left;
                margin:5px;
                width:350px;
                height: 225px;
            }
            #talkFrame img{
                width: 150px;
                height: 150px;
            }
            #pushChat{
                margin: 0px 0px 0px 0px;
                padding-top: 20px;
                flaot:left;
            }
            #sticker{
                float:left;
                width:70px;
                height:225px;
                margin:0px 0px 0px 10px;
                
            }
            #sendText{
                float:left;
                margin: 20px 20px 0px 20px;
            }
            .stickers{
                width:60px;
                height:60px;
            }
        </style>
    </head>

    <body>
        <!--header-->
        <jsp:include page="/WEB-INF/subview/header.jsp">
            <jsp:param name="sub_title" value="哈囉!P"/>
        </jsp:include>


        <div class="myroom">
            <div class="wrapper">
                <div id="contentDiv">
                    <h1><%=r.getRoomName()%></h1>
                    
                    <div id="player"></div><!--影片播放位置-->

                    <div id="playlist"></div>
                    <div id="memberlist"></div>
                    <div id="talkFrame">ChatRoom<br></div>
                    <div id="sticker">
                        <% 
                            StickersDAO sDAO = new StickersDAO();
                            List<Integer> nList = sDAO.getStickerNumber(m.getId());
                            if(nList!=null){
                                for(Integer n :nList){
                                    switch (n){
                                        case 1:
                        %>
                        <img src="http://localhost:8084/LetsWatchWeb/sticker.pic?get=1" class="stickers">
                        <%
                                            break;
                                        case 2:
                        %>
                        <img src="http://localhost:8084/LetsWatchWeb/sticker.pic?get=2" class="stickers">
                        <%                  
                                            break;
                                        case 3:
                        %>
                        <img src="http://localhost:8084/LetsWatchWeb/sticker.pic?get=3" class="stickers">
                        <%                   
                                            break;
                                    }
                                
                                }
                            }%>
                    </div>
                    <input type="text" id="sendText"/>
                    
                    <button id="pushChat" >Enter</button> 
                    <div class="clearfix"></div>
                    <button id="play" >play</button>
                    <button id="pause" >stop</button>


                    <!--  
                          <button id="pullChat" >pullChat</button>
                    <button id="pullPlayList" >pullPlayList</button>
                       <button id="pushVideoPlayOnBar" >pushVideoPlayOnBar</button>
                       <button id="pushPlayOnSearch" >pushPlayOnSearch</button>
                       <button id="pushVideoStop" >pushVideoStop</button>
                       <button id="PullToPlay" >PullToPlay</button>
                       <button id="getTime" >getTime</button>-->
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