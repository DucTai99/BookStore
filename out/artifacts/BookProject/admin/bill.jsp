<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.Bill" %>
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
    <title>Bill</title>
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
                <!-- /.main-search -->                                </div>
            <!-- /.search-bar -->
            <div class="main-bar">
                <h3>
                    <i class="fa fa-clone"></i>&nbsp;
                    Bill
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
                            </header>


                            <div id="collapse4" class="body">
                                <div id="dataTable_wrapper"
                                     class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div id="dataTable_filter" class="dataTables_filter" style="float: right;">
                                                <label>Search UserEmail:<input type="text" id="searchBill"
                                                                               onkeyup="searchBill()"
                                                                               class="form-control input-sm"
                                                                               placeholder="" aria-controls="dataTable">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="div_print" class="row">
                                        <div class="col-sm-12">
                                            <table id="dataTable"
                                                   class="table table-bordered table-condensed table-hover table-striped dataTable no-footer"
                                                   role="grid" aria-describedby="dataTable_info">
                                                <thead>
                                                <tr role="row">
                                                    <th class="sorting_asc" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1" aria-sort="ascending"
                                                        aria-label="ID: activate to sort column descending"
                                                        style="width: 135px;">
                                                        ID
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Name: activate to sort column ascending"
                                                        style="width: 796px;">
                                                        UserEmail
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Options: activate to sort column ascending"
                                                        style="width: 195px;">Options
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    ArrayList<Bill> listBill = (ArrayList<Bill>) request.getAttribute("listBill");
                                                    for (int i = 0; i < listBill.size(); i++) {
                                                %>
                                                <tr role="row" class="odd">
                                                    <td class="sorting_1"><%=listBill.get(i).getId()%></td>
                                                    <td><%=listBill.get(i).getUseremail()%></td>
                                                    <td class="options-width">
                                                        <a href=<%=Util.fullPath("AdShowBillDetail?idBill=")+listBill.get(i).getId()%>  data-placement="bottom"
                                                           data-original-title="Show bill detail" data-toggle="tooltip"
                                                           class="btn btn-default btn-sm">  <i class="fa fa-eye"></i></a>
                                                        <a  onclick="return confirm('Are you sure to Remove?')" href=<%=Util.fullPath("AdDelBill?idBill=")+listBill.get(i).getId()%> title="" data-placement="bottom"
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
    function searchBill() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchBill");
        filter = input.value.toUpperCase();
        table = document.getElementById("dataTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
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
    function printElement(elem) {
        var divPrint = document.getElementById(elem);
        var WindowPrint = window.open('','','left=0;top=0;width=1100;height:600');
        WindowPrint.document.write(divPrint.innerHTML);
        WindowPrint.document.close();
        WindowPrint.focus();
        WindowPrint.print();
    }
</script>

</body>

</html>
