

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
        
    </head>
    <body>
        <iframe id="player" src="https://www.youtube.com/embed/j68LY3fKbrg?enablejsapi=1" width="560" height="315" ></iframe>
        <!--<div id="player"></div>-->
        <script>
                    
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
        
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
          height: '390',
          width: '640',
          videoId: 'G4UYRvIL7Fw',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
        }
        
        function onPlayerReady(e){
            e.target.playVideo();
        }
        
        function onPlayerStateChange(e){
            switch (e.data) {
                case YT.PlayerState.UNSTARTED:
                  console.log('unstarted');
                  break;
                case YT.PlayerState.ENDED:
                  console.log('ended');
                  break;
                case YT.PlayerState.PLAYING:
                  console.log('playing on: ' + player.getCurrentTime() );
                  break;
                case YT.PlayerState.PAUSED:
                  console.log('paused'  + player.getCurrentTime());
                  break;
                case YT.PlayerState.BUFFERING:
                  console.log('buffering');
                  break;
                case YT.PlayerState.CUED:
                  console.log('video cued');
                  break;
              }
        }
        </script>
        <h1>Hello World!</h1>
    </body>
</html>
