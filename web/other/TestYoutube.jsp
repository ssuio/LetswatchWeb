

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
        
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
    <script src="../js/search.js" type="text/javascript"></script>
    <script src="../js/youtubeDAO.js" type="text/javascript"></script>
    <body>
        <div id="player"></div>
        <script>
        window.addEventListener("load",init);
        var resultObj;
        function init(){
            
            document.getElementById("videoBar").addEventListener("click",playAt);
            document.getElementById("searchVideo").addEventListener("click",searchResult);
            document.getElementById("play").addEventListener("click", play);
            document.getElementById("stop").addEventListener("click", stop);
            document.getElementById("pause").addEventListener("click", pause);
            
        }
        
        setInterval(syncRangeWithVideo,500);
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
