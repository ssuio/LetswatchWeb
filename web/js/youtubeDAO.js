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
            document.getElementById("videoBar").value= final;
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

function syncRangeWithVideo(){
            var duration = player.getDuration();
            var now = player.getCurrentTime()+1;
            var final = now/duration*1000;
            document.getElementById("videoBar").value= final;
        }
        
function playAt(){
    var afterClick = document.getElementById("videoBar").value;
    var duration = player.getDuration();
    var final = afterClick*duration/1000;
    var playnow = player.getCurrentTime();
    player.seekTo(final);
}


