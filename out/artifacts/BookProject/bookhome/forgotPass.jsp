<%@ page import="Util.Util" %><%--
  Created by IntelliJ IDEA.
  User: thnhl
  Date: 11/21/2019
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ForgotPass</title>
</head>
<body>
<form action=<%=Util.fullPath("forgotPassController")%> method="post">
    Nhập tên tài khoản: <input name="username" type="text"><br>
    <input type="submit" value="Lấy lại mật khẩu">
</form>
</body>
</html>
