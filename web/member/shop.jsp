<%@page import="lw.model.ProductService"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lw.domain.Product"%>
<%@page import="lw.domain.Member"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">  
<title>Wshop</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper">
    <script>
   
</script>

 <div id="article">  
  <form class="shop" method="GET">    
   <input class="shopsearch_bar" type='search' name='search' value="${param.search}"placeholder="請輸入產品名稱">
   <input class="shopsearch_img" type='image' src="/LetsWatchWeb/picture/search.gif">
  </form>
   <h2>WSHOP</h2>
  <hr class="clearfix">
    <%
        ProductService service = new ProductService();
        List<Product> list = null;
        String search = request.getParameter("search");
        if (search != null && search.matches("\\d+")) {
            int id = Integer.parseInt(search);

           // out.write("alert("+search+")");
            Product p = service.get(id);
            list = new ArrayList<>();
            list.add(p);
        
            
        }else{
            list = service.getAll();
        }
        if (list != null && list.size() > 0) {
    %>               
  <div id="shop_price">
   <ul>
    <%for (Product p : list) {%>
    <li>
     <h3><%=p.getName()%></h3>
     <a href="#"><img src='<%= p.getUrl()%>'></a>
     <!--shop.jsp?pid=<%=p.getId()%>-->
     <div class="price">
      <a href='${pageContext.request.contextPath}/add_cart.do?pid=<%=p.getId()%>'>
       <p>price:<%= p.getPrice()%></p> 
       <div class="cart_pic"><img src="/LetsWatchWeb/picture/cart.png" alt="加入購物車" title="加入購物車"/></div>
       <div class="clearfix"></div>
      </a>
     </div>
    </li>
    <%}%>
   </ul>
  </div>
    <%}%>
 </div>    
</div>     
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>