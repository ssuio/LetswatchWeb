<%@page import="lw.model.RoomDAO"%>
<%@page import="lw.domain.Member"%>
<%@page  pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
<div>
        <h1>Your room!</h1>
        
        <% 
            Member m = (Member)session.getAttribute("member");
        %>
        <p>
           Member : <%=m%>
        </p>
        <p>
           Room : <%
               String roomId = m.getRoomId();
               RoomDAO dao = new RoomDAO();
           %>
           <%=dao.getOneById(roomId)%>
        </p>
</div>
    <%@include file="/WEB-INF/subview/footer.jsp"%>
