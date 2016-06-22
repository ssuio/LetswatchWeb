<%@page import="lw.domain.Member"%>
<%@page pageEncoding="UTF-8"%>

<%
    Member m =(Member)session.getAttribute("member");
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
    <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
    <script src="/LetsWatchWeb/js/jquery-1.12.4.js" type="text/javascript"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <style>
        #datepicker{
            margin: 20px;
            
        }
    </style>
    <script>
        window.addEventListener("load",init);
        var name;
        var gender;
        var email;
        var birthday;
        var phone;
        var epaper;
        var introduction;
        var roomId;
        var memberId;
        var host="localhost:8084";
        function init(){
            $('#test').on("click",testHandler);
            $('#edit').on("click",editHandler);
            $('#finish').on("click",finishHandler);
            $('#finish').css('display','none');
             
        }

        function testHandler(){
            var g = $('input[name=gender]:checked').val();
            alert(g);
        }

        function editHandler(){
            $('.birthday_p').remove();
            $('.gender_p').remove();
            $('#finish').css('display','block');
            $('#edit').css('display','none');
            $('#profile p').css({'border':"2px solid #C1E0FF"});
            $('#profile p').attr('contenteditable','true');
            $('#profile p:first').focus();
            $('#birthday').remove();
            var date = document.createElement("input");
            date.id="datepicker";
            date.type="text";
            $('#birthday_lab').after(date);
            $('#gender_lab').after('<div class="gender_radio"><input class="gender_radio" type="radio" name="gender" value="Male">Male<input type="radio" class="gender_radio" name="gender" value="Female">Female<div>');
            $(function() {
                $( "#datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  dateFormat: "yy/mm/dd"
                });
            });
        }

        function finishHandler(){
            
            name = $('#name').text();
            gender = $('input[name=gender]:checked').val();
            birthday = $('#datepicker').val();
            phone= $('#phone').text();
            if($('#epaper').prop("checked")){
                epaper = 'true';
            }else{
                epaper = 'false';
            }; 
            email=$('#email').text();
            introduction = $('#introduction').text();
            roomId ='<%=m.getRoomId()%>';
            memberId='<%=m.getId()%>';
            $('#edit').css('display','block');
            $('#finish').css('display','none');
            $('#profile p').attr('contenteditable','false');
            $('#profile p').css({'border':"none"});
            $('#gender_lab').after('<p class="gender_p">'+gender+'</p>');
            $('#birthday_lab').after('<p class="birthday_p">'+birthday+'</p>');
            $('.gender_radio').remove();
            $('#datepicker').remove();
            $('<br>').remove();
            
            
             $.ajax({
                    type:"POST",
                    url: "http://"+host+"/LetsWatchWeb/memberUpdate.do",
                    data: {
                           'name': name,
                           'email': email,
                           'gender':gender,
                           'epaper': epaper,
                           'birthday': birthday,
                           'phone': phone,
                           'introduction' : introduction,
                           'roomId':roomId,
                           'memberId':memberId
                    },
                        success:function(response){
                                
                        },
                        error: function(){
                            console.log("ajax FAILED!");
                        }
            });
            alert(0);
        }
    </script>
</head>

<body>
        <style>
            
           
            p{
                margin:15px;
                font-size: 1.1em;
            }
            #profile{
                margin:auto;
            }
            #profile p{
               width:200px; 
            }
            #profile_pic{
                width: 200px;
                height:200px;
            }
        </style>
      
        
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
        <div>
            <div id="profile">
            <ul>
                <li><img src="/LetsWatchWeb/picture/ninja.png" id="profile_pic"></li>
            </ul>
                <div>
                <label>Name:</label>
                <p id="name"><%=m.getName()%></p>
                </div>
                <div>
                <label id="gender_lab">Gender:</label><br>
                </div>
                <div>
                <label>E-mail: </label>
                 <p id="email"><%=m.getEmail()%></p>
                </div>
                <div>
                <label id="birthday_lab">Birthday:</label>
                <p class="birthday_p"><%=m.getBirthday()==null?"":m.getBirthday()%></p>
                </div>
                <div>
                <label>Phone: </label>
                <p id="phone"><%=m.getPhone()==null?"":m.getPhone()%></p>
                </div>
                <div>
                <label>E-paper: </label>
               <%=m.isEpaper()==true?"<input id=\"epaper\" type=\"checkbox\" checked><br>":"<input id=\"epaper\" type=\"checkbox\"><br>"%>
                </div>
                <div>
               <label>Introduction: </label>
               <p id="introduction"><%=m.getIntroduction()==null?"":m.getIntroduction()%></p>
               </div>
<!--               <p>Date: <input type="text" id="datepicker"></p>-->
            <button type="submit" id="finish">Finish</button>
            <button id="edit">Edit</button>
            <button id="test">test</button>
            </div>
        </div>   
               
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>
