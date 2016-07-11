<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
        <style>
            #register{
                width:100%;
                height:600px;
            }
            #register_form{
                margin:auto;
                padding:5%;
            }
            legend {
                font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
                font-size: 2em;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                line-height: 26.4px;
                background:#fff;
            }
            fieldset {
                margin:auto;
                width:500px;
                height: 450px;
                border:1px solid #999;
                border-radius:20px;
                box-shadow:0 0 10px #999;
            }
            form img{
                width:100px;
                height:30px;
            }
            fieldset p{
                margin:10px 0px 10px 30px;
                font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
                font-size: 1.2em;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                width:100%;
                float:left;
            }

            input[type=submit]{
                font-size: 1.2em;
                margin:0px 60px 0px 0px;
                float:right;
                float:bottom;
                width: 30%;
                height:50px;
            }

            #confirm_submit {
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
            #confirm_submit :hover {
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
                background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
                background-color:#e9e9e9;
            }
            #confirm_submit :active {
                position:relative;
                top:1px;
            }
            
            input[type=text],input[type=password] { 
                font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
                font-size: 1em;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                line-height: 26.4px;
                background: white; 
                border: 1px solid #DDD; 
                border-radius: 5px; 
                box-shadow: 0 0 5px #DDD inset; 
                color: #666; 
                outline: none; 
                height:30px; 
                width: 50%;
                margin:auto;
            } 

        </style>

        <meta charset="utf-8">
        <title>會員註冊</title>

    </head>
    <body>
        <script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
        <script>
            $(document).ready(init);
            function init() {
                $('#refresh').on("click", refreshHandler);

            }
            function refreshHandler() {
                var check_img = document.getElementById("check_code_image");
                check_img.src = "/LetsWatchWeb/Image/check.jpg?get=" + new Date();
            }
        </script>
        <jsp:include page="/WEB-INF/subview/header.jsp">
            <jsp:param name="sub_title" value="<%= this.getServletInfo()%>"/>
        </jsp:include>
        <div id="register">
        <form method="POST" action="/LetsWatchWeb/register.do" id="register_form">
            <fieldset>
                <legend>Register</legend>
                <p><br>
                    <label for="email">E-mail:</label>
                    <input type="text" id="userid" name="uid" placeholder="輸入信箱" required>
                </p>
                <p>
                    <label for="email">Name:</label>
                    <input type="text" id="name" name="name" placeholder="輸入名稱" required>
                </p>
                <p>
                    <label for="password">Password:</label>
                    <input type="password" id="pwd" name="password1" placeholder="輸入密碼" required>        
                </p>
                <p>
                    <label for="password">Password Again:</label>
                    <input type="password" id="pwd" name="password2" placeholder="輸入密碼" required>        
                </p>
                <p>
                    <label for="checkBox">Check Code:</label>
                    <input type="text" id="checkCode" name="checkCode" placeholder="輸入驗證碼" required> 
                </p>
                <p>
                    <img src="/LetsWatchWeb/Image/check.jpg" id="check_code_image">
                    <input type="button" value="refresh" id="refresh">
                </p>
                <p>
                    <input type="submit" value="Register" id="confirm_submit">
                </p>
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
        </form>
    </fieldset>
        </div>
    <%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>
