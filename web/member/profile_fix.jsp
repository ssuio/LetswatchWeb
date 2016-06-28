<%@page import="lw.domain.Member"%>
<%@page pageEncoding="UTF-8"%>

<%
    Member m = (Member) session.getAttribute("member");
//    if(m==null){
//        response.sendRedirect("/LetsWatchWeb/member/login.jsp");
//    }else{
//    System.out.println(m);
%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>首頁</title>
        <script src="/LetsWatchWeb/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <style>
            #datepicker{
                margin: 20px;

            }
        </style>
        <script>
            window.addEventListener("load", init);
            var name;
            var gender;
            var email;
            var birthday;
            var phone;
            var epaper;
            var introduction;
            var host = "localhost:8084";
            function init() {
                $('#edit').on("click", editHandler);
                $('#finish').on("click", finishHandler);
                $('#finish').css('display', 'none');
                $('#profile input').attr('disabled', 'true');
                $('#upload').attr('disabled', 'true');
                $('#introduction').attr('disabled', 'true');
                $('#upload_form').css('display', 'none');
                $(function () {
                    $("#datepicker").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: "yy/mm/dd"
                    });
                });
            }

            function testHandler() {
                var g = $('input[name=gender]:checked').val();
                alert(g);
            }

            function editHandler() {
                $('#profile input').removeAttr('disabled');
                $('#finish').css('display', 'block');
                $('#upload_form').css('display', 'block');
                $('#introduction').removeAttr('disabled');
                $(function () {
                    $("#datepicker").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: "yy/mm/dd"
                    });
                });
            }

            function finishHandler() {
                $('#finish').css('display', 'none');
                $('#profile input').attr('disabled', 'true');
                $('#upload').attr('disabled', 'true');
                $('#upload_form').css('display', 'none');
                $('#introduction').attr('disabled', 'true');

                name = $('#pname').val();
                gender = $('#pgender').val();
                birthday = $('#datepicker').val();
                phone = $('#pphone').val();
                if ($('#epaper').prop("checked")) {
                    epaper = 'true';
                } else {
                    epaper = 'false';
                }
                ;
                email = $('#pemail').val();
                introduction = $('#introduction').val();
                roomId = '<%=m.getRoomId()%>';
                memberId = '<%=m.getId()%>';

                alert('name=' + name + ' gender=' + gender + ' birthday' + birthday + ' phone=' + phone + ' epaper=' + epaper + ' email=' + email
                        + ' introduction=' + introduction + ' roomId=' + roomId + 'memberId=' + memberId);

                $.ajax({
                    type: "POST",
                    url: "http://" + host + "/LetsWatchWeb/memberUpdate.do",
                    data: {
                        'name': name,
                        'email': email,
                        'gender': gender,
                        'epaper': epaper,
                        'birthday': birthday,
                        'phone': phone,
                        'introduction': introduction,
                        'roomId': roomId,
                        'memberId': memberId
                    },
                    success: function (response) {

                    },
                    error: function () {
                        console.log("ajax FAILED!");
                    }
                });
            }
        </script>
    </head>

    <body>
        <style>
            #profile{
                font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
                font-size: 1em;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                width:300px;
                height: 680px;
                margin:auto;
                background: black;
                color: white;
            }
            #profile_pic{
                width: 200px;
                height:200px;
            }
            #profile input{
                font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
                font-size: 1em;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                background: black;
                color: white;
                border-top: transparent !important;
                border-left: transparent !important;
                border-right: transparent !important;
                border-bottom: transparent !important;
                width:160px; 
            }
            #upload{
                background:#DDD;
            }
            #introduction{
                border-radius: 5px;
                background: black;
                color: white;
                text-align: initial;
                height: 150px;
                width:200px;
            }
            #profile_inside{
                margin:10px 0px 10px 50px;
            }
        </style>
        <div>
            <div id="profile">
                <div id="profile_inside">
                    <img src="/LetsWatchWeb/GetMemberPic.pic" id="profile_pic">
                    <form action="/LetsWatchWeb/upload.pic" method="post" enctype="multipart/form-data" id="upload_form">
                        <input type="file" name="photo" accept="Image/*"/><br>
                        <input type="submit" value="Upload" name="upload" id="upload"/>
                    </form>
                    <br>
                    <label>Name:</label><input id="pname" value="<%=m.getName()%>" ><br>
                    <label>E-mail: </label> <input id="pemail" value="<%=m.getEmail()%>" ><br>
                    <label>Gender: </label> <input id="pgender" value="<%=m.getGender() + "" == null ? "" : m.getGender() + ""%>"><br>
                    <label>Birthday:</label><input id="datepicker" value="<%=m.getBirthday().toString() == null ? "" : m.getBirthday().toString()%>"><br>
                    <label>Phone: </label><input id="pphone" value="<%=m.getPhone() == null ? "" : m.getPhone()%>"><br>
                    <label>E-paper: </label><%=m.isEpaper() == true ? "<input id=\"epaper\" type=\"checkbox\" checked><br>" : "<input id=\"epaper\" type=\"checkbox\"><br>"%><br>
                    <label>Introduction: </label> <br> <textarea type="textarea" id="introduction"><%=m.getIntroduction() == null ? "" : m.getIntroduction()%></textarea><br>
                    <button type="submit" id="finish">Finish</button>
                    <button id="edit">Edit</button>
                </div>
            </div>
        </div>   
    </body>
</html>
