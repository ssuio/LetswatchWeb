

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
            document.getElementById("create").addEventListener("click", createSearchList);
        }
        
        setInterval(syncRangeWithVideo,500);
         
         
         function searchResult(){
             searchYoutube();
             createSearchList();
             
         }
         
        function createHandler(){
            createSearchList();
            alert(0);
        }
          
          
    
          
        </script>
        
        <h1>Hello World!</h1>
        <input type="text" id="searchKey"/>
        <button id="searchVideo">search</button>
        <button id="create">Create Search List</button>
        <input type="range" min="0" max="1000" id="videoBar">
        <div id="searchList"></div>
    </body>
</html>
