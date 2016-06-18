<%@page pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
<div>
    <h1>
        <script>
            document.write(Date.now());
        </script>  
    </h1>
            
</div>
        
<%@include file="/WEB-INF/subview/footer.jsp"%>
