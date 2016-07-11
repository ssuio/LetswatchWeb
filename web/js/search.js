function searchYoutube(){
    //alert(document.getElementById('searchKey').value);
    var q = document.getElementById('searchKey').value;
    var url = 'https://www.googleapis.com/youtube/v3/search?type=video&relevanceLanguage=zh-TW&part=snippet&maxResults=10&key=AIzaSyCwiaBKKfW6T-4dousuknjKMglL9ES-sxA&q='+q;
    var searchObj;
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        global: false,
        async:false,
        success: getData
      }).responseText;
                      
        function getData(data){
            searchObj = data;
        }       
          
//     console.log(searchStr);
//     console.log(searchObj);
     var videosId=[];
     var imgLinks=[];
     var videosTime=[];
     var videosTitle=[];
     for(i=0; i<10; i++){
         videosId.push(searchObj.items[i].id.videoId);
         imgLinks.push(searchObj.items[i].snippet.thumbnails.default.url);
         videosTime.push(searchObj.items[i].snippet.publishedAt);
         videosTitle.push(searchObj.items[i].snippet.title);
         var img = document.createElement("img");
         var imgLink = searchObj.items[i].snippet.thumbnails.default.url;
         img.src= imgLink;
//         document.getElementById('searchList').appendChild(img);
//         document.getElementById('searchList').innerHTML+=searchObj.items[i].snippet.title+ '<br>';
//         document.getElementById('searchList').innerHTML+=searchObj.items[i].snippet.publishedAt+ '<br>';
//         document.getElementById('searchList').innerHTML+=searchObj.items[i].id.videoId + '<br>';
//         document.getElementById('searchList').innerHTML+="<br>";
     }
     console.log(videosId);
     
     var videoInfo = {"videosId":videosId,"imgLinks":imgLinks,"videosTime":videosTime,"videosTitle":videosTitle};
//     alert(videoInfo);
//     console.log(videoInfo);
     resultObj = videoInfo;
     
     return videoInfo;
}


function createSearchList(){
            $('.searchVideo').remove();
            var t;
            console.log(resultObj);
            for (i=0;i<10;i++){
            var videoDiv = document.createElement('div');
            videoDiv.className = 'searchVideo';
            var videoImg = document.createElement('img');
            videoImg.src = resultObj.imgLinks[i];
            videoDiv.appendChild(videoImg);
            var videoTitle = document.createElement('p');
            t = resultObj.videosTitle[i];
            videoTitle.appendChild(document.createTextNode(t));
            videoDiv.appendChild(videoTitle);
//            var videoTime = document.createElement('p');
//            t = resultObj.videosTime[i];
//            videoTime.appendChild(document.createTextNode(t));
//            videoDiv.appendChild(videoTime); 
            videoDiv.setAttribute("data-videoId", resultObj.videosId[i]);
            var videoAdd = document.createElement('BUTTON');
            var t = document.createTextNode('Add To Playlist');
            videoAdd.appendChild(t);
            videoAdd.className= 'searchAdd';
            videoDiv.appendChild(videoAdd);
            document.getElementById('searchList').appendChild(videoDiv);
             }
             $('.searchVideo').on("click",playByClickDiv);
             
             $('.searchAdd').on("click",addToPlayList);
        }
        
        function addToPlayList(e){
            var playListvideo = $(this).closest("div").clone();
            var playListButton = $(playListvideo).find('button').html("Remove").attr("class","searchRemove");
            $(playListvideo).attr("class","playListDiv").appendTo('#playlist');
            $('.searchRemove').on("click",removeFromPlayList);
            $('.playListDiv').on("click",playlist).on("click",pushPlayOnPlayList);
            //alert();.clone().appendTo('#playlist')
//            document.getElementById('playlist').appendChild(playListDiv);
            pushPlayList();
            e.stopPropagation();
        }
        
        function removeFromPlayList(e){
            var playListVideDiv = $(this).closest("div").remove();
            pushPlayList();
            e.stopPropagation();
        }
        
        function playlist(){
            $('#playlist div').attr("class","playListDiv");
            var videoId = $(this).attr('data-videoId');
            player.cueVideoById(videoId,0,'default').playVideo();
            pushPlayOnPlayList(videoId);
            $('.playListDiv[data-videoid='+ videoId +']').addClass('playing');
            
        }
        
        
        
        