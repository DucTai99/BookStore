<%@ page import="Util.Util" %>

<%@ page import="BEAN.User" %>
<%@ page import="DAO.GioHangDAO" %>
<%@ include file="link.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--Header Area Start-->
<div class="header-area">
    <div class="container">
        <div class="row header-header">
            <div class="col-md-2 col-sm-6 col-xs-6">
                <div class="header-logo">
                    <a href=<%=Util.fullPath("IndexController")%>>
                        <img src=<%=Util.fullPath("bookhome/img/logo.png")%> alt="">
                    </a>
                </div>
            </div>
            <div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
                <div class="header-right">
                    <ul>
                        <li class="user-login">
                            <a href="#">
                                <i class="flaticon-people"></i>
                            </a>

                            <div class="sub-user">
                                <%
                                    User user = (User) session.getAttribute("user");
                                    GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
                                    if (user == null) {%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-user-plus"></i> <a
                                            href=<%=Util.fullPath("bookhome/signup.jsp")%>>Đăng kí</a></div>
                                </div>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-sign-in-alt"></i> <a
                                            href=<%=Util.fullPath("bookhome/login.jsp")%>>Đăng nhập</a></div>
                                </div>
                                <%} else {%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="flaticon-people"></i> <a
                                            href=<%=Util.fullPath("MyAccountController")%>>Xin chào
                                        <%
                                            out.print(user.getEmail());
                                        %>
                                    </a>
                                    </div>
                                </div>
                                <%if(user.getLevel()>=2){%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-user-cog"></i> <a
                                            href=<%=Util.fullPath("AdLogoController")%>>Admin</a></div>
                                </div>
                                <%}%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-sign-out-alt"></i> <a
                                            href=<%=Util.fullPath("LogOut")%>>Đăng
                                        xuất</a></div>
                                </div>
                                <div class="user-item">
                                    <div class="listwish"><i class="far fa-heart"></i><a
                                            href="<%=Util.fullPath("WishListController")%>">Theo dõi</a></div>
                                </div>
                                <%}%>
                            </div>
                        </li>
                        <% if(cart != null){%>
                        <li class="shoping-cart">
                            <a href="#">
                                <i class="flaticon-shop"></i>
                                <%if(cart.tongSoLuongMua() > 0){%>
                                <span><%=cart.tongSoLuongMua()%></span>
                                <%}%>
                            </a>
                            <%if(cart.tongSoLuongMua() > 0){%>
                            <div class="add-to-cart-product">
                                <div style="max-height: 300px;overflow-y: scroll">
                                    <% for (int i = 0; i < cart.gioHang.size(); i++) {%>
                                    <div class="cart-product">
                                        <div class="cart-product-image" style="position: relative">
                                            <a href="single-product.jsp">
                                                <img src=<%=Util.fullPath(cart.gioHang.get(i).getHinhAnh())%> alt="">
                                            </a>
                                        </div>
                                        <div class="cart-product-info">
                                            <a href="single-product.jsp"><%=cart.gioHang.get(i).getTenSach()%></a>
                                            <p class="cart-price">
                                                <% if (cart.gioHang.get(i).getKhuyenMai() > 0) { %>
                                                <b id="<%=cart.gioHang.get(i).getMaSach()%>1" style="font-weight: 100"><%=cart.gioHang.get(i).getSoLuongMua()%></b><span>x</span><span><%=cart.gioHang.get(i).tienKhuyenMai()%>.000đ</span>
                                                <span style="color: black; font-size: 13px" class="old-price"><%=cart.gioHang.get(i).getGia()%>.000đ</span>
                                                <%} else {%>
                                                <span><%=cart.gioHang.get(i).getSoLuongMua()%></span><span>x</span><span><%=cart.gioHang.get(i).getGia()%>.000đ</span>
                                                <%}%>
                                            </p>
                                        </div>
                                        <a href="../XoaKhoiGioHangController?maSach=<%=cart.gioHang.get(i).getMaSach()%>">
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </a>
                                    </div>
                                    <%}%>
                                </div>
                                <div class="total-cart-price">
                                    <div class="cart-product-line">
                                        <span>Tổng Cộng :</span>
                                        <span id="total"><%=cart.tongTien()%>.000đ</span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href=<%=Util.fullPath("bookhome/cart.jsp")%>>
                                        Thanh Toán
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                            <%}%>
                        </li>
                        <%} else {%>
                        <li class="shoping-cart">
                            <a href="#">
                                <i class="flaticon-shop"></i>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-12 hidden-xs">
                <div class="mainmenu text-center">
                    <nav>
                        <ul id="nav">
                            <li><a href=<%=Util.fullPath("shop")%>>Sách</a></li>
                            <li><a href=<%=Util.fullPath("shop?type=0")%>>Khuyến mãi</a></li>
                            <li><a href="#footer">Liên Hệ</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-md-1 hidden-sm">
                <div class="header-right">
                    <ul>
                        <li class="user-login">
                            <a>
                                <i class="flaticon-people"></i>
                            </a>
                            <div class="sub-user">
                                <%if (user == null) {%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-user-plus"></i> <a
                                            href=<%=Util.fullPath("bookhome/signup.jsp")%>>Đăng kí</a></div>
                                </div>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-sign-in-alt"></i> <a
                                            href=<%=Util.fullPath("bookhome/login.jsp")%>>Đăng nhập</a></div>
                                </div>
                                <%} else {%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="flaticon-people"></i> <a
                                            href=<%=Util.fullPath("MyAccountController")%>>Xin chào
                                        <%
                                            out.print(user.getEmail());
                                        %>
                                    </a>
                                    </div>
                                </div>
                                <%if(user.getLevel()>=2){%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-user-cog"></i> <a
                                            href=<%=Util.fullPath("AdLogoController")%>>Admin</a></div>
                                </div>
                                <%}%>
                                <div class="user-item">
                                    <div class="sign-in"><i class="fas fa-sign-out-alt"></i> <a
                                            href=<%=Util.fullPath("LogOut")%>>Đăng
                                        xuất</a></div>
                                </div>
                                <div class="user-item">
                                    <div class="listwish"><i class="far fa-heart"></i><a
                                            href="<%=Util.fullPath("WishListController")%>">Theo dõi</a></div>
                                </div>
                                <%}%>
                            </div>
                        </li>
                        <% if(cart != null){%>
                        <li class="shoping-cart">
                            <a href="#">
                                <i class="flaticon-shop"></i>
                                <%if(cart.tongSoLuongMua() > 0){%>
                                <span id="tongSoLuong"><%=cart.tongSoLuongMua()%></span>
                                <%}%>
                            </a>
                            <%if(cart.tongSoLuongMua() > 0){%>
                            <div class="add-to-cart-product">
                                <div style="max-height: 300px;overflow-y: scroll">
                                    <% for (int i = 0; i < cart.gioHang.size(); i++) {%>
                                    <div class="cart-product">
                                        <div class="cart-product-image" style="position: relative">
                                            <a href="single-product.jsp">
                                                <img src=<%=Util.fullPath(cart.gioHang.get(i).getHinhAnh())%> alt="">
                                            </a>
                                        </div>
                                        <div class="cart-product-info">
                                            <a href="single-product.jsp"><%=cart.gioHang.get(i).getTenSach()%></a>
                                            <p class="cart-price">
                                                <% if (cart.gioHang.get(i).getKhuyenMai() > 0) { %>
                                                <b id="<%=cart.gioHang.get(i).getMaSach()%>11" style="font-weight: 100"><%=cart.gioHang.get(i).getSoLuongMua()%></b><span>x</span><span><%=cart.gioHang.get(i).tienKhuyenMai()%>.000đ</span>
                                                <span style="color: black; font-size: 13px" class="old-price"><%=cart.gioHang.get(i).getGia()%>.000đ</span>
                                                <%} else {%>
                                                <span><%=cart.gioHang.get(i).getSoLuongMua()%></span><span>x</span><span><%=cart.gioHang.get(i).getGia()%>.000đ</span>
                                                <%}%>
                                            </p>
                                        </div>
                                        <a href="../XoaKhoiGioHangController?maSach=<%=cart.gioHang.get(i).getMaSach()%>">
                                            <div class="cart-product-remove">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </a>
                                    </div>
                                    <%}%>
                                </div>
                                <div class="total-cart-price">
                                    <div class="cart-product-line">
                                        <span>Tổng Cộng :</span>
                                        <span id="total1"><%=cart.tongTien()%>.000đ</span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href=<%=Util.fullPath("bookhome/cart.jsp")%>>
                                        Thanh Toán
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                            <%}%>
                        </li>
                        <%} else {%>
                        <li class="shoping-cart">
                            <a href="#">
                                <i class="flaticon-shop"></i>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Header Area End-->
<!-- Mobile Menu Start -->
<div class="mobile-menu-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="mobile-menu">
                    <nav id="dropdown">
                        <ul>
                            <li><a href=<%=Util.fullPath("shop")%>>Sách</a></li>
                            <li><a href=<%=Util.fullPath("shop?type=0")%>>Khuyến mãi</a></li>
                            <li><a href="#footer">Liên Hệ</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mobile Menu End -->
