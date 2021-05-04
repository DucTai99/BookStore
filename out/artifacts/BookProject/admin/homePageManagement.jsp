<%@ page import="BEAN.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.Logo" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>HomePage Information</title>

    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">

    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />
    <%@include file="linkCSS.jsp"%>


</head>

<body class="  ">
<div class="bg-dark dk" id="wrap">
    <div id="top">
        <%@include file="header.jsp"%>
        <%
            //phân quyền
            User user = (User) session.getAttribute("user");
            if(user==null || user.getLevel()<2){
                response.sendRedirect(Util.fullPath("bookhome/authenticateError.jsp"));
            }%>

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
                    <i class="fa fa-info-circle"></i>&nbsp;
                    Information
                </h3>
            </div>
            <!-- /.main-bar -->
        </header>
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <%--                 left--%>
    <%@include file="leftMenu.jsp"%>


    <!-- content-right -->

    <div id="content">
        <div class="outer">
            <div class="inner bg-light lter">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="box">

                            <div id="collapse4" class="body">
                                <div id="dataTable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                                    <div class="row"><div class="col-sm-12">
                                        <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                                            <h4><b>Logo Management</b></h4>
                                            <%ArrayList<Logo> listLogo = (ArrayList<Logo>) request.getAttribute("listLogo");%>

                                            <thead>

                                            <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 135px;">
                                                ID</th>

                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 796px;">
                                                    Image</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Options: activate to sort column ascending" style="width: 195px;">Options</th>
                                            </tr>


                                            </thead>
                                            <tbody>

                                            <tr role="row" class="odd">
                                                    <%for(Logo logo: listLogo){%>
                                                <td class="sorting_1"> <%=logo.getIdLogo()%></td>

                                                <td><img  alt="image" src=<%=Util.fullPath(logo.getImg())%>></td>
                                                <td class="options-width" style="width: 10%;">
                                                    <a href=<%=Util.fullPath("AdEditLogoController?idLogo=")+logo.getIdLogo()%> title="" data-placement="bottom" data-original-title="Edit" data-toggle="tooltip" class="btn btn-default btn-sm"><i class="fa fa-edit"></i></a>
                                                </td>
                                                    <%}%>
                                            </tbody>
                                        </table></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
        <div class="outer">
            <div class="inner bg-light lter">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="box">

                            <div id="collapse4" class="body">
                                <div id="dataTable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                                    <div class="row"><div class="col-sm-12">
                                        <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped dataTable no-footer" role="grid" aria-describedby="dataTable_info">

                                            <h4><b>Slider Management</b></h4>
                                            <thead>
                                            <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 135px;">
                                                ID</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 796px;">
                                                    Name</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 796px;">
                                                    Imge1</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 796px;">
                                                    Imge2</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Options: activate to sort column ascending" style="width: 195px;">Options</th>
                                            </tr>

                                            </thead>
                                            <tbody>


                                            </tr>


                                            </tr>
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">2</td>
                                                <td>SliderHeader</td>
                                                <td><img alt="img"></td>
                                                <td><img alt="img"></td>
                                                <td class="options-width" style="width: 10%;">
                                                    <a href="" title="" data-placement="bottom" data-original-title="Edit" data-toggle="tooltip" class="btn btn-default btn-sm"><i class="fa fa-edit"></i></a>

                                                </td>

                                            </tr>
                                            </tbody>
                                        </table></div></div>
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

<%@include file="footer.jsp"%>


</body>

</html>
