<%-- 
    Document   : chatRoom
    Created on : 2016/6/23, 上午 09:45:47
    Author     : adm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="/LetsWatchWeb/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script>
            $(document).ready(init);
            function init(){
                $("#push").on("click",pushHandler);
                $("#pull").on("click",pullHandler);
                $("#test").on("click",testHandler);
            }
            
            var time = '1';
            var host = 'localhost:8084';
            
            function pushHandler(){
                time = Date.now();
                var msg = $('#sendText').val();
                
                $.ajax({
                    type:"POST",
                    url: "http://"+host+"/LetsWatchWeb/chat.do",
                    data: {
                           'action': 'push',
                           'time': time,
                           'msg':msg
                           
                    },
                    success:function(response){
                            console.log(response);
                    },
                    error: function(){
                        console.log("ajax FAILED!");
                    }
               });
               
               $('#senText').val("");
            }
            
            
            function pullHandler(){
                $.ajax({
                    type:"POST",
                    url: "http://"+host+"/LetsWatchWeb/chat.do",
                    data: {
                           'action': 'pull',
                           'time': time
                           
                    },
                    success:function(response){
                           console.log(response);
                           console.log('serTime:'+response.serTime);
                           if(response.time!=='same'){
                                time = response.serTime;
                        }else{
                            
                        }
                    },
                    error: function(){
                        console.log("ajax FAILED!");
                    }
               });
            }
            
            function testHandler(){
                console.log(time);
            }
            
        </script>
    </head>
    <body>
        <div>
            
            
            <input type="text" id="sendText"/>
            <button id="push">push</button>
            <button id="pull">pull</button>
            <button id="test">test</button>
        </div>
    </body>
</html>
