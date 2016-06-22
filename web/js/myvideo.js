
   
    
    function getTime(){
        console.log("roomId: "+ roomId);
        console.log("action: "+action);
        console.log("currentTime: "+currentTime);
        console.log("area: "+area);
        console.log("videoId: "+ gVideoId);
        console.log("time: "+time);
    }

    
    
    

function PullToPlay(){
    
    $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            
            data:{
                'roomId': roomId,
                'remote': 'pull',
                'time':time
            },
            success:function(response){
                if(response.time!=="same"){
                    gVideoId = response.videoId;
                    area =response.area;
                    action =response.action;
                    currentTime =response.currentTime;
                    time = response.time;
                    
                    if(action==='stop'){
                        pause();

                    }else if(area==='play' && currentTime==='0' && action==='play'){
                        $('#playlist div').attr("class","playListDiv");
                        $('.playListDiv[data-videoid='+gVideoId+']').addClass("playing");
                        player.cueVideoById(gVideoId,0,'default').playVideo();
                    }else if(area==='search'&& currentTime==='0' && action==='play'){
                        $('#playlist div').attr("class","playListDiv");
                        player.cueVideoById(gVideoId,0,'default').playVideo();

                    }else{
                        player.cueVideoById(gVideoId,currentTime,'default').playVideo();

                    }
                }else{
                    console.log("Video Time is the same , didn't do anytime!");
                    
                    
                }
                
                
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
 
}


function pushPlayOnPlayList(videoId){
    area="play";
    action="play";
    time = Date.now();
//    videoId = player.getVideoData()['video_id'];
    gVideoId = videoId;
        $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': '0',
                   'videoId': videoId,
                   'time' : time
            },
            success:function(response){
                
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
}

function pushPlayOnSearch(videoId){
    area="search";
    action="play";
    time = Date.now();
//    videoId = player.getVideoData()['video_id'];
    gVideoId = videoId;
    
     $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': '0',
                   'videoId': gVideoId,
                   'time' : time
            },
            success:function(response){
                console.log(response);
                 
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
    
}

function pushVideoPlayOnBar(){
    var afterClick = document.getElementById("videoBar").value;
    var duration = player.getDuration();
    var final = afterClick*duration/1000;
    player.seekTo(final);
    currentTime = final;
    time = Date.now();
    action="play";
    $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': currentTime,
                   'videoId': gVideoId,
                   'time' : time
            },
            success:function(response){
            
            
            
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
}

function pushVideoStop(){
    action="stop";
     $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/syncVideo.do",
            data: {
                   'roomId': roomId,
                   'remote': 'push',
                   'action':action,
                   'area': area,
                   'currentTime': currentTime,
                   'videoId': gVideoId,
                   'time' : time
            },
            success:function(response){
                console.log(response);
            },
            error: function(){
                console.log("ajax FAILED!");
            }
    });
}
    

    
       
    
        
        
