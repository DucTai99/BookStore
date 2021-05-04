<%@ page import="Util.Util" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Admin</title>

    <link href="assets/css/admin.css" rel='stylesheet' type='text/css'/>
</head>
<body>
<div id="header">
    <div class="inHeaderLogin"></div>
</div>

<div id="loginForm">
    <div class="headLoginForm">Login Administrator</div>
    <div class="fieldLogin">
        <form method="POST" action="<%= Util.fullPath("SigninController") %>">
            <p style="color: red">

            </p>


            <label>Admin name</label><br>
            <input type="text" class="login"

                   value="" name="name"><br>

            <label>Password</label><br>

            <input type="password" class="login" value="" name="pass"><br>

            <input type="hidden" value="admin" name="command">

            <input type="submit" value="Login">

        </form>
    </div>
</div>
</body>
</html>