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
        <style>
            span{
                margin:5px;
            }
        </style>
        <script>
            $(document).ready(init);
            function init(){
                $("#push").on("click",pushChat);
                $("#pull").on("click",pullChat);
            }
            
            var ctime = '1';
            var host = 'localhost:8084';
            
            function pushChat(){
                ctime = Date.now();
                var msg = $('#sendText').val();
                
                $.ajax({
                    type:"POST",
                    url: "http://"+host+"/LetsWatchWeb/chat.do",
                    data: {
                           'action': 'push',
                           'time': ctime,
                           'msg':msg
                           
                    },
                    success:function(response){
                            $('span').remove();
                                for(i=0; i< $(response.talk).length;i++){
                                    $('#talkFrame').after('<span>'+ response.talk[i].time +'</sapn>'+'<span>'+ response.talk[i].name +'</sapn>'+'<span>'+ response.talk[i].msg +'</sapn>'+'<br>');
                                }            
                    },
                    error: function(){
                        console.log("ajax FAILED!");
                    }
               });
               
               $('#senText').val("");
            }
            
            
            function pullChat(){
                $.ajax({
                    type:"POST",
                    url: "http://"+host+"/LetsWatchWeb/chat.do",
                    data: {
                           'action': 'pull',
                           'time': ctime
                           
                    },
                    success:function(response){
                           
                           console.log(response);
                           console.log('serTime:'+response.serTime);
                           if(response.time!=='same'){
                                $('span').remove();
                                ctime = response.serTime;
                                
                                for(i=0; i< $(response.talk).length;i++){
                                    $('#talkFrame').after('<span>'+ response.talk[i].time +'</sapn>'+'<span>'+ response.talk[i].name +'</sapn>'+'<span>'+ response.talk[i].msg +'</sapn>'+'<br>');
                                }
                        }else{
                            
                        }
                    },
                    error: function(){
                        console.log("ajax FAILED!");
                    }
               });
            }
            
            
//            setInterval(pullHandler,500);
            
            
        </script>
    </head>
    <body>
        <div id="talkFrame">
            
            
            <input type="text" id="sendText"/>
            <button id="push">push</button>
            <button id="pull">pull</button>
            <button id="test">test</button>
        </div>
    </body>
</html>
