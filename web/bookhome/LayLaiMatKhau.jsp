<%@ page import="Util.Util" %><%--
  Created by IntelliJ IDEA.
  User: thnhl
  Date: 12/5/2019
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lay lai mat khau</title>
</head>
<body>
<form method="post" action=<%=Util.fullPath("ThayDoiMatKhauController")%>>
    Nhập mật khẩu mới: <input type="password" name="password">
    Nhập lại mật khẩu: <input type="password" name="cfpassword">
</form>
</body>
</html>
