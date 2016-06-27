<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lw.model.RDBProductDAO"%>
<%@page import="lw.domain.Product"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <% List<Product> plist = new ArrayList<>();
            RDBProductDAO pDAO = new RDBProductDAO();
            plist = pDAO.getAll();
        %>
        <link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
        <link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>
 <style>
            div{
                 width: 100%;
                height: 600px; 
            }
</style>

<div>
   <% for(Product pTmp : plist){%>
   <p>
       <%="Name:"+pTmp.getName()+" Description:"+pTmp.getDescription() + "URL:"+pTmp.getUrl()%>
   </p>
   <%}%>
    <a href=""><h1>Add Shop Cart</h1></a>
</div>       
<%@include file="/WEB-INF/subview/footer.jsp"%>        
 </body>
</html>
