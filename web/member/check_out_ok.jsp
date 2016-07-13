<%-- 
    Document   : check_out_ok
    Created on : 2016/7/7, 下午 04:37:19
    Author     : Patty
--%>

<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.*"%>
<%@page import="lw.domain.Member"%>
<%@page import="lw.model.RDBMemberDAO"%>
<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> Payment OK</title>
<link href="/LetsWatchWeb/css/indexLayout.css" rel="stylesheet" type="text/css">
<link href="/LetsWatchWeb/css/resetcss.css" rel="stylesheet" type="text/css">
<%
    if(session.getAttribute("sum")!=null){
        RDBMemberDAO mDAO = new RDBMemberDAO();
        Member m = (Member)session.getAttribute("member");
        int sum = (Integer)session.getAttribute("sum");
        mDAO.updateWcoin(m, sum);
        m = mDAO.getOneById(m.getId());
        session.setAttribute("member", m);
        session.removeAttribute("sum");
        
         String host = "smtp.gmail.com";
        int port = 587;
        final String username = "ucom.java55@gmail.com";
        final String password = "UcomJava%5";//your password
//
// final String username="yeie0328@gmail.com";
// final String password="sorry520";
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
        Session mSession = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            Message message = new MimeMessage(mSession);
//message.setFrom(new InternetAddress("admin@uuu.com.tw"));//虛擬寄件人
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("yeie0328@gmail.com")); //收件人
            message.setSubject("LetsWatch Wcoin交易紀錄.");
            message.setText("Dear Karl, 以下是您交易紀錄請查閱!如您沒有在LetsWatch購物 請忽略本信件!");
            Transport transport = mSession.getTransport("smtp");
            transport.connect(host, port, username, password);
            Transport.send(message);
            System.out.println("寄送email結束.");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        
    }


    %>
    <script>
        function jump(){
            window.location = 'orders_history.jsp';
        }
        setTimeout(jump,2500);
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/subview/header.jsp">
<jsp:param name="sub_title" value="Shop!P"/>
</jsp:include>

<div class="wrapper">
 <div id="article">
 <h2>交易成功！</h2>
 <div class="check_ok">
    
 <p>交易明細已傳送到您的會員信箱。</p>
 <p>感謝您對LetsWatch支持，祝您使用愉快！</p>
 <p><a href="/LetsWatchWeb/member/orders_history.jsp">如三秒後沒有跳轉，請點此查詢交易記錄</a></p>

 </div> 
</div> 
</div>
<%@include file="/WEB-INF/subview/footer.jsp"%>        
</body>
</html>