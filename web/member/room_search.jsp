<%@page import="lw.domain.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lw.model.RoomDAO"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
<style>
    p{
        margin:50px 0px 0px 100px;
    }
</style>
<div>        
    <h1>Rooms Search</h1>
    <%RoomDAO dao = new RoomDAO();
    List<Room> rooms = new ArrayList<Room>();
            rooms = dao.getAll();
    for(Room r:rooms){%>
    <a href="/LetsWatchWeb/<%=r.getRoomId()%>.room"><p><%=r.getRoomName()%></p><br></a>
    <%}%>
        
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
