<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.Sach" %>
<%@ page import="BEAN.TheLoaiSach" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Product</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">

    <meta name="msapplication-TileColor" content="#5bc0de"/>
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png"/>
    <style>
        .inp-form {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <%@include file="linkCSS.jsp" %>

</head>

<body class="  ">
<div class="bg-dark dk" id="wrap">
    <div id="top">
        <%@include file="header.jsp"%>
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
                <!-- /.main-search -->                                </div>
            <!-- /.search-bar -->
            <div class="main-bar">
                <h3>
                    <i class="fa fa-product-hunt"></i>&nbsp;
                    Product
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
                        <div class="box">
                            <header>
                                <div class="icons">
                                    <a data-toggle="modal" data-original-title="Add" data-placement="bottom"
                                       class="btn btn-default btn-sm" href="#addProduct">
                                        <i class="fa fa-plus"></i>
                                    </a>
                                </div>
                                <div class="icons">
                                    <form method="POST" enctype="multipart/form-data" action="AdAddProductController">
                                        File to upload: <input type="file" name="upfile"><br/>
                                        <br/>
                                        <input type="submit" value="Press"> to upload the file!
                                    </form>
                                </div>


                                <div style="margin-top: 10px; margin-left: 500px;">
                                    <p style="color:red">


                                    </p>

                                    <p style="color:green">


                                    </p>
                                </div>
                            </header>


                            <div id="collapse4" class="body">
                                <div id="dataTable_wrapper"
                                     class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div id="dataTable_filter" class="dataTables_filter" style="float: right;">
                                                <label>Search Name:<input type="text" id="search"
                                                                          class="form-control input-sm"
                                                                          onkeyup="searchProduct()" placeholder=""
                                                                          aria-controls="dataTable">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="dataTable"
                                                   class="table table-bordered table-condensed table-hover table-striped dataTable no-footer"
                                                   role="grid" aria-describedby="dataTable_info">
                                                <thead>
                                                <tr role="row">
                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Name: activate to sort column ascending"
                                                        style="width: 796px;">
                                                        Name
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Name: activate to sort column ascending"
                                                        style="width: 796px;">
                                                        Image
                                                    </th>

                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Options: activate to sort column ascending"
                                                        style="width: 195px;">Options
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <% ArrayList<Sach> listProduct = (ArrayList<Sach>) request.getAttribute("listProduct");
                                                    for (int i = 0; i < listProduct.size(); i++) {
                                                %>
                                                <tr role="row" class="odd">
                                                    <td><%=listProduct.get(i).getTenSach()%></td>
                                                    <td><img alt="img" style="height: 100px;width: 80px" src="<%=listProduct.get(i).getHinhAnh()%>"></td>
                                                    <td class="options-width">
                                                        <a href=<%=Util.fullPath("AdEditProduct?maSach=")+ listProduct.get(i).getMaSach()%> title="" data-placement="bottom"
                                                           data-original-title="Edit" data-toggle="tooltip"
                                                           class="btn btn-default btn-sm"><i class="fa fa-edit"></i></a>
                                                        <a href=<%=Util.fullPath("AdShowDetailController?maSach=")+ listProduct.get(i).getMaSach()%> title="" data-placement="bottom"
                                                           data-original-title="Show detail" data-toggle="tooltip"
                                                           class="btn btn-default btn-sm">  <i class="fa fa-eye"></i></a>
                                                        <a   onclick="return confirm('Are you sure to Remove?')" href="<%=Util.fullPath("AdDelProductController?maSach=")+listProduct.get(i).getMaSach()%>" title="" data-placement="bottom"
                                                             data-original-title="Remove" data-toggle="tooltip"
                                                             class="btn btn-default btn-sm"><i
                                                                class="fa fa-remove"></i></a>
                                                    </td>
                                                </tr>
                                                <%}%>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12" style="display: flex;justify-content: center">
                                            <div class="dataTables_paginate paging_simple_numbers"
                                                 id="dataTable_paginate">
                                                <ul class="pagination" style="float: right;">
                                                    <li class="paginate_button previous" id="dataTable_previous">
                                                        <a href=<%=Util.fullPath("AdProductController?page=")+1%> aria-controls="dataTable" data-dt-idx="0" tabindex="0">Previous</a></li>
                                                    <%
                                                        int pageActive = 1;
                                                        if (request.getParameter("page") != null) {
                                                            pageActive = Integer.parseInt(request.getParameter("page"));
                                                        }

                                                        int soTrang = (int) request.getAttribute("numberOfPage");
                                                        for (int i = 1; i <= soTrang; i++) {
                                                            if (i == pageActive) {
                                                    %>
                                                    <li class="paginate_button active"><a href=<%=Util.fullPath("AdProductController?page=")+i%> aria-controls="dataTable" data-dt-idx="1" tabindex="0"><%=i%></a></li>
                                                    <%}else {%>
                                                    <li class="paginate_button"><a href=<%=Util.fullPath("AdProductController?page=")+i%> aria-controls="dataTable" data-dt-idx="1" tabindex="0"><%=i%></a></li>
                                                    <%}}%>
                                                    <li class="paginate_button next" id="dataTable_next"><a href=<%=Util.fullPath("AdProductController?page=")+soTrang%> aria-controls="dataTable" data-dt-idx="2" tabindex="0">Next</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
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

<div id="addProduct" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title" style="color: lightblue"><span class="label label-default"> Add product </span>
                </h2>
            </div>

            <div class="modal-footer">
                <%ArrayList<TheLoaiSach> listType = (ArrayList<TheLoaiSach>) request.getAttribute("listType");%>
                <form action=<%=Util.fullPath("AdAddOneProductController")%>  method="post">
                    <div class="td">
                        <input type="number" class="inp-form" min="0" name="id" placeholder="ID" size="50">
                        <p style="color:red;">

                        </p>
                    </div>

                    <div class="td">
                        <input type="text" class="inp-form" name="name" placeholder="Name" size="50">
                        <p style="color:red;">

                        </p>
                    </div>
                    <div class="td">
                        <input type="file" class="img-form inp-form" placeholder="Image..." name="image" size="39">
                        <p style="color:red;">

                        </p>
                    </div>
                    <div class="td" style="display: table;margin: auto;margin-bottom: 10px;">
                        <select name="type">
                            <% for(int i = 0; i < listType.size(); i++){%>
                            <option value=<%=listType.get(i).getMaTheLoai()%>><%=listType.get(i).getTenTheLoai()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="td">
                        <input type="date" class="inp-form" name="date" placeholder="Date" size="50">

                        </p>
                    </div>
                    <div class="td">
                        <input type="text" class="inp-form" name="author" placeholder="Author" size="50">

                        </p>
                    </div>
                    <div class="td">
                        <input type="number" class="img-form inp-form" min="1" placeholder="Quantity" name="quantity" size="39">
                        <p style="color:red;">

                        </p>
                    </div>

                    <div class="td">
                        <textarea rows="10" cols="51" class="inp-form" name="description"
                                  placeholder="Description"></textarea>
                        <p style="color:red;">

                        </p>
                    </div>
                    <div class="td">
                        <input type="number" class="inp-form" min="0" name="price" placeholder="Price" size="50">
                        <p style="color:red;">

                        </p>
                    </div>

                    <div class="td">
                        <input type="number" class="inp-form" name="sale" min="0" placeholder="Sale" size="50">
                        <p style="color:red;">

                        </p>
                    </div>


                    <button type="submit" class="btn btn-default" value="" style="float:left"> OK</button>
                    <button type="reset" class="btn btn-default" style="float:left"> Reset</button>
                </form>
                <button type="button" class="btn btn-default" data-dismiss="modal"> Close</button>
            </div>
        </div>
    </div>
</div>


<%--            Search JavaScrip--%>
<script>
    function searchProduct() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("search");
        filter = input.value.toUpperCase();
        table = document.getElementById("dataTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>

</html>
