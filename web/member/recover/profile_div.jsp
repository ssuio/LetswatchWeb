<%@page import="lw.domain.Member"%>
<style>
          #profile{
                font-family: " AppleGothic", CenturyGothic, AppleGothic, sans-serif;
                font-size: 1em;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                width:300px;
                height: 750px;
                margin:auto;
                background: black;
                color: white;
                position:absolute;
                left: 1050px;
                border: 2px solid;
                border-radius: 25px;
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
            
            #edit,#finish {
                -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
                box-shadow:inset 0px 1px 0px 0px #ffffff;
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
                background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
                background-color:#f9f9f9;
                -moz-border-radius:6px;
                -webkit-border-radius:6px;
                border-radius:6px;
                border:1px solid #dcdcdc;
                display:inline-block;
                cursor:pointer;
                color:#666666;
                font-family:Arial;
                font-size:1.2em;
                font-weight:bold;
                padding:6px 24px;
                text-decoration:none;
                text-shadow:0px 1px 0px #ffffff;
            }
            #edit,#finish :hover {
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
                background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
                background-color:#e9e9e9;
            }
            #edit,#finish :active {
                position:relative;
                top:1px;
            }
</style>
<% 
    if (m!=null){%>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
                $('#edit').css('display', 'none');
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
                $('#edit').css('display', 'block');
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

//                alert('name=' + name + ' gender=' + gender + ' birthday' + birthday + ' phone=' + phone + ' epaper=' + epaper + ' email=' + email
//                        + ' introduction=' + introduction + ' roomId=' + roomId + 'memberId=' + memberId);

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

<div id="profile">
                <div id="profile_inside">
                    <img src="/LetsWatchWeb/GetMemberPic.pic" id="profile_pic">
                    <form action="/LetsWatchWeb/upload.pic" method="post" enctype="multipart/form-data" id="upload_form">
                        <input type="file" name="photo" accept="Image/*" id="pick"/><br>
                        <input type="submit" value="Upload" name="upload" id="upload"/>
                    </form>
                    <br>
                    <label>Name:</label><input id="pname" value="<%=m.getName()==null?"":m.getName()%>" ><br>
                    <label>E-mail: </label> <input id="pemail" value="<%=m.getEmail()==null?"":m.getEmail()%>" ><br>
                    <label>Gender: </label> <input id="pgender" value="<%=m.getGender()+""== null ? "" : m.getGender() + ""%>"><br>
                    <label>Birthday:</label><input id="datepicker" value="<%=m.getBirthday()== null ? "" : m.getBirthday().toString()%>"><br>
                    <label>Phone: </label><input id="pphone" value="<%=m.getPhone() == null ? "" : m.getPhone()%>"><br>
                    <label>E-paper: </label><%=m.isEpaper() == true ? "<input id=\"epaper\" type=\"checkbox\" checked><br>" : "<input id=\"epaper\" type=\"checkbox\"><br>"%><br>
                    <label>Introduction: </label> <br> <textarea type="textarea" id="introduction"><%=m.getIntroduction() == null ? "" : m.getIntroduction()%></textarea><br>
                    <button type="submit" id="finish">Finish</button>
                    <button id="edit">Edit</button>
                </div>
            </div>
<%}%>