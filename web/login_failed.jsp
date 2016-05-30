<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0043)http://localhost:8084/LetsWatchWeb/login.do -->
<html><head>
<title>Login Failed!!!</title>
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style></head>
<body>
<h1>Login Failed!!!</h1>
<%
    List<String> errors = (List<String>)request.getAttribute("errors");
    out.println(errors); 
%>


</body>
</html>