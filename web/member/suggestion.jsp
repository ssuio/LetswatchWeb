<%-- 
    Document   : suggestion
    Created on : 2016/7/6, 上午 10:35:34
    Author     : Patty
--%>

<%@page import="lw.domain.Suggestion"%>
<%@page import="java.util.List"%>
<%@page import="lw.model.SuggestionDAO"%>
<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>About</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
<script>
    $(document).ready(init);
    var time;
    function init(){
       $('#submit').on("click",getTime);
       jQuery('#suggestions').css("overflow-y", "scroll");
       $('#suggestions').scrollTop($('#suggestions').prop("scrollHeight"));
    }
    function getTime(){
        var time = new Date();
        var Year = time.getFullYear();
        var Month = time.getMonth();
        var day = time.getDate();
        var hour = time.getHours();
        var min = time.getMinutes();
        var sec = time.getSeconds();
        time = Year + '/'+ Month + '/' + day + ' '+ hour + ':' + min +':' + sec;
        return Year + '/'+ Month + '/' + day + ' '+ hour + ':' + min +':' + sec;
    }
</script>
<style>
    #sInput{
        width:100%;
        height:800px;
    }  
    form{
        text-align:center;
        
    }
    form input[type='text']{
        width: 25%;
    }
    textArea{
        width: 30%;
        height: 100px;
    }
    #suggestions{
        width: 100%;
        height:550px;
        margin-bottom: 30px;
        margin-top: 30px;
    }
    .suggestionHistory{
        text-align:center;
        width:100%;
        border: 2px;
        border-radius: 20px;
    }
    fieldset{
        width: 30%;
        padding:20px;
        margin-left: 35%;
        margin-top: 10px;
	border:1px solid #999;
	border-radius:20px;
	box-shadow:0 0 10px #999;
    }
</style>
<%
    SuggestionDAO sDAO = new SuggestionDAO();
    List<Suggestion> sList = sDAO.getAll();
%>
</head>
   
<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper" id="sInput">
    <div id="suggestions">
        <%if(sList!=null){
        
        for(Suggestion s :sList){%>
        <fieldset>
          <legend><%=s.getName() + "  " + s.getTime()%></legend>
        <div class='suggestionHistory'>
            <%=s.getMsg()%>
        </div>
        </fieldset>
        <%}
}%>
    </div>
    <form action="/LetsWatchWeb/suggestion.do">
        <label>Name:</label>
        <input type="text" name ="name" /><br>
        <textarea name="msg"></textarea><br>
        <input type="submit" value="submit" id="submit"/>
    </form>
</div>     
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>