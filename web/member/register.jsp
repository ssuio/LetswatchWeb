<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Register!P"/>
</jsp:include>
<style>
    form{
                padding: 10%;
                
            }
            form p{
                margin:20px;
            }
        
        
    
    
</style>
        <form method="POST" action="register.do">
        
            <p>
            <label for="email">E-mail:</label>
            <input type="text" id="userid" name="uid" placeholder="輸入信箱" required>
            </p>
            <p>
            <label for="email">Name:</label>
            <input type="text" id="name" name="name" placeholder="輸入名稱" required>
            </p>
            <p>
            <label for="password">Password:</label>
            <input type="password" id="pwd" name="password1" placeholder="輸入密碼" required>        
            </p>
            <p>
            <label for="password">Password Again:</label>
            <input type="password" id="pwd" name="password2" placeholder="輸入密碼" required>        
            </p>
            <p>
            <label for="checkBox">Check Code:</label>
            <input type="text" id="checkCode" name="checkCode" placeholder="輸入驗證碼" required> 
            </p>
            <p>
            <img src="/LetsWatchWeb/Image/check.jpg" id="check_code_image">
            <input type="button" onclick="refreshHandler()" value="refresh">
            </p>
             <p>
               <input type="submit" value="Confirm">
            </p>
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
        </form>
    <%@include file="/WEB-INF/subview/footer.jsp"%>
