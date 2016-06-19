function pulltoPlayList(response){
            if(response.time!=="same"){
                console.log("Doing pull lists...");
                    playListTime=response.time;
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
            console.log("PlayListTime is the same, didn't do anything");
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
        
        playListTime = Date.now();
        
        pushPlaylistObj = {
           'videoId': videoId,
           'videoTitle': videoTitle,
           'videoTime': videoTime,
           'videoImg': videoImg,
           'action': 'push',
           'time' : playListTime
        };
        
        console.log (pushPlaylistObj);
        
        $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/playlist.do",
            data: pushPlaylistObj,
            success:function(response){
                console.log(response);
            }
        });
}

function pullPlayList(e){
            
            $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/playlist.do",
            data: {'action':'pull',
                   'time': playListTime
            },
            success:pulltoPlayList,
            error: function(){
                console.log("ajax FAILED!");
            }
            
        });
    }

function pullMemberList(){
            
            $.ajax({
            type:"POST",
            url: "http://"+host+"/LetsWatchWeb/memberList.do",
            success:pullToMemberList,
            error: function(){
                console.log("ajax FAILED!");
            }
            
        });
    }
    
    function pullToMemberList(response){
        var length = $(response.member).length;
        $('.member').remove();
        for(i=0; i<length;i++){
            var name = response.member[i].name;
            var nameP = document.createElement("p");
            nameP.className="member";
            var t = document.createTextNode(name);
            nameP.appendChild(t);
            $('#memberlist').append(nameP);
        }
        
    }

