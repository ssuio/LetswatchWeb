<%-- 
    Document   : createRoom
    Created on : 2016/6/8, 上午 11:10:07
    Author     : adm
--%>

<%@page import="lw.domain.Member"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
<% 
    Member m = (Member)session.getAttribute("member");
    if (m == null)
        response.sendRedirect("/LetsWatchWeb/member/login.jsp");%>

<style>
    form{
        width:100%;
        height: 600px;
        font-size: 1.5em;
    }
    form p{
        margin:5px;
    }
</style>
        <h1>Create Room</h1>
        <form method="POST" action="/LetsWatchWeb/roomCreate.do">
            <p>
            <label for="email">Room Name:</label>
            <input type="text" id="roomName" name="roomName" placeholder="輸入房間名稱" required>
            </p>
            <p>
            <label for="email">Room Password:</label>
            <input type="password" id="roomPwd" name="roomPwd" placeholder="輸入房間密碼">
            </p>
            <p>
            <label for="email">Room Price:</label>
            <input type="text" id="roomPrice" name="roomPrice" placeholder="輸入房間價錢" value="0">
            </p>
            <p>
            <label for="email">Room Type:</label>
            <input type="text" id="roomType" name="roomType" placeholder="輸入房間類型" >
            </p>
            <p>
               <input type="submit" value="Create">
            </p>
        </form>
<%@include file="/WEB-INF/subview/footer.jsp"%>