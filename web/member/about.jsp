<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="../../css/indexLayout.css" rel="stylesheet" type="text/css">
  <!--<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">-->
<title>About</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>

<div class="wrapper">
 <h1>
  <script>
   document.write(Date.now());
  </script>  
 </h1>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>









