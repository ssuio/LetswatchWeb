<%@page contentType="text/html" pageEncoding="UTF-8" import="lw.domain.Member"%>
<!DOCTYPE html>
<%-- Comments--%>
<!-- saved from url=(0043)http://localhost:8084/LetsWatchWeb/login.do -->

<html>
    
    <head>
        <style>
    /*cc*/
    
</style>
<title>Login Successful!!!</title>
</head>
<body>
<h1>Login Successful!!!</h1>
<h1>Hi, <% 
        Member m = (Member)session.getAttribute("member");
        out.print(m.getName());
        %></h1>
        <form action="/LetsWatchWeb">
            <input type="submit" value="Home">
        </form>

</html>