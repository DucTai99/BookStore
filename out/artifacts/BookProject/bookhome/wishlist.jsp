<%@ page import="DAO.GioHangDAO" %>
<%@ page import="Util.Util" %>
<%@ page import="BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.Sach" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shopping Cart || Witter Multipage Responsive Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="link.jsp" %>
    <style>
        .product {
            display: flex;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
            padding: 10px 20px;
            margin-bottom: 30px;
            border-radius: 10px;
        }

        .subtotal-main-area, .discount-main-area {
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .product:hover {
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
        }

        .img-product {
            width: 20%;
        }

        .title-product {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .title-product h4 {
            font-size: 22px;
        }

        .title-product p {
            font-size: 18px;
        }

        .quantity-product {
            margin-left: auto;
            display: flex;

            align-items: center;
            justify-content: center;

        }

        .quantity-product p {
            margin-bottom: 0px;
            margin-right: 20px;
        }

        .subtotal-area h2, .subtotal-main-area p, .discount-top, .discount-middle {
            padding: 20px;
        }

        .discount-middle {
            display: flex;
        }

        .discount-middle input[type="text"] {
            display: block;
            width: 70%;
            border-radius: 15px 0px 0px 15px;
            margin-bottom: 0px;
            outline: none;
        }

        .discount-middle input[type="submit"] {
            display: block;
            border-radius: 0px 15px 15px 0px;
            background-color: #32b5f3;
            color: white;
            margin-bottom: 0px;
            outline: none;
            width: 30%;
        }

        .discount-middle input[type="submit"]:hover {
            background-color: #444444;
        }
    </style>
</head>
<body>

<%@include file="header.jsp" %>
<!--Header Area End-->
<!-- Breadcrumbs Area Start -->
<div class="breadcrumbs-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcrumbs">
                    <h2>Danh sách theo dõi</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="index.html">Trang chủ</a>
                        </li>
                        <li>Danh sách theo dõi</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Cart Area Start -->
<div class="shopping-cart-area section-padding">
    <% ArrayList<Sach> listSach = (ArrayList<Sach>) request.getAttribute("listSach");%>
    <div class="container">
        <div class="row" style="display: flex; flex-direction: row-reverse;">
            <div class="col-md-8 col-sm-12">
                <% for (Sach sach : listSach) {%>
                <div class="product">
                    <% if (sach.getKhuyenMai() > 0) { %>
                    <div class="img-product" style="position: relative; margin-right: 20px">
                        <img src=<%=Util.fullPath(sach.getHinhAnh())%> alt="">
                        <div style="width: 20%; z-index: 999; position: absolute; top:0;right: 0">
                            <img src=<%=Util.fullPath("bookhome/img/sale.png")%> alt="">
                            <p style=" font-size: 10px; color : white;position: absolute; top:50% ;left: 50%; transform: translate(-50%,-50%);"><%=sach.getKhuyenMai()%>%</p>
                        </div>
                    </div>
                    <% } else {%>
                    <div class="img-product" style="margin-right: 20px">
                        <img src=<%=Util.fullPath(sach.getHinhAnh())%> alt="">
                    </div>
                    <% }%>
                    <div class="title-product">
                        <h4><a href="<%= Util.fullPath("singleProductController?idProduct=")+sach.getMaSach()%>"><%=sach.getTenSach()%></a></h4>
                        <% if (sach.getKhuyenMai() > 0) { %>
                        <p><%=sach.tienKhuyenMai()%>.000đ <span style="color: black" class="old-price"><%=sach.getGia()%>.000đ</span></p>
                        <% } else {%>
                        <p><%=sach.getGia()%>.000đ</p>
                        <% }%>
                        <a href="XoaKhoiWishListController?maSach= <%=sach.getMaSach()%>"><i class="flaticon-delete"></i></a>
                    </div>
                </div>
                <%}%>

                <div class="shopingcart-bottom-area">
                    <a class="left-shoping-cart" href="shop">Tiếp tục mua sắm</a>
                    <div class="shopingcart-bottom-area pull-right">
                        <a class="right-shoping-cart" href="XoaKhoiWishListController?maSach=0">Xóa tất cả sản phẩm</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="subtotal-main-area">
                    <div class="subtotal-area" style="padding-top: 20px;">
                        <h2 style="font-size: 20px; border-bottom: none; padding: 0px 20px 20px 20px;"><i
                                style="margin-right: 20px;" class="flaticon-people"></i><a href="MyAccountController">Thông tin tài
                            khoản</a></h2>
                        <h2 style="font-size: 20px; border-bottom: none; padding: 0px 20px 20px 20px;"><i
                                style="margin-right: 20px;" class="far fa-heart"></i><a href="WishListController">Danh sách theo dõi</a>
                        </h2>
                        <h2 style="font-size: 20px; border-bottom: none; padding: 0px 20px 20px 20px;"><i
                                style="margin-right: 20px;" class="flaticon-shop"></i><a href=<%=Util.fullPath("bookhome/cart.jsp")%>>Giỏ hàng của tôi</a>
                        </h2>
                        <h2 style="font-size: 20px; border-bottom: none; padding: 0px 20px 20px 20px;"><i
                                style="margin-right: 20px;" class="fa fa-list-ol"></i><a href="MyAccountController">Quản lí đơn hàng</a>
                        </h2>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart Area End -->

<!-- Footer Area Start -->
<%@include file="footer.jsp" %>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<%@include file="script.jsp" %>
</body>
</html>