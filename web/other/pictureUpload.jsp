<%-- 
    Document   : pictureUpload
    Created on : 2016/6/23, 下午 03:53:35
    Author     : adm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
        <script>
            //$.(document)
            
        </script>
    </head>
    <body>
        <form action="/LetsWatchWeb/upload.pic" method="post" enctype="multipart/form-data">
            <input type="file" name="photo" accept="Image/*"/><br>
            <input type="submit" value="Upload" name="upload"/>
        </form>
    </body>
</html>
