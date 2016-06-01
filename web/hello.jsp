<%@page contentType="text/html" pageEncoding="UTF-8" session="true" info ="JSPhello"%>
<!DOCTYPE html>
<!-- saved from url=(0045)http://localhost:8084/LetsWatchWeb/hello.view -->
<html><head>
        <title>Servlet HelloServlet</title>
        </head>
    <body>
        <%! int i = 100;
            String title = "歡迎";
            
            String paraTitle;
            public void jspInit(){
                String title= getInitParameter("title");    
                if (title != null)
                    this.title = title;
            else 
                this.title = this.getServletInfo();
                paraTitle = title;

                System.out.println(this.getServletName());
                System.out.println(this.getInitParameter("title"));
            }
        
            
        %>
        
        <p><%=title%></p>
        <p>title 2222222222222222222 is <%=paraTitle%></p>
        <p>session: <%out.print(session.getId());%></p>
        
       
        
        
        
        
        <p>tittle:  <%=this.getInitParameter("title")%> </p>
        <% out.flush();
            Thread.sleep(3000);
        %>
        <p>servlet name: <%= config.getInitParameter(title)%></p>
        <h2>pageContext/x</h2>
        <p>session: <%=session.getId()%></p>
        <p>session: <%= pageContext.getSession().getId()%> </p>
        
        
        <h2>page/xxx</h2>
        <p>this.i:<%= this.i%></p>
        <p>this==page: <%= this == page%></p>
        
        <% for(int i=0; i<10; i++){%>
        <script> document.write('heyman');</script>
        <%}%>
        
        
        <%
        out.println("dddd");
        %>
    </body>
</html>