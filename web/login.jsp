<%@page import="lw.domain.Member"%>
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
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/indexLayout.css" rel="stylesheet" type="text/css">
        <style>
            div{
                widtch:100%;
                
            }    
        </style>
        <script>
            function refreshHandler(){
                var check_img = document.getElementById("check_code_image");
                check_img.src="Image/check.jpg?get=" + new Date();
            }
        </script>
    </head>
    
        <div id="navigatorDiv">
            
        </div>
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
            
        <form method="POST" action="login.do">
            <p>
            <label for="email">E-mail:</label>
            <input type="text" id="userid" name="email" placeholder="輸入信箱" value="">
            </p>
            <p>
            <label for="password">Password:</label>
            <input type="password" id="pwd" name="password" placeholder="輸入密碼">        
            </p>
            <p>
            <label for="checkBox">Check Code:</label>
            <input type="text" id="checkCode" name="checkCode" placeholder="輸入驗證碼">        
            </p>
            <p>
            <img src="Image/check.jpg" id="check_code_image">
            <input type="button" onclick="refreshHandler()" value="refresh">
            </p>
            <p>
               <input type="submit" value="Confirm">
            </p>
        </form>
            <p>
                <%out.println(request.getAttribute("email")==null?"111":request.getAttribute("email"));%>
            </p>
</html>
