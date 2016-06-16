

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
        }
        #videoBar{
        width: 100%;
        background: #ecf0f1;
        border: 1px solid #bdc3c7;
/*        //width: 20px;*/
        height: 20px;
        border-radius: 10px;
        cursor: pointer;
        }
    </style>
    <script src="../js/search.js" type="text/javascript"></script>
    <script src="../js/youtubeDAO.js" type="text/javascript"></script>
    <body>
        <!--<script>-->
            
            
        <!--</script>-->
        <!--<iframe id="player" src="https://www.youtube.com/embed/j68LY3fKbrg?enablejsapi=1" width="560" height="315" ></iframe>-->
        <div id="player"></div>
        <script>
        window.addEventListener("load",init);
        function init(){
            document.getElementById("videoBar").addEventListener("click",playAt);
            document.getElementById("searchVideo").addEventListener("click",searchYoutube);
            var q='cat mouse';
//            console.log(searchYoutube(q));
        }
        
        setInterval(syncRangeWithVideo,500);
         
          
        </script>
        <div id="info"></div>
        <h1>Hello World!</h1>
        <input type="text" id="searchKey"/>
        <button id="searchVideo">search</button>
        <input type="range" min="0" max="1000" id="videoBar">
    </body>
</html>
