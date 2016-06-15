<%-- 
    Document   : TestYoutubeSearch
    Created on : 2016/6/15, 下午 04:03:50
    Author     : adm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>Search</title>
  </head>
  <body>
    <div id="buttons">
      <label> <input id="query" value='cats' type="text"/><button id="search-button" disabled onclick="search()">Search</button></label>
    </div>
    <div id="search-container">
    </div>
      <script src="search.js" type="text/javascript"></script>
      <script src="auth.js" type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
  </body>
</html>
