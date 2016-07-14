<%-- 
    Document   : register_ok
    Created on : 2016/5/31, 下午 12:18:04
    Author     : adm
--%>

<%@page import="lw.model.StickersDAO"%>
<%@page import="java.util.List"%>
<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>會員登入</title>
        <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
        <style>
            #register_ok_content{
                
                width:100%;
                height:600px;
            }
            h1 {
                float:left;
                padding:15% 0% 0% 30%;
            }

            button {
                float:left;
                margin:330px 0px 0px 0px;
                -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
                box-shadow:inset 0px 1px 0px 0px #ffffff;
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
                background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
                background-color:#f9f9f9;
                -moz-border-radius:6px;
                -webkit-border-radius:6px;
                border-radius:6px;
                border:1px solid #dcdcdc;
                display:inline-block;
                cursor:pointer;
                color:#666666;
                font-family:Arial;
                font-size:1.2em;
                font-weight:bold;
                padding:6px 24px;
                text-decoration:none;
                text-shadow:0px 1px 0px #ffffff;
            }
            button :hover {
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
                background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
                background-color:#e9e9e9;
            }
            button :active {
                position:relative;
                top:1px;
            }
        </style>\
        
    </head>
    <body>

        <!--header-->
        <jsp:include page="/WEB-INF/subview/header.jsp">
            <jsp:param name="sub_title" value="<%= this.getServletInfo()%>"/>
        </jsp:include>
        <div id="register_ok_content">
            <h1>Register Successful. Please Login</h1>
            <a href="member/login.jsp"><button>Login</button></a>
            <%
                List<String> errors = (List<String>) request.getAttribute("errors");
                if (errors != null && errors.size() > 0) {

            %>
            <ul>
                <% for (String msg : errors) {%>
                <li><%=msg%></li>
                    <%}%>

            </ul>
            <%}%> 
        </div>
        <%@include file="/WEB-INF/subview/footer.jsp"%>
    </body>
</html>