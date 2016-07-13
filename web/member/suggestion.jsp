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
    function init(){
       
        
    }
    function getTime(){
        var time = new Date();
        var Year = time.getFullYear();
        var Month = time.getMonth();
        var day = time.getDate();
        var hour = time.getHours();
        var min = time.getMinutes();
        var sec = time.getSeconds();
        return Year + '/'+ Month + '/' + day + ' '+ hour + ':' + min +':' + sec;
    }
</script>
<style>
    #sInput{
        width:100%;
        height:600px;
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
        text-align:center;
        width: 30%;
        height:400px;
    }
    .suggestionHistory{
        width:100%;
        height:50px;
        background: #FC0;
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
        <%if(sList!=null){%>
        <div class='suggestionHistory'>
            
        </div>
        <%}%>
    </div>
    <form>
        <label>Name:</label>
        <input type="text" /><br>
        <textarea></textarea><br>
        <input type="submit" value="submit"/>
    </form>
</div>     
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>