<%@ page import="DAO.GioHangDAO" %>
<%@ page import="Util.Util" %>
<%@ page import="BEAN.User" %>
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
<%--<h1>Giỏ hàng của: <%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user != null) {--%>
<%--        out.print(user.getEmail());--%>
<%--    }--%>
<%--%></h1>--%>
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
                    <h2>Giỏ Hàng</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="index.jsp">Trang chủ</a>
                        </li>
                        <li>Giỏ Hàng</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Cart Area Start -->
<div class="shopping-cart-area section-padding">

    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
                <%
                    for (int i = 0; i < cart.gioHang.size(); i++) {
                %>
                <div class="product">
                    <div style="display: flex;align-items: center; width: 90%">
                        <% if (cart.gioHang.get(i).getKhuyenMai() > 0) { %>
                        <div class="img-product" style="position: relative; margin-right: 20px">
                            <img src=<%=Util.fullPath(cart.gioHang.get(i).getHinhAnh())%> alt="">
                            <div style="width: 20%; z-index: 999; position: absolute; top:0;right: 0">
                                <img src=<%=Util.fullPath("bookhome/img/sale.png")%> alt="">
                                <p style=" font-size: 10px; color : white;position: absolute; top:50% ;left: 50%; transform: translate(-50%,-50%);"><%=cart.gioHang.get(i).getKhuyenMai()%>%</p>
                            </div>
                        </div>
                        <% } else {%>
                        <div class="img-product" style="margin-right: 20px">
                            <img src=<%=Util.fullPath(cart.gioHang.get(i).getHinhAnh())%> alt="">
                        </div>
                        <% }%>
                        <div class="title-product">
                            <h4><a href="#"><%=cart.gioHang.get(i).getTenSach()%>
                            </a></h4>
                            <% if (cart.gioHang.get(i).getKhuyenMai() > 0) { %>
                            <p><span
                                    id="<%=cart.gioHang.get(i).getMaSach()%>"><%=cart.gioHang.get(i).getSoLuongMua()%></span>
                                x <%=cart.gioHang.get(i).tienKhuyenMai()%>.000đ <span style="color: black"
                                                                                      class="old-price"><%=cart.gioHang.get(i).getGia()%>.000đ</span>
                            </p>
                            <% } else {%>
                            <p><span
                                    id="<%=cart.gioHang.get(i).getMaSach()%>"><%=cart.gioHang.get(i).getSoLuongMua()%></span>
                                x <%=cart.gioHang.get(i).getGia()%>
                                .000đ</p>
                            <% }%>
                            <a href="<%=Util.fullPath("XoaKhoiGioHangController?maSach="+cart.gioHang.get(i).getMaSach())%>"><i
                                    class="flaticon-delete"></i></a>
                        </div>
                    </div>

                    <div class="quantity-product" style="width: 20%">
                        <span class="pull-left" id="quantity-wanted-p">
									<span class="dec qtybutton">-</span>
                                    <p style="display: none"><%=cart.gioHang.get(i).getMaSach()%></p>
									<input type="text" value="<%=cart.gioHang.get(i).getSoLuongMua()%>"
                                           class="cart-plus-minus-box">
									<span class="inc qtybutton">+</span>
								</span>
                    </div>
                </div>
                <%}%>
                <div class="shopingcart-bottom-area" style="margin-bottom: 30px;">
                    <a class="left-shoping-cart" href=<%=Util.fullPath("shop")%>>Tiếp tục mua sắm</a>
                    <div class="shopingcart-bottom-area pull-right">
                        <a class="right-shoping-cart" href="<%=Util.fullPath("clearAllProductController")%>">Xóa tất cả
                            sản phẩm</a>
                    </div>
                </div>
            </div>
            <%  int khuyenMai = 0;
                if(request.getAttribute("khuyenMai") != null){
                khuyenMai = (int) request.getAttribute("khuyenMai");
            }%>
            <div class="col-md-4 col-sm-12">
                <div class="subtotal-main-area">
                    <div class="subtotal-area">
                        <h2 style="padding: 20px">Tạm tính<span id="tamTinh"><%=cart.tongTien()%>.000đ</span></h2>
                    </div>
                    <%if (khuyenMai > 0) {%>
                    <div class="subtotal-area">
                        <h2 style="padding: 20px">Mã khuyến mãi<span id="tamTinh1"><%=khuyenMai%>%</span></h2>
                    </div>
                    <%}%>
                    <div class="subtotal-area">
                        <%if (khuyenMai > 0) {%>
                        <h2 style="font-size: 28px;padding: 20px">Tổng tiền<span id="tongTien1" style="color: #32b5f3;"><%=cart.tongTienKhuyenMai(khuyenMai)%>.000đ</span>
                        </h2>
                        <%} else {%>
                        <h2 style="font-size: 28px;padding: 20px">Tổng tiền<span id="tongTien" style="color: #32b5f3;"><%=cart.tongTien()%>.000đ</span>
                        </h2>
                        <%}%>
                    </div>
                    <p style="padding: 20px">Chúc quý khách mua hàng vui vẻ</p>
                </div>
                <div class="shopingcart-bottom-area" style="display: flex;
						justify-content: center;
						align-items: center;
						margin-bottom: 30px;">
                    <a class="left-shoping-cart" style="padding: 10px 60px;border-radius: 10px;"
                       href="<%=Util.fullPath("ThanhToanController?maGiamGia=")+khuyenMai%>">Thanh toán</a>
                </div>

                <div class="discount-main-area">
                    <div style="padding: 20px" class="discount-top">
                        <h3>Mã giảm giá</h3>
                        <p>Nhập mã giảm giá của bạn nếu có</p>
                    </div>
                    <form method="post" action=<%=Util.fullPath("MaGiamGiaController")%>>
                        <div style="padding: 20px" class="discount-middle">
                            <input type="text" name="codeSale" placeholder="Nhập mã giảm giá">
                            <input type="submit" value="Áp dụng">
                        </div>
                    </form>
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