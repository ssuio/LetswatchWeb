<%@page import="lw.domain.Member"%>
<%@page import="java.util.List"%>
<%@page  pageEncoding="UTF-8" info="會員登入"%>
<jsp:include page="/WEB-INF/subview/header.jsp">
    <jsp:param name="sub_title" value="<%= this.getServletInfo() %>"/>
</jsp:include>
        <script>
            function refreshHandler(){
                var check_img = document.getElementById("check_code_image");
                check_img.src="Image/check.jpg?get=" + new Date();
            }
        </script>
        <style>
            #login{
                width: 100%;
                height: 600px; 
                
            }
            form{
                padding: 10%;
                
            }
            form p{
                margin:20px;
            }
        </style>
    
        <%
            List<String> errors = (List<String>)request.getAttribute("errors");
            if(errors!=null && errors.size()>0){
         
        %>
            <ul>
                <% for (String msg: errors){%>
            <li><%=msg%></li>
            <%}%>
             
            </ul>
            <%}
                //Member m = (Member)session.getAttribute("member");
                String email="";
                String remember="";
                Cookie[] cookies =request.getCookies();
                for(Cookie c:cookies){
                    if(c.getName().equals("email")){
                        email=c.getValue();
                    }else if(c.getName().equals("remember")){
                    remember = c.getValue();
                    }
                    
                }
            
            %> 
    <div id="login">
        <form method="POST" action="/LetsWatchWeb/login.do">
            <p>
            <label for="email">E-mail:</label>
            <input type="text" id="userid" name="email" placeholder="輸入信箱" value="${cookie.email.value}">  
            <input type="checkbox" name="remember" id="remember" <%=remember%>><label for="remember" >  Remember</label>
            </p>
            <p>
            <label for="password">Password:</label>
            <input type="password" id="pwd" name="password" placeholder="輸入密碼">        
            </p>
            <p>
            <label for="checkBox">Check Code:</label>
            <input type="text" id="checkCode" name="checkCode" placeholder="輸入驗證碼">        
            </p>
            <p>
            <img src="Image/check.jpg" id="check_code_image">
            <input type="button" onclick="refreshHandler()" value="refresh">
            </p>
            <p>
               <input type="submit" value="Confirm">
            </p>
        </form>
            
    </div>  
<%@include file="/WEB-INF/subview/footer.jsp"%>
