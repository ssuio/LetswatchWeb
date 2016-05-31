<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>LW註冊</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
        function refreshHandler(){
                var check_img = document.getElementById("check_code_image");
                check_img.src="Image/check.jpg?get=" + new Date();
            }
        
        </script>
    </head>
    <body>
        <form method="POST" action="register.do">
        
            <p>
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
            <img src="Image/check.jpg" id="check_code_image">
            <input type="button" onclick="refreshHandler()" value="refresh">
            </p>
             <p>
               <input type="submit" value="Confirm">
            </p>
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
        </form>
    </body>
</html>
