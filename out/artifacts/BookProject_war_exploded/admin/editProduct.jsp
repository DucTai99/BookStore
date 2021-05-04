<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.TheLoaiSach" %>
<%@ page import="BEAN.Sach" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">

    <meta name="msapplication-TileColor" content="#5bc0de"/>
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png"/>
    <style>
        .td > p {
            font-weight: bold;
        }
    </style>
    <%@include file="linkCSS.jsp" %>
</head>

<body class="  ">
<div class="bg-dark dk" id="wrap">
    <div id="top">
        <%@include file="header.jsp" %>
        <header class="head">
            <div class="search-bar">
                <form class="main-search" action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search ...">
                        <span class="input-group-btn">
                                                <button class="btn btn-primary btn-sm text-muted" type="button">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </span>
                    </div>
                </form>
                <!-- /.main-search -->   </div>
            <div class="main-bar">
                <h3>
                    <i class="fa fa-product-hunt"></i>&nbsp;
                    Edit Product
                </h3>
            </div>
            <!-- /.main-bar -->
        </header>
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <%@include file="leftMenu.jsp" %>
    <!-- content-right -->
    <div id="content">
        <div class="outer">
            <div class="inner bg-light lter">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="">
                            <header>
                                <div class="icons">
                                    <h2><span class="label label-default"> Edit Product </span></h2>
                                </div>
                            </header>

                            <div id="collapse4" class="body">
                                <form action=<%=Util.fullPath("AdDoEditProductController")%> method="post">
                                    <% ArrayList<TheLoaiSach> listBookType = (ArrayList<TheLoaiSach>) request.getAttribute("listBookType");
                                        Sach sach = (Sach) request.getAttribute("sach");
                                    %>
                                    <input type="hidden" name="" value="">
                                    <div class="td">
                                        <p id="edit_id">ID</p>
                                        <input readonly type="text" class="inp-form" name="edit_id" size="50"
                                               value="<%=sach.getMaSach()%>">
                                    </div>


                                    <div class="td">

                                        <p>Name</p>
                                        <%--                                        <textarea class="inp-form" name="edit_Name" size="50"--%>

                                        <%--                                                  ><%=sach.getTenSach()%></textarea>--%>
                                        <input type="text" class="inp-form" name="edit_Name" size="50"

                                               value="<%=sach.getTenSach()%>">


                                    </div>
                                    <div class="td">
                                        <p>Image</p>
                                        <input type="file" size="30" name="edit_img"
                                               datasrc="<%=Util.fullPath(sach.getHinhAnh())%>">

                                    </div>


                                    <div class="td">
                                        <p>Author</p>
                                        <input type="text" class="inp-form" name="edit_author" size="50"
                                               value="<%=sach.getTenTacGia()%>">

                                    </div>
                                    <div class="td">
                                        <p>Quantity</p>
                                        <input type="text" class="inp-form" name="edit_quantity" size="50"
                                               value="<%=sach.getSoLuong()%>">

                                    </div>

                                    <div class="td">
                                        <p>Type</p>
                                        <select name="selectType">
                                            <%
                                                for (int i = 0; i < listBookType.size(); i++) {
                                            %>
                                            <option value="<%=listBookType.get(i).getMaTheLoai()%>"><%=listBookType.get(i).getTenTheLoai()%>
                                            </option>

                                            <%}%>
                                        </select>

                                    </div>
                                    <div class="td">

                                        <p>Description</p>
                                        <textarea name="edit_description" id="contentDetails" rows="10"
                                                  cols="80"><%=sach.getMoTa()%></textarea>
                                    </div>

                                    <div class="td">
                                        <p>Price</p>
                                        <input type="text" class="inp-form" name="edit_price" size="50"
                                               value="<%=sach.getGia()%>">

                                    </div>

                                    <div class="td">
                                        <p>Sale</p>
                                        <input type="text" class="inp-form" name="edit_sale" size="50"
                                               value="<%=sach.getKhuyenMai()%>">

                                    </div>
                                    <br>


                                    <div class="ac">
                                        <button type="reset" class="btn btn-default" style="float: left"> Reset</button>
                                    </div>
                                    <div class="ac">

                                        <button type="submit" class="btn btn-default" value=""
                                                style="margin-left: 15px"> OK
                                        </button>
                                    </div>


                                </form>


                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /#right -->
</div>
<!-- /#wrap -->
<%@include file="footer.jsp" %>

<script>
    var f = CKEDITOR.replace("contentDetails");
</script>

</body>

</html>
