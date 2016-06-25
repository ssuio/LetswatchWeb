<%-- 
    Document   : checkCodeField
    Created on : 2016/6/17, 上午 10:30:24
    Author     : adm
--%>

<%@tag description="checkCode" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="imgSrc"%>
<%@attribute name="name"%>

<%-- any content can be specified here e.g.: --%>
 <%
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
        <form method="POST" action="/LetsWatchWeb/login.do"> <fieldset>
          <legend>Login</legend>
          <p><br>
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
            <input type="text" id="checkCode" name="${name}" placeholder="輸入驗證碼">        
            </p>
            <p>
            <img src="${imgSrc}" id="check_code_image">
            <input type="button" value="refresh" id="refresh">
            </p>
            <p>
               <input type="submit" value="Login" id="confirm_submit">
            </p>
        </form>
            </fieldset>
    </div>  