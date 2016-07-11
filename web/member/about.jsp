<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>About</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="哈囉!P"/>
</jsp:include>
  <div class="wrapper">
   <div id="main_about">
    <h2>關於LetsWatch</h2>
    <hr class="clearfix">
    <div class="hover">
        <div class="main_about_img">
        <img src="/LetsWatchWeb/picture/about_pic02.jpg">
        <img src="/LetsWatchWeb/picture/about_pic01.jpg" />
        </div>
    <div id="about_txt">
      <p>覺得一個人看影片無聊嗎?</p>
      <p>突然看到一系列有趣的影片想找朋友一起看，可是距離太遠嗎？</p>
      <p>快來使用Let’sWatch吧！</p>
<p>Let’sWatch可以讓您與遙遠一方的朋友一同進入房間享受影音！</p>
<p>Let’sWatch還可以創造私人房間不受打擾！</p>
<p>Let’sWatch擁有聊天室以及趣味貼圖功能，</p>
<p>讓您不僅享受影音同時也兼顧聊天趣味！</p>
<p>上班覺得累了嗎？快來和朋友Let’sWatch一下吧！</p></div>
        <div class="clearfix"></div>
  </div>

  
  <div class="clearfix"></div>
 </div>
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>
</body>
</html>
 

