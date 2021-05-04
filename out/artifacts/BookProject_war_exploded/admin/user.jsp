<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.User" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>User</title>

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
                <!-- /.main-search -->   </div>
            <!-- /.search-bar -->
            <dv class="main-bar">
                <h3>
                    <i class="fa fa-user"></i>&nbsp;
                    User
                </h3>
            </dv>
            <!-- /.main-bar -->
        </header>
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <%--                   left--%>
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
                                       class="btn btn-default btn-sm" href="#addUser">
                                        <i class="fa fa-plus"></i>
                                    </a>
                                </div>
                                <div class="icons">
                                    <a data-toggle="modal" data-original-title="Print" data-placement="bottom"
                                       class="btn btn-default btn-sm" href="javascript:void(0)"
                                       onclick="In_Content('right')">
                                        <i class="fa fa-print"></i>
                                    </a>
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
                                                <label>Search Email:<input type="text" id="searchUser"
                                                                           onkeyup="searchUser()"
                                                                           class="form-control input-sm" placeholder=""
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
                                                        aria-label="Email: activate to sort column ascending"
                                                        style="width: 796px;">
                                                        Email
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Email: activate to sort column ascending"
                                                        style="width: 796px;">
                                                        Level
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="dataTable"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Email: activate to sort column ascending"
                                                        style="width: 796px;">
                                                        Active
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
                                                    ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
                                                    for (int i = 0; i < listUser.size(); i++) {

                                                %>
                                                <tr role="row" class="odd">

                                                    <td><%=listUser.get(i).getEmail()%>
                                                    </td>
                                                    <%int level = listUser.get(i).getLevel();
                                                    %>
                                                    <% if(level == 0) {%>
                                                    <td>User</td>
                                                    <%}else if(level == 2) {%>
                                                    <td style="color: red;font-weight: bold">Admin</td>
                                                    <%} else if(level == 1){  %>
                                                    <td style="color: green;font-weight: bold">Staff</td>
                                                    <%}%>

                                                    <%int active = listUser.get(i).getActive();%>
                                                    <td>
                                                        <% if (active == 0) {%>
                                                        <i class="fa fa-times" style="color: red;font-size: 30px"></i>
                                                        <%} else {%>
                                                        <i class="fa fa-check" style="color: green;font-size: 30px"></i>
                                                        <%}%>
                                                    </td>
                                                    <td class="options-width">
                                                        <div>
                                                            <a href=<%=Util.fullPath("AdEditUserController?userId=")+ listUser.get(i).getId()%> title=""
                                                               data-placement="bottom" data-original-title="Edit"
                                                               data-toggle="tooltip" class="btn btn-default btn-sm"><i
                                                                    class="fa fa-edit"></i></a>
                                                            <a onclick="return confirm('Are you sure to Remove?')"
                                                               href=<%=Util.fullPath("AdDelUserController?userId=")+listUser.get(i).getId()%>    data-placement="bottom"
                                                               data-original-title="Remove" data-toggle="tooltip"
                                                               class="btn btn-default btn-sm"><i
                                                                    class="fa fa-remove"></i></a>
                                                        </div>


                                                    </td>

                                                </tr>
                                                <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">


                                    </div>
                                    <div class="col-sm-12">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                            <ul class="pagination" style="float: right;">
                                                <li class="paginate_button previous disabled" id="dataTable_previous">
                                                    <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0">Previous</a>
                                                </li>
                                                <li class="paginate_button active"><a href="#" aria-controls="dataTable"
                                                                                      data-dt-idx="1" tabindex="0">1</a>
                                                </li>
                                                <li class="paginate_button next disabled" id="dataTable_next"><a
                                                        href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0">Next</a>
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
<%@include file="footer.jsp" %>
<div id="addUser" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title" style="color: lightblue"><span class="label label-default"> Add User </span>
                </h2>
            </div>

            <div class="modal-footer">

                <form action="AddUser" method="post">
                    <div class="td">
                        <input type="text" class="inp-form" name="id" placeholder="ID" size="50">
                        <p style="color:red;">

                        </p>
                    </div>

                    <div class="td">
                        <input type="text" class="inp-form" name="email" placeholder="Email" size="50">
                        <p style="color:red;">

                        </p>
                    </div>
                    <div class="td">
                        <input type="text" class="inp-form" name="level" placeholder="Level" size="50">
                        <p style="color:red;">

                        </p>
                    </div>
                    <div class="td">
                        <input type="text" class="inp-form" name="active" placeholder="Active" size="50">
                        <p style="color:red;">

                        </p>
                    </div>
                    <br>
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
    function searchUser() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchUser");
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

    >
    <
    /body>

    < /html>
