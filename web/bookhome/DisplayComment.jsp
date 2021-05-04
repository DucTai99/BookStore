<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.Comment" %><%--
  Created by IntelliJ IDEA.
  User: thnhl
  Date: 12/17/2019
  Time: 8:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display Comment</title>
</head>
<body>
<h1 style="color: red"><%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>
</h1>
<%
    ArrayList<Comment> listComment = (ArrayList<Comment>) request.getAttribute("listComment");
    for (int i = 0; i < listComment.size(); i++) {
%>
<div class="comment-here" style="box-shadow: 0 1px 5px rgba(0, 0, 0, 0.15);padding: 10px 5px">
    <div class="user-comment">
        <i class="fas fa-user-ninja"></i>
    </div>
    <div class="AreaComment" style="display: flex;flex-direction: column;">
        <p style="margin: 0px;font-weight: 600"><%=listComment.get(i).getUserName()%>
        </p>
        <p>
            <%=listComment.get(i).getCommentText()%>
        </p>
    </div>
</div>

<%}%>
</body>
</html>
