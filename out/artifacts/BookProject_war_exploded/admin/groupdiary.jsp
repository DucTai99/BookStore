<!doctype html>
<html>

<head>
    <title>Admin</title>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>User</title>

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
            <div class="main-bar">
                <h3>
                    <i class="fa fa-user"></i>&nbsp;
                    Group diary
                </h3>
            </div>
            <!-- /.main-bar -->
        </header>
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <%--                   left--%>
    <%@include file="leftMenu.jsp"%>
    <!-- content-right -->
    <div id="content">
        <div class="outer">
            <div class="inner bg-light lter">
                <div class="row">
                    <div class="col-lg-12" >
                        <img src="assets/img/key.png" alt="img" style="width: 100%;height: 100%">


                    </div>
                    <!-- /#right -->
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>

</body>

</html>

