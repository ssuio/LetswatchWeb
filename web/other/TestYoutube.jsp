

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>-->
        <script src="../js/jquery-3.0.0.min.js" type="text/javascript"></script>
    </head>
    <style>
        body{
            background:black;
            color:white;
        }
        #videoBar{
        width: 100%;
        background: #ecf0f1;
        border: 1px solid #bdc3c7;
        height: 20px;
        border-radius: 10px;
        cursor : pointer;
        }
        
        .searchVideo{
            cursor: pointer;
        }
        
    </style>
    <body>
        <div id="player"></div>
        <script>
        window.addEventListener("load",init);
        var resultObj;
        function init(){
            
            document.getElementById("play").addEventListener("click", play);
            
        }
        
        
        
        function play(){
            
             $.ajax({
            type:"POST",
            url: "http://192.168.0.155:8084/LetsWatchWeb/json.do",
            data:{"name":"hello!"},
            crossDomain:true,
            success:function(response){
                console.log(response);
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
        }
//        setInterval(syncRangeWithVideo,500);
        </script>
        <button id="play" >play</button>
        <button id="stop" >stop</button>
        <button id="pause" >pause</button>
        <input type="range" min="0" max="1000" id="videoBar">
        <h1>Search Here</h1>
        <input type="text" id="searchKey"/>
        <button id="searchVideo">search</button>
        <div id="searchList"></div>
    </body>
</html>
