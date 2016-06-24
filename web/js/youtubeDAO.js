       
        
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '600',
                width: '800',
                videoId: 'j68LY3fKbrg',
                events: {
                  'onReady': onPlayerReady,
                  'onStateChange': onPlayerStateChange
                },
                playerVars: { 
               'autoplay': 0,
               'controls': 0,
               'rel': 0
                }
            });
        }
        
        function onPlayerReady(e){
            //e.target.playVideo();
//            var duration = player.getDuration();
//            var now = player.getCurrentTime()+1;
//            var final = now/duration*1000;
//            document.getElementById("videoBar").value= final;
            
            setInterval(PullToPlay, 1000);
            setInterval(pullMemberList, 3000);
            setInterval(pullPlayList, 1000);
            setInterval(syncRangeWithVideo, 500);
            setInterval(pullChat, 500);
            
        }
        
        function onPlayerStateChange(e){
            switch (e.data) {
                case YT.PlayerState.UNSTARTED:
                  console.log('unstarted');
                  break;
                case YT.PlayerState.ENDED:
                        var nowVideo = $(".playing");
                    if($('.playListDiv').hasClass('playing')){
                        var nextVideo = nowVideo.next();
                        $('#playlist div').attr("class","playListDiv");
                        nextVideo.addClass("playing");
                        var nextVideoId = nextVideo.attr('data-videoId');
                        player.cueVideoById(nextVideoId,0,'default').playVideo();
                    }
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
    //var playnow = player.getCurrentTime();
    player.seekTo(final);
    
}

function play(){
           player.playVideo();
 }
       function stop(){
           player.stopVideo();
 }
          
function pause(){
    player.pauseVideo();

}

function searchResult(){
             searchYoutube();
             createSearchList();
             
         }
         
function playByClickDiv(){
    $('#playlist div').attr("class","playListDiv");
    var videoId = $(this).attr('data-videoId');
    player.cueVideoById(videoId,0,'default').playVideo();
    pushPlayOnSearch(videoId);
}

