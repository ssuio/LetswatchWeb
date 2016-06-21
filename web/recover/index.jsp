<%@page import="lw.domain.Member" info="首頁"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>



        
        
        <div id="indexContentDiv">
              
            <span>LetsWatch哈囉</span><br>
            <a href="/LetsWatchWeb/member/createRoom.jsp"><span>Create Room</span></a>
        
        </div>
        
<%@include file="/WEB-INF/subview/footer.jsp"%>
