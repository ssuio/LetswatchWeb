<%-- 
    Document   : el
    Created on : 2016/6/3, 下午 04:02:23
    Author     : adm
--%>

<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                font-size: 1.2em;
                
            }
        </style>
    </head>
    <body>
        <h2>appicastion scope</h2>
        <p>Visitors Count: ${applicationScope["lw.app.visitors.count"]}</p>
        <h1>session scope</h1>
        <p>使用者: <%=session.getAttribute("member")!=null?((Member)session.getAttribute("member")).getEmail():""%></p>
        <p>el使用者: ${sessionScope.member.email}</p>
        <h1>session scope</h1>
        <h1>Header</h1>
        <p>user-agent: <%=request.getHeader("user-agent")%></p>
        <p>user-agent: ${header["user-agent"]}</p>
        
        <h2>Cookie</h2>
        <p>cookie:  ${cookie.email.value}</p>
        
        
        <h2>PageContext</h2>
        <p>session id : <%=pageContext.getSession().getId()%></p>
        <p>session id : ${pageContext.session.id}</p>
        
        
    </body>
</html>
