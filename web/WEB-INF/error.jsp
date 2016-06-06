<%-- 
    Document   : error
    Created on : 2016/5/30, 下午 04:54:07
    Author     : adm
--%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>

<title><%=getServletInfo()%></title>
<div>
        <h1>系統發生錯誤:${requestScope["javax.servlet.error.request_uri"]}</h1>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>