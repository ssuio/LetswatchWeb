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
<title>Suggestion</title>
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
    #suggestion_btn {
                -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
                -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
                box-shadow:inset 0px 1px 0px 0px #ffffff;
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
                background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
                background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
                background-color:#f9f9f9;
                -moz-border-radius:6px;
                -webkit-border-radius:6px;
                border-radius:6px;
                border:1px solid #dcdcdc;
                display:inline-block;
                cursor:pointer;
                color:#666666;
                font-family:Arial;
                font-size:1.2em;
                font-weight:bold;
                padding:6px 24px;
                text-decoration:none;
                text-shadow:0px 1px 0px #ffffff;
            }
            #suggestion_btn :hover {
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
                background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
                background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
                background-color:#e9e9e9;
            }
            #suggestion_btn :active {
                position:relative;
                top:1px;
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
        <input type="submit" value="submit" id="suggestion_btn" />
    </form>
</div>     
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>