

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
/*        //width: 20px;*/
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
            document.getElementById("play").addEventListener("click", player.play);
            document.getElementById("stop").addEventListener("click", removeHandler);
            
        }
        
        setInterval(syncRangeWithVideo,500);
         
         function playByClickDiv(){
             var videoId = $(this).attr('data-videoId');
             player.cueVideoById(videoId,0,'default').playVideo();
             
         }
         
         function removeHandler(){
             
         }
         
         function searchResult(){
             searchYoutube();
             createSearchList();
             
         }
         
        function createHandler(){
            createSearchList();
            alert(0);
        }
          
          
    
          
        </script>
        <button id="play">play</button>
        <button id="stop">stop</button>
        <input type="range" min="0" max="1000" id="videoBar">
        <h1>Search Here</h1>
        <input type="text" id="searchKey"/>
        <button id="searchVideo">search</button>
        
        
        
        <div id="searchList"></div>
    </body>
</html>
