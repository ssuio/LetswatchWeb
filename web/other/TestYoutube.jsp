

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
        #videoTime{
        width: 100%;
        background: #ecf0f1;
        border: 1px solid #bdc3c7;
/*        //width: 20px;*/
        height: 20px;
        border-radius: 10px;
        cursor: pointer;
        }
    </style>
    <body>
        <!--<script>-->
            
            
        <!--</script>-->
        <!--<iframe id="player" src="https://www.youtube.com/embed/j68LY3fKbrg?enablejsapi=1" width="560" height="315" ></iframe>-->
        <div id="player"></div>
        <script>
        window.addEventListener("load",init);
        function init(){
            document.getElementById("seek").addEventListener("click",clickHandler);
            document.getElementById("infobtn").addEventListener("click",infoHandler);
            //document.getElementById("syncTime").addEventListener("click",syncVideoTimeToRange);
            document.getElementById("videoTime").addEventListener("click",playAt);
        }
        
        var videoId = 'qFgy_21wQuE';
        var playTime=60;
        
        function syncRangeWithVideo(){
            var duration = player.getDuration();
            var now = player.getCurrentTime()+1;
            var final = now/duration*1000;
            document.getElementById("videoTime").value= final;
        }
        
        setInterval(syncRangeWithVideo,500);
        
        function playAt(){
            player.seekTo(60);
            
            var afterClick = document.getElementById("videoTime").value;
            var duration = player.getDuration();
            var final = afterClick*duration/1000;
            var playnow = player.getCurrentTime();
            
            //var final = Math.floor(playnow/duration*1000);
            //alert("playnow:" + playnow + " duration:" + duration + " final=" + final);
            //document.getElementById("videoTime").value=final;
            //alert(final);
            player.seekTo(final);
        }
        function timeHandler(e){
            var videoDuration = player.getDuration();
            var videoDuration = player.getDuration();
        }
        function infoHandler(){
            var durationTime = player.getDuration();
            document.getElementById('info').innerHTML=durationTime;
        }
        
        function syncPlay(videoId,playTime){
            player.cueVideoById(videoId,playTime,'default').playVideo();
        }
        
        function clickHandler(e){
            //player.seekTo(60, true);
            syncPlay(videoId,playTime);
        }
        
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
        
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
          height: '390',
          width: '640',
          videoId: 'j68LY3fKbrg',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          },
          playerVars: { 
         'autoplay': 1,
         'controls': 0,
         'rel': 0
          }
        });
        }
        
        function onPlayerReady(e){
            e.target.playVideo();
            var duration = player.getDuration();
            var now = player.getCurrentTime()+1;
            var final = now/duration*1000;
            document.getElementById("videoTime").value= final;
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
        <div id="info"></div>
        <h1>Hello World!</h1>
        <button id="seek">seek to 1min</button>
        <button id="infobtn">info</button>
        <button id="keep">keep</button>
        <button id="syncTime">sync</button>
        <input type="range" min="0" max="1000" id="videoTime">
    </body>
</html>
