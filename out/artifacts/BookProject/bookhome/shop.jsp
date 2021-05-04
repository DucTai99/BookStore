<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<%@ page import="BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.TheLoaiSach" %>
<%@ page import="BEAN.Sach" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop || Witter Multipage Responsive Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="link.jsp" %>
</head>
<body>
<!-- Add your site or application content here -->
<!--Header Area Start-->
<%@ include file="header.jsp" %>
<!--Header Area End-->
<!-- Breadcrumbs Area Start -->
<div class="breadcrumbs-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcrumbs">
                    <h2>Danh Mục Sách</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Quay lại trang chủ" href="index.jsp">Trang chủ </a>
                        </li>
                        <li>Sách</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Shop Area Start -->
<div class="shopping-area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="shop-widget">
                    <div class="shop-widget-top">
                        <aside class="widget widget-categories">
                            <h2 class="sidebar-title text-center">Danh mục</h2>
                            <ul class="sidebar-menu">
                                <li>
                                    <a href=<%=Util.fullPath("shop")%>>
                                        <i class="fa fa-angle-double-right"></i> Tất cả
                                    </a>
                                </li>
                                <li>
                                    <a href=<%=Util.fullPath("shop?type=" + 0)%>>
                                        <i class="fa fa-angle-double-right"></i> Khuyến mãi
                                    </a>
                                </li>
                                <%
                                    ArrayList<TheLoaiSach> listTheLoai = (ArrayList<TheLoaiSach>) request.getAttribute("listTheLoai");
                                    for (int i = 0; i < listTheLoai.size(); i++) {


                                %>
                                <li>
                                    <a href=<%=Util.fullPath("shop?type=" + listTheLoai.get(i).getMaTheLoai())%>>
                                        <i class="fa fa-angle-double-right"></i>
                                        <%= listTheLoai.get(i).getTenTheLoai()%>
                                    </a>
                                </li>
                                <% } %>
                            </ul>
                        </aside>
                        <aside class="widget shop-filter">
                            <h2 class="sidebar-title text-center">Giá</h2>
                            <div class="info-widget">
                                <div class="price-filter">
                                    <div id="slider-range"></div>
                                    <div class="price-slider-amount">
                                        <input type="text" id="amount" name="price" placeholder="Add Your Price"/>
                                        <div class="widget-buttom">
                                            <input type="submit" value="Tìm Kiếm"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>
<%--                    <div class="shop-widget-bottom">--%>
<%--                        <aside class="widget widget-seller">--%>
<%--                            <h2 class="sidebar-title">Bán chạy nhát</h2>--%>
<%--                            <div class="single-seller">--%>
<%--                                <div class="seller-img">--%>
<%--                                    <img src=<%=Util.fullPath("bookhome/img/shop/phailongvoicodon-tk.jpeg")%> alt=""/>--%>
<%--                                </div>--%>
<%--                                <div class="seller-details">--%>
<%--                                    <a href="shop.jsp"><h5>Phải lòng với cô đơn</h5></a>--%>
<%--                                    <h5>70.000đ</h5>--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="single-seller">--%>
<%--                                <div class="seller-img">--%>
<%--                                    <img src=<%=Util.fullPath("bookhome/img/shop/rungnauy-tk.jpeg")%> alt=""/>--%>
<%--                                </div>--%>
<%--                                <div class="seller-details">--%>
<%--                                    <a href=""><h5>Rừng Na-uy</h5></a>--%>
<%--                                    <h5>100.000đ</h5>--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                        <li><i class="fa fa-star icolor"></i></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </aside>--%>
<%--                    </div>--%>
                </div>
            </div>
            <div id="items" class="col-md-9 col-sm-9 col-xs-12">
                <div class="shop-tab-area">
                    <div class="shop-tab-list">
                        <div class="shop-tab-pill pull-left">
                            <ul>
                                <li class="active" id="left"><a data-toggle="pill" href="#home"><i class="fa fa-th"></i></a>
                                </li>
                                <li><a data-toggle="pill" href="#menu1"><i class="fa fa-th-list"></i></a></li>
                            </ul>
                        </div>
                        <%--                            <div class="shop-tab-pill pull-right">--%>
                        <%--                                <ul>--%>
                        <%--                                    <li class="product-size-deatils">--%>
                        <%--                                        <div class="show-label">--%>
                        <%--                                            <label><i class="fa fa-sort-amount-asc"></i>Sắp xếp theo : </label>--%>
                        <%--                                            <select>--%>
                        <%--                                                <option value="New" selected="selected">Mục mới nhất</option>--%>
                        <%--                                                <option value="Name">Xếp theo Tên</option>--%>
                        <%--                                                <option value="Price">Xếp theo Giá</option>--%>
                        <%--                                            </select>--%>
                        <%--                                        </div>--%>
                        <%--                                    </li>--%>
                        <%--                                </ul>--%>
                        <%--                            </div>--%>
                        <div class="search-book">
                            <form name="SearchArea" class="form-inline">
                                <input onkeyup="search()" class="form-control mr-sm-2" type="text" name="searchBox"
                                       placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i
                                        class="fas fa-search"></i></button>
                            </form>
                            <div id="search"></div>
                        </div>

                    </div>
                    <div class="tab-content">
                        <div class="row tab-pane fade in active" id="home">
                            <div>
                                <%--                                <div id="pagination-1" class="pagination__list">--%>
                                <%ArrayList<Sach> listSach = (ArrayList<Sach>) request.getAttribute("listSach");%>
                                <%
                                    for (int i = 0; i < listSach.size(); i++) {
                                %>
                                <div class="shop-single-product-area">
                                    <div class="col-md-4 col-sm-6">
                                        <div class="single-banner">
                                            <div class="product-wrapper">
                                                <a href=<%= Util.fullPath("singleProductController?idProduct=")+listSach.get(i).getMaSach()%> class="single-banner-image-wrapper">
                                                    <img alt="" src="<%=listSach.get(i).getHinhAnh()%>">
                                                </a>
                                                <div class="product-description">
                                                    <div class="functional-buttons">
                                                        <a title="Thêm vào giỏ hàng"
                                                           href=<%=Util.fullPath("GioHangController?maSach=" + listSach.get(i).getMaSach())%>>
                                                            <i class="fa fa-shopping-cart"></i>
                                                        </a>
                                                        <a href="<%=Util.fullPath("ThemVaoWishListController?maSach=" + listSach.get(i).getMaSach())%>" title="Thêm vào danh sách yêu thích">
                                                            <i class="far fa-heart"></i>
                                                        </a>
                                                        <a href="#" title="Xem nhanh" data-toggle="modal"
                                                           data-target="#productModal<%=listSach.get(i).getMaSach()%>">
                                                            <i class="fas fa-compress-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <% if (listSach.get(i).getKhuyenMai() > 0) { %>
                                            <div style="width: 15%; z-index: 999; position: absolute; top:0;right: 0">
                                                <img src=<%=Util.fullPath("bookhome/img/sale.png")%> alt="">
                                                <p style="font-size:14px;position: absolute;left: 15%; top: 55%; transform: translate(0, -50%);color: white;">
                                                    <%=listSach.get(i).getKhuyenMai()%>%</p>
                                            </div>
                                            <div class="banner-bottom text-center">
                                                <div class="banner-bottom-title" style="height: 40px">
                                                    <a href=<%= Util.fullPath("singleProductController?idProduct=") + listSach.get(i).getMaSach()%>><%=listSach.get(i).getTenSach()%>
                                                    </a>
                                                </div>
                                                <div style="color: #32b5f3" class="price-2"><%=listSach.get(i).tienKhuyenMai()%>.000đ
                                                    <span style="color: black" class="old-price"><%=listSach.get(i).getGia()%>.000đ</span>
                                                </div>
                                            </div>
                                            <% } else {%>
                                            <div class="banner-bottom text-center">
                                                <div class="banner-bottom-title" style="height: 40px">
                                                    <a href=<%= Util.fullPath("singleProductController?idProduct=") + listSach.get(i).getMaSach()%>><%=listSach.get(i).getTenSach()%>
                                                    </a>
                                                </div>
                                                <div style="color: #32b5f3" class="price-2"><%=listSach.get(i).getGia()%>.000<span>đ</span>
                                                </div>
                                            </div>
                                            <% }%>

                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <%--                                </div>--%>
                            </div>

                        </div>

                        <div id="menu1" class="tab-pane fade">
                            <div id="single-product" class="row">
                                <%
                                    for (int i = 0; i < listSach.size(); i++) {
                                %>
                                <div class="single-shop-product">
                                    <div class="col-xs-12 col-sm-5 col-md-4">
                                        <div class="left-item">
                                            <a href="single-product.jsp" title="<%=listSach.get(i).getTenSach()%>">
                                                <img src="<%=listSach.get(i).getHinhAnh()%>" alt="">
                                            </a>
                                        </div>
                                        <% if (listSach.get(i).getKhuyenMai() > 0) { %>
                                            <div style="width: 15%; z-index: 999; position: absolute; top:0;right: 0">
                                                <img src=<%=Util.fullPath("bookhome/img/sale.png")%> alt="">
                                                <p style="font-size:14px;position: absolute;left: 15%; top: 55%; transform: translate(0, -50%);color: white;">
                                                <%=listSach.get(i).getKhuyenMai()%>%</p>
                                            </div>
                                        <%}%>
                                    </div>
                                    <div class="col-xs-12 col-sm-7 col-md-8">
                                        <div class="deal-product-content">
                                            <h4>
                                                <a href="single-product.jsp"
                                                   title="<%=listSach.get(i).getTenSach()%>"><%=listSach.get(i).getTenSach()%>
                                                </a>
                                            </h4>
                                            <div class="product-price">
                                                <% if (listSach.get(i).getKhuyenMai() > 0) { %>
                                                <span class="new-price"><%=listSach.get(i).tienKhuyenMai()%>.000đ</span>
                                                <span class="old-price"><%=listSach.get(i).getGia()%>.000đ</span>
                                                <%} else {%>
                                                <span class="new-price"><%=listSach.get(i).getGia()%>.000đ</span>
                                                <%}%>
                                            </div>
                                            <p><%=listSach.get(i).getMoTa()%>
                                            </p>
                                            <div class="availability">
                                                <span><a
                                                        href=<%=Util.fullPath("GioHangController?maSach=" + listSach.get(i).getMaSach())%>>Mua Ngay</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: center">
                            <nav aria-label="Page navigation example" style="margin: auto">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="<%=Util.fullPath("shop?page=" + 1 + (request.getAttribute("type") == null ? "" : "&type=" + request.getAttribute("type")) + "#items")%>"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <%
                                        int pageActive = 1;
                                        if (request.getParameter("page") != null) {
                                            pageActive = Integer.parseInt(request.getParameter("page"));
                                        }

                                        int soTrang = (int) request.getAttribute("soTrang");
                                        for (int i = 1; i <= soTrang; i++) {
                                            if (i == pageActive) {
                                    %>
                                    <li class="page-item"><a class="page-link" style="background: #32b5f3; color: white"
                                                             href=<%=Util.fullPath("shop?page=" + i + (request.getAttribute("type") == null ? "" : "&type=" + request.getAttribute("type")) + "#items")%>><%=i%>
                                    </a></li>

                                    <%} else {%>
                                    <li class="page-item"><a class="page-link"
                                                             href=<%=Util.fullPath("shop?page=" + i + (request.getAttribute("type") == null ? "" : "&type=" + request.getAttribute("type")) + "#items")%>><%=i%>
                                    </a></li>

                                    <%
                                            }
                                        }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="<%=Util.fullPath("shop?page=" + soTrang + (request.getAttribute("type") == null ? "" : "&type=" + request.getAttribute("type")) + "#items")%>"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Shop Area End -->


<!-- Footer Area Start -->
<%@ include file="footer.jsp" %>
<!-- Footer Area End -->
<!--Quickview Product Start -->
<%
    for (int i = 0; i < listSach.size(); i++) {
%>
<div id="quickview-wrapper">
    <%--    <!-- Modal -->--%>
    <div class="modal fade" id="productModal<%=listSach.get(i).getMaSach()%>" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="modal-product" style="display: flex">
                        <div class="product-images" style="width: 60%">
                            <div class="main-image images" style="position: relative">
                                <img alt="" src=<%=Util.fullPath(listSach.get(i).getHinhAnh())%>>
                                <% if (listSach.get(i).getKhuyenMai() > 0) { %>
                                <div style="width: 18%; z-index: 999; position: absolute; top:0;right: 0">
                                    <img src=<%=Util.fullPath("bookhome/img/sale.png")%> alt="">
                                    <p style=" font-size: 18px; color : white;position: absolute; top:50% ;left: 50%; transform: translate(-50%,-50%);"><%=listSach.get(i).getKhuyenMai()%>%</p>
                                </div>
                                <% }%>
                            </div>
                        </div>
                        <div class="product-info">
                            <h1 style="font-size: 22px"><%=listSach.get(i).getTenSach()%>
                            </h1>
                            <div class="price-box">
                                <% if (listSach.get(i).getKhuyenMai() > 0) { %>
                                <p class="s-price"><span class="special-price"><span
                                        class="amount" style="font-size: 25px"><%=listSach.get(i).tienKhuyenMai()%>.000đ</span></span>
                                    <span style="color: black" class="old-price"><%=listSach.get(i).getGia()%>.000đ</span>
                                </p>
                                <% } else {%>
                                <p class="s-price"><span class="special-price"><span
                                        class="amount" style="font-size: 25px"><%=listSach.get(i).getGia()%>.000đ</span></span>
                                </p>
                                <% }%>
                            </div>
                            <a href="<%= Util.fullPath("singleProductController?idProduct=")+listSach.get(i).getMaSach()%>"
                               class="see-all">Xem chi tiết</a>
                            <div class="quick-add-to-cart">
                                <a style="display: flex;justify-content: center;align-items: center;"
                                   class="single_add_to_cart_button"
                                   href=<%=Util.fullPath("GioHangController?maSach=" + listSach.get(i).getMaSach())%>>Mua
                                    Ngay</a>
                            </div>
                            <div style="height: 300px; overflow-y: scroll" class="quick-desc">
                                <%=listSach.get(i).getMoTa()%>
                            </div>
                        </div><!-- .product-info -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%}%>
<!--End of Quickview Product-->

<%--Start of search--%>

<script type="text/javascript">
    function search() {
        var xhttp;
        var name = document.SearchArea.searchBox.value;

        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {
                var data = xhttp.responseText;
                document.getElementById("search").innerHTML = data;
                document.getElementById("search").style.opacity = 1;
                document.getElementById("search").style.visibility = "visible";
                document.getElementById("search").style.transform = "scaleY(1)";
            }
        }
        xhttp.open("POST", "http://localhost:8080/BookProject/SearchController?name=" + name, true);
        xhttp.send();
    }
</script>
<%--End of search--%>

<%@ include file="script.jsp" %>


</body>
</html>