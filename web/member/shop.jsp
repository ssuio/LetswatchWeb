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
        <script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
        <script>
            var host = 'localhost:8084';
            $(document).ready(init);
            function init(){
                $('.product').on("click",addCart);
                
                
            }
            
            
            function addCart(){
                var pid = $(this).attr('data-pid');
                
                $.ajax({
                    type:"POST",
                    url: "http://"+host+"/LetsWatchWeb/add_cart.do",
                    data: {
                            'pid':pid
                    },
                success:function(response){
                       
                },
                error: function(){
                    console.log("ajax FAILED!");
                }
                });
            }
            
        </script>
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
   
   <p class="product" data-pid="<%=pTmp.getId()%>">
       <%="Name:"+pTmp.getName()%>
   </p>
   <%}%>
    <a href=""><h1>Add Shop Cart</h1></a>
</div>       
<%@include file="/WEB-INF/subview/footer.jsp"%>        
 </body>
</html>
