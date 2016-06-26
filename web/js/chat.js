function pushChat(){
    ctime = Date.now();
    var msg = $('#sendText').val();

    $.ajax({
        type:"POST",
        url: "http://"+host+"/LetsWatchWeb/chat.do",
        data: {
                'roomId':roomId,
                'memberName':memberName,
               'action': 'push',
               'time': ctime,
               'msg':msg

        },
        success:function(response){
                $('span').remove();
                    for(i=0; i< $(response.talk).length;i++){
                        $('#talkFrame').append('<span>'+ response.talk[i].name + ":>" +'</sapn>'+'<span>'+ response.talk[i].msg +'</sapn>'+'<br>');
                    }       
                $('#talkFrame').scrollTop($('#talkFrame').prop("scrollHeight"));
        },
        error: function(){
            console.log("ajax FAILED!");
        }
   });
   
   $('#sendText').val("");
}
            
            
function pullChat(){
    $.ajax({
        type:"POST",
        url: "http://"+host+"/LetsWatchWeb/chat.do",
        data: {
                'roomId':roomId,
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
                        $('#talkFrame').append('<span>'+ response.talk[i].name+ ":>" +'</sapn>'+'<span>'+ response.talk[i].msg +'</sapn>'+'<br>');
                    }
            }else{

            }
        },
        error: function(){
            console.log("ajax FAILED!");
        }
   });
}

function talkFrameDown(){
    $('#talkFrame').scrollTop($('#talkFrame').prop("scrollHeight"));
}
