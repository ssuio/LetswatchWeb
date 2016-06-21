<%@page import="lw.domain.Member"%>
<%@taglib prefix="lw" tagdir="/WEB-INF/tags"%>
<%@page import="java.util.List"%>
<%@page  pageEncoding="UTF-8" info="會員登入"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>會員登入</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>
<body>

<!--header-->
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%= this.getServletInfo() %>"/>
</jsp:include>


<script>
	function refreshHandler(){
     var check_img = document.getElementById("check_code_image");
     check_img.src="Image/check.jpg?get=" + new Date();
    }
</script>

<!--內容-->
<div class="wrapper">
<%
 List<String> errors = (List<String>)request.getAttribute("errors");
 if(errors!=null && errors.size()>0){
%>
<ul>
<% for (String msg: errors){%>
 <li><%=msg%></li>
<%}%>
</ul>
<%}%>
            
             <%--
                //Member m = (Member)session.getAttribute("member");
                String email="";
                String remember="";
                Cookie[] cookies =request.getCookies();
                for(Cookie c:cookies){
                    if(c.getName().equals("email")){
                        email=c.getValue();
                    }else if(c.getName().equals("remember")){
                    remember = c.getValue();
                    }
                    
                }
            
            --%> 
 <div class="num_check">
  <lw:checkCodeField imgSrc="/LetsWatchWeb/Image/check.jpg" name="checkCode"/>
 </div>
</div><!--wrapper-->
<!--footer-->
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>