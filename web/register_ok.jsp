<%-- 
    Document   : register_ok
    Created on : 2016/5/31, 下午 12:18:04
    Author     : adm
--%>

<%@page import="java.util.List"%>
<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <style>
    /*cc*/
    
</style>
<title>Register Successful!!!</title>
</head>
<body>
<h1>Register Successful!!!</h1>
<h1>Hi, ${requestScope.member.name}</h1>
<%
            List<String> errors = (List<String>)request.getAttribute("errors");
            if(errors!=null && errors.size()>0){
         
        %>
            <ul>
                <% for (String msg: errors){%>
            <li><%=msg%></li>
            <%}%>
             
            </ul>
            <%}%> 
            <form action="/LetsWatchWeb">
            <input type="submit" value="Home">
            </form>

</html>