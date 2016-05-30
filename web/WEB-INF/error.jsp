<%-- 
    Document   : error
    Created on : 2016/5/30, 下午 04:54:07
    Author     : adm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>系統發生錯誤:<%= exception%><%=100/0%></h1>
    </body>
</html>
