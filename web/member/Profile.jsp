<%@page import="lw.domain.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Profile!P"/>
</jsp:include>

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
        </style>
   
        <div>
            <%Member m = (Member)session.getAttribute("member");%>
            <form method="POST">
            <ul>
                <li><img src="/LetsWatchWeb/picture/ninja.png"></li>
            </ul>
            <p>
                Name: <%=m.getName()%>
            </p>
            <p>
                Gender: <%=m.getGender()%>
            </p>
            <p>
                E-mail: <%=m.getEmail()%>
            </p>
            <p>
                Birthday: <%=m.getBirthday()%>
            </p>
            <p>
                Phone: <%=m.getPhone()%>
            </p>
            <p>
                E-paper: <%=m.isEpaper()==true?"Yes":"No"%>
            </p>
            <p>
                Introduction: <%=m.getIntroduction()%>
            </p>
            </form>
        </div>   
<%@include file="/WEB-INF/subview/footer.jsp"%>
