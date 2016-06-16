function searchYoutube(){
    //alert(document.getElementById('searchKey').value);
    var q = document.getElementById('searchKey').value;
    var url = 'https://www.googleapis.com/youtube/v3/search?relevanceLanguage=zh-TW&part=snippet&maxResults=3&key=AIzaSyCwiaBKKfW6T-4dousuknjKMglL9ES-sxA&q='+q;
    var searchStr;
    alert(url);
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'html',
        global: false,
        async:false,
        success: getData
      }).responseText;
                      
        function getData(data){
            searchStr = data;
        }       
          
     var searchObj = JSON.parse(searchStr);
     console.log(searchStr);
//     console.log(searchObj);
     var videosId=[];
     
     for(i=0; i<3; i++){
         videosId.push(searchObj.items[i].id.videoId);
     }
     console.log(videosId);
     return videosId;
}


