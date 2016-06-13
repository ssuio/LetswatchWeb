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
            Member m = (Member)session.getAttribute("member");
            RoomDAO dao = new RoomDAO();
            String roomId = m.getRoomId();
            Room r = dao.getOneById(roomId);
            RoomMemberListDAO rmlDAO = new RoomMemberListDAO();
            PlayListDAO pDAO = new PlayListDAO();
            List<String> pList = pDAO.getOneById(roomId);
            List<Member> mList = rmlDAO.getOneById(roomId);
            //Check the room is exist or redirect to room_search page
            if (r.getRoomId() == null){
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
        margin:2% 0% 2% 5%;
        float: left;
        width:15%;
        height: 300px;
        background: antiquewhite;
    }
     #playlist{
        margin:2% 0% 2% 5%;
        float: left;
        width:15%;
        height: 300px;
        background: antiquewhite;
    }
    
    #playlist li{
        background:darkred;
        margin:5px;
        color:bisque;
        font-size: 1.5em;
        
    }
    div{
        height: 1000px;
    }
    
    #seach_engine{
        float: left;
        width:20%;
        height: 300px;
        background: activecaption;
    }
</style>

<script>
      window.onload=function(){
                  document.getElementById('vid').addEventListener('loadedmetadata', function() {
                  this.currentTime = 10;
            }, false  );

       };             
     </script>
<div>
        <h1><%=r.getRoomName()%></h1>
        
        
<!--        <video width="600" id="vid" autoplay>
            <source src ="http://www.youtube.com/watch?v=nTkdj7XBD8A" type="video/youtube">
            Your browser doesn't support HTML5 video.
            
        </video>-->
<iframe width="420" height="315"
src="http://www.youtube.com/embed/nTkdj7XBD8A?autoplay=1">
</iframe>
        
        <div id="memberlist">
            <h1>Member List</h1>
            <ul>
                <% for(Member mTmp: mList){%>
                <li><%=mTmp.getName()%></li>
                <%}%>
            </ul>
        </div>
            
        <div id="playlist">
            <h1>Play List</h1>
             <ul>
                <% for(String video: pList){%>
                <li><%=video%></li>
                <%}%>
            </ul>
        </div>
        
        <div id="seach_engine">
            <h1>Search Engine</h1>
        </div>
</div>
    <%@include file="/WEB-INF/subview/footer.jsp"%>
