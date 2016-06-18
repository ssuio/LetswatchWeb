function pulltoPlayList(response){
            if(response.time!=="same"){
                console.log("Doing pull lists...");
                    time=response.time;
                $('.playListDiv').remove();
                var length = $(response.videos).length;
                for(i=0;i<length;i++){
                    var videoDiv = document.createElement('div');
                    videoDiv.className = 'playListDiv';
                    var videoImg = document.createElement('img');
                    videoImg.src = response.videos[i].videoImg;
                    videoDiv.appendChild(videoImg);
                    var videoTitle = document.createElement('p');
                    t = response.videos[i].videoTitle;
                    videoTitle.appendChild(document.createTextNode(t));
                    videoDiv.appendChild(videoTitle);
                    var videoTime = document.createElement('p');
                    t = response.videos[i].videoTime;
                    videoTime.appendChild(document.createTextNode(t));
                    videoDiv.appendChild(videoTime); 
                    videoDiv.setAttribute("data-videoId", response.videos[i].videoId);
                    var videoRemove = document.createElement('BUTTON');
                    var t = document.createTextNode('Remove');
                    videoRemove.appendChild(t);
                    videoRemove.className= 'searchRemove';
                    videoDiv.appendChild(videoRemove);
                    document.getElementById('playlist').appendChild(videoDiv);
                }
                $('.searchRemove').on("click",removeFromPlayList);
                $('.playListDiv').on("click",playlist);
            }
            console.log("time is the same, didn't do anything");
        }
        
        function pushPlayList(){
        videoId = [];
        videoTitle = [];
        videoTime = [];
        videoImg = [];
        var what = $('.playListDiv').each(function(){
            videoId.push($(this).attr('data-videoId'));
            videoTitle.push($(this).find('p').first().text());
            videoTime.push($(this).find('p').last().text());
            videoImg.push($(this).find('img').attr('src'));
        });
        
        time = Date.now();
        
        pushPlaylistObj = {
           'videoId': videoId,
           'videoTitle': videoTitle,
           'videoTime': videoTime,
           'videoImg': videoImg,
           'action': 'push',
           'time' : time
        };
        
        console.log (pushPlaylistObj);
        
        $.ajax({
            type:"POST",
            url: "http://localhost:8084/LetsWatchWeb/playlist.do",
            data: pushPlaylistObj,
            success:function(response){
                console.log(response);
            }
        });
}

function pullPlayList(e){
            
            $.ajax({
            type:"POST",
            url: "http://localhost:8084/LetsWatchWeb/playlist.do",
            data: {'action':'pull',
                   'time': time
            },
            success:pulltoPlayList,
            error: function(){
                console.log("ajax FAILED!");
            }
            
        });
    }
