function pushChat() {
    ctime = Date.now();
    var msg = $('#sendText').val();

    $.ajax({
        type: "POST",
        url: "http://" + host + "/LetsWatchWeb/chat.do",
        data: {
            'roomId': roomId,
            'memberName': memberName,
            'action': 'push',
            'time': ctime,
            'msg': msg

        },
        success: function (response) {
            $('#talkFrame span').remove();
            for (i = 0; i < $(response.talk).length; i++) {
                var reg = '^http://.*';
                if ((response.talk[i].msg).match(reg))
                    $('#talkFrame').append('<br>'+'<span>' + response.talk[i].name + ":>" + '</sapn>' + '<img src="' + response.talk[i].msg + '">' + '<br>');
                else
                    $('#talkFrame').append('<span>' + response.talk[i].name + ":>" + '</sapn>' + '<span>' + response.talk[i].msg + '</sapn>' + '<br>');

            }
            $('#talkFrame').scrollTop($('#talkFrame').prop("scrollHeight"));
        },
        error: function () {
            console.log("ajax FAILED!");
        }
    });

    $('#sendText').val("");
}

function pasteSticker() {
    ctime = Date.now();
    var msg = $(this).attr('src');
    $.ajax({
        type: "POST",
        url: "http://" + host + "/LetsWatchWeb/chat.do",
        data: {
            'roomId': roomId,
            'memberName': memberName,
            'action': 'push',
            'time': ctime,
            'msg': msg

        },
        success: function (response) {
            $('#talkFrame span').remove();
            for (i = 0; i < $(response.talk).length; i++) {
                var reg = '^http://.*';
                if ((response.talk[i].msg).match(reg))
                    $('#talkFrame').append('<br>'+'<span>' + response.talk[i].name + ":>" + '</sapn>' + '<img src="' + response.talk[i].msg + '">' + '<br>');
                else
                    $('#talkFrame').append('<span>' + response.talk[i].name + ":>" + '</sapn>' + '<span>' + response.talk[i].msg + '</sapn>' + '<br>');

            }
            $('#talkFrame').scrollTop($('#talkFrame').prop("scrollHeight"));
        },
        error: function () {
            console.log("ajax FAILED!");
        }
    });

    $('#sendText').val("");
}

function pullChat() {
    $.ajax({
        type: "POST",
        url: "http://" + host + "/LetsWatchWeb/chat.do",
        data: {
            'roomId': roomId,
            'action': 'pull',
            'time': ctime

        },
        success: function (response) {

            console.log(response);
            console.log('serTime:' + response.serTime);
            if (response.time !== 'same') {
                $('#talkFrame span').remove();
                ctime = response.serTime;

                for (i = 0; i < $(response.talk).length; i++) {
                    var reg = '^http://.*';
                    if ((response.talk[i].msg).match(reg))
                        $('#talkFrame').append('<br>'+'<span>' + response.talk[i].name + ":>" + '</sapn>' + '<img src="' + response.talk[i].msg + '">' + '<br>');
                    else
                        $('#talkFrame').append('<span>' + response.talk[i].name + ":>" + '</sapn>' + '<span>' + response.talk[i].msg + '</sapn>' + '<br>');
                }
                $('#talkFrame').scrollTop($('#talkFrame').prop("scrollHeight"));
            } else {

            }
        },
        error: function () {
            console.log("ajax FAILED!");
        }
    });
}

function talkFrameDown() {
    $('#talkFrame').scrollTop($('#talkFrame').prop("scrollHeight"));
}
