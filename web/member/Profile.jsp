<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Profile!P"/>
</jsp:include>
<%
    Member m = (Member)session.getAttribute("member");
    if(m==null){
        response.sendRedirect("/LetsWatchWeb/member/login.jsp");
    }else{
    System.out.println(m);
%>
        <style>
            div{
                 width: 100%;
                height: 600px; 
            }
            form{
                float:right;
                padding: 5%;
                
            }
            form p{
                margin:15px;
                font-size: 1.5em;
            }
            #profile{
                margin:auto;
            }
            #profile p{
               width:200px; 
            }
           
        </style>
        <script>
            window.addEventListener("load",init);
            function init(){
                $('#edit').on("click",editHandler);
                $('#finish').on("click",finishHandler);
                $('#finish').css('display','none');
            }
            
            function editHandler(){
                $('#finish').css('display','block');
                $('#profile p').css({'border':"2px solid #C1E0FF"});
                $('#profile p').attr('contenteditable','true');
                $('#profile p:first').focus();
                
            }
            
            function finishHandler(){
                $('#finish').css('display','none');
                $('#profile p').attr('contenteditable','false');
                $('#profile p').css({'border':"none"});
            }
        </script>
        <div>
            <div id="profile">
            <ul>
                <li><img src="/LetsWatchWeb/picture/ninja.png"></li>
            </ul>
                <label>Name:</label>
                <p id="name"><%=m.getName()%></p>
                <label >Gender:</label>
                <p id="gender"><%=m.getGender()%></p>
                <label>E-mail: </label>
                 <p id="email"><%=m.getEmail()%></p>
                <label>Birthday:</label>
                <p id="birthday"><%=m.getBirthday()%></p>
                <label>Phone: </label>
                <p id="phone"><%=m.getPhone()%></p>
                <label>E-paper: </label>
               <p id="epaper"><%=m.isEpaper()==true?"Yes":"No"%></p>
               <label>Introduction: </label>
               <p id="introduction"><%=m.getIntroduction()%></p>
            
            <button type="submit" id="finish">Finish</button>
            <button id="edit">Edit</button>
            </div>
        </div>   
        <%}%>
<%@include file="/WEB-INF/subview/footer.jsp"%>
