<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Admin</title>

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
                <!-- /.main-search -->                                </div>
            <!-- /.search-bar -->
            <div class="main-bar">
                <h3>
                    <i class="fa fa-home"></i>&nbsp;
                    Home
                </h3>
            </div>
            <!-- /.main-bar -->
        </header>
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <%@include file="leftMenu.jsp"%>
    <!-- /#left -->
    <div id="content">
        <div class="outer">
            <div class="inner bg-light lter">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="edithome" style="float: right;">
                            <header>
                                <div class="icons">
                                    <a data-toggle="modal" data-original-title="Add" data-placement="bottom"
                                       class="btn btn-default btn-sm" href="#editText">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </div>

                            </header>

                        </div>

                        <div class="texthome">
                            <span class="label label-success"> New </span><span class="label label-primary"> Update : </span>
                            <p> </p>

                            <span>Product management</span><span class="pull-right">   100% </span>
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                            </div>


                            <span>User management</span><span class="pull-right">   100% </span>
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                            </div>

                            <span>Bill management</span><span class="pull-right">   100% </span>
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                            </div>


                            <span>Statistics</span><span class="pull-right">   70% </span>
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-info" style="width: 70%"></div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<footer class="Footer bg-dark dker">
    <p>2017 &copy; Administrator </p>
</footer>

<div id="helpModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" style="color: blue"> Admin </h4>
            </div>
            <div class="modal-body">
                <p style="color: blue">
                    Chào mừng bạn đến với trang web của chúng tôi!!!
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"> Close </button>
            </div>
        </div>
    </div>
</div>

<div id="editText" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><span class="label label-default"> Edit Text </span></h4>
                <p>&nbsp;</p>

            </div>

            <div class="modal-footer">
                <form action="EditText" method="post">

                    <div class="insert-text">

                                       <textarea rows="20" cols="91" name="text" class="text-insert"><span class="label label-success"> New </span><span class="label label-primary"> Update : </span>
       <p> </p>

       <span>Product management</span><span class="pull-right">   100% </span>
       <div class="progress xs">
           <div class="progress-bar progress-bar-success" style="width: 100%"></div>
       </div>

       <span>Category management</span><span class="pull-right">   100% </span>
       <div class="progress xs">
           <div class="progress-bar progress-bar-success" style="width: 100%"></div>
       </div>

       <span>Employee management</span><span class="pull-right">   100% </span>
       <div class="progress xs">
           <div class="progress-bar progress-bar-success" style="width: 100%"></div>
       </div>

       <span>User management</span><span class="pull-right">   100% </span>
       <div class="progress xs">
           <div class="progress-bar progress-bar-success" style="width: 100%"></div>
       </div>

       <span>Bill management</span><span class="pull-right">   100% </span>
       <div class="progress xs">
           <div class="progress-bar progress-bar-success" style="width: 100%"></div>
       </div>


       <span>Statistics</span><span class="pull-right">   70% </span>
       <div class="progress xs">
           <div class="progress-bar progress-bar-info" style="width: 70%"></div>
       </div>

       </textarea>


                    </div>

                    <button type="submit" class="btn btn-default" style="float: left"> OK </button>
                    <button type="reset" class="btn btn-default" style="float: left"> Reset </button>
                </form>
                <button type="button" class="btn btn-default" data-dismiss="modal"> Close </button>
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
