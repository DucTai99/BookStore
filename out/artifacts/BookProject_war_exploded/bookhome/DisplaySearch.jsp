<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.Sach" %>
<%@ page import="Util.Util" %><%--
  Created by IntelliJ IDEA.
  User: thnhl
  Date: 12/18/2019
  Time: 12:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display Search</title>
</head>
<body>
<%
    ArrayList<Sach> listSach = (ArrayList<Sach>) request.getAttribute("listSach");
    for (int i = 0; i < listSach.size(); i++) {
%>
<div class="cart-product" style="display: flex;padding: 5px">
    <div class="cart-product-image" style="width: 35%;">
        <a href="single-product.jsp">
            <img src="<%=listSach.get(i).getHinhAnh()%>" alt="">
        </a>
    </div>
    <div class="cart-product-info" style="width: 60%">
        <a href=<%=Util.fullPath("singleProductController?idProduct=")+listSach.get(i).getMaSach()%>><%=listSach.get(i).getTenSach()%></a>
        <p class="cart-price">
            <span style="color: black"><%=listSach.get(i).getGia()%>.000đ</span>
        </p>
    </div>
</div>
<%}%>
</body>
</html>
