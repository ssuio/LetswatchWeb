<%@page import="lw.model.ProductService"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lw.domain.Product"%>
<%@page import="lw.domain.Member"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <!--<meta charset="utf-8">
<link href="../../css/indexLayout.css" rel="stylesheet" type="text/css">!-->
  
<title>Wshop</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper">
    <script>
   
</script>

 <div id="article">
   <div style='float: right'>
        <form method="GET">    
            <input style="width:20em" type='search' name='search' value="${param.search}"
                    placeholder="請輸入產品名稱">
            <input style="background: #E6E6E6 no-repeat 3px 3px;"type='image' src="/LetsWatchWeb/picture/search.gif">
        </form>
    </div>
    <hr style='clear: both'>
    <%
        ProductService service = new ProductService();
        List<Product> list = null;
        String search = request.getParameter("search");
        if (search != null && search.matches("\\d+")) {
            out.write("alert("+search+")");
            Product p = service.get(search);
            list = new ArrayList<>();
            list.add(p);
        
            
        }else{
            list = service.getAll();
        }
        if (list != null && list.size() > 0) {
    %>               
    <ul>
        <%for (Product p : list) {%>
        <li 
            style='display: inline-block;width:200px;height:300px;overflow:auto;padding: 2px;margin: 5px'>
            <h3><%=p.getName()%></h3>
            <a href="product.jsp?pid=<%=p.getId()%>">
            <img style='width: 150px' src='<%= p.getUrl()%>'>
            </a>
            <p>
                price:<%= p.getPrice()%> 
                <a href='${pageContext.request.contextPath}/add_cart.do?pid=<%=p.getId()%>'>
                    <img src="/LetsWatchWeb/picture/cart.png" style='width:32px' alt="加入購物車" title="加入購物車"/>
                
                </a>
         
            </p>

        </li>
        <%}%>
    </ul>
    <%}%>
</div>    
</div>     
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>