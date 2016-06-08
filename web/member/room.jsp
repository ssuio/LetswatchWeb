<%-- 
    Document   : room
    Created on : 2016/6/8, 上午 11:12:17
    Author     : adm
--%>

<%@page import="lw.model.RoomDAO"%>
<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your room!</h1>
        
        <% 
            Member m = (Member)session.getAttribute("member");
        %>
        <p>
           Member : <%=m%>
        </p>
        <p>
           Room : <%
               String roomId = (String)session.getAttribute("roomId");
               RoomDAO dao = new RoomDAO();
           %>
           <%=dao.getOneById(roomId)%>
        </p>
    </body>
</html>
