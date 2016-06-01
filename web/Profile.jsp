<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link href="css/indexLayout.css" rel="stylesheet" type="text/css"/>
        <title>Profile</title>
        <style>
            #profileDiv{
                margin: 5px;
                
            }
            
            div p{
                font-size: 1.5em;
                padding:5px;
                
            }
            
        </style>
    </head>
    <body>
        <div id="profileDiv">
            <%Member m = (Member)session.getAttribute("member");%>
            <form method="POST">
            <ul>
                <li><img src="picture/ninja.png"></li>
            </ul>
            <p>
                Name: <%=m.getName()%>
            </p>
            <p>
                Gender: <%=m.getGender()%>
            </p>
            <p>
                E-mail: <%=m.getEmail()%>
            </p>
            <p>
                Birthday: <%=m.getBirthday()%>
            </p>
            <p>
                Phone: <%=m.getPhone()%>
            </p>
            <p>
                E-paper: <%=m.isEpaper()==true?"Yes":"No"%>
            </p>
            <p>
                Introduction: <%=m.getIntroduction()%>
            </p>
            </form>
            <form action="/LetsWatchWeb">
            <input type="submit" value="Home">
            </form>
        
        </div>
    </body>
</html>
