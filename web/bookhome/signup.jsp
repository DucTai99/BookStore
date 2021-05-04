<%@ page import="BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Creat An Account || Witter Multipage Responsive Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="link.jsp" %>

</head>
<body>

<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user != null) {--%>
<%--        out.print(user.getEmail());--%>
<%--    }--%>
<%--%>--%>
<!-- Add your site or application content here -->
<!--Header Area Start-->
<%@include file="header.jsp" %>
<!--Header Area End-->
<!-- Breadcrumbs Area Start -->
<div class="breadcrumbs-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcrumbs">
                    <h2>Đăng kí</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="index.jsp">Trang chủ</a>
                        </li>
                        <li>Đăng kí</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Loging Area Start -->
<div class="login-account section-padding">
    <div class="container">
        <div class="row" style="  display: flex;
  align-items: center;
  justify-content: center;">
            <div class="col-md-6 col-sm-6">
                <form name="signupForm" action=<%=Util.fullPath("SignupController")%> class="create-account-form" method="post">


                        <% ArrayList<String> listMsg = null;
                            if((listMsg = (ArrayList<String>) request.getAttribute("listMsg"))!=null){
                            for (int i = 0; i < listMsg.size(); i++) {%>
                          <h3 style="color: red"><%=listMsg.get(i)%></h3>
                        <%
                            }
                            }
                        %>

                    <h2 class="heading-title">
                        Tạo tài khoản mới
                    </h2>
                    <p id="result"></p>
                    <p class="form-row">
                        <input style="outline: none" onfocusout="display()" type="email" name="email" placeholder="Địa chỉ email">
                    </p>
                    <p class="form-row">
                        <input style="outline: none" type="password" name="password" placeholder="Mật khẩu">
                    </p>
                    <p class="form-row">
                        <input style="outline: none" type="password" name="cfpassword" placeholder="Nhập lại mật khẩu">
                    </p>
                    <div class="submit">
                        <button name="submitcreate" id="submitcreate" type="submit" class="btn-default">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                        Đăng kí
                                    </span>
                        </button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Loging Area End -->
<!-- Footer Area Start -->
<%@include file="footer.jsp" %>
<!-- Footer Area End -->
<!-- all js here -->
<%@include file="script.jsp" %>
<script>
    function display() {
        var xhttp;
        var email = document.signupForm.email.value;
        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {
                var data = xhttp.responseText;
                document.getElementById("result").innerHTML = data;
            }
        }
        xhttp.open("POST", "http://localhost:8080/BookProject/ValidateFormController?email=" + email, true);
        xhttp.send();
    }
</script>
</body>
</html>
