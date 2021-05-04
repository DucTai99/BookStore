<%@ page import="Util.Util" %>
<!-- .navbar -->
<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">


        <!-- Brand and toggle get grouped for better mobile display -->
        <header class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>


        </header>


        <div class="topnav">

            <div class="btn-group">
                <a data-placement="bottom" data-original-title="E-mail" data-toggle="tooltip"
                   class="btn btn-default btn-sm">
                    <i class="fa fa-envelope"></i>

                </a>
            </div>

            <div class="btn-group">
                <a data-placement="bottom" data-original-title="Messages" href="#" data-toggle="tooltip"
                   class="btn btn-default btn-sm">
                    <i class="fa fa-comments"></i>

                </a>
            </div>
            <div class="btn-group">
                <a href="<%=Util.fullPath("LogOut")%>" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom"
                   class="btn btn-metis-1 btn-sm">
                    <i class="fa fa-power-off"></i>
                </a>
            </div>
            <div class="btn-group">
                <a data-placement="bottom" data-original-title="Show / Hide Left" data-toggle="tooltip"
                   class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                    <i class="fa fa-bars"></i>
                </a>

            </div>
            <div class="btn-group">
                <a data-placement="bottom" data-original-title="Fullscreen" data-toggle="tooltip"
                   class="btn btn-default btn-sm" id="toggleFullScreen">
                    <i class="glyphicon glyphicon-fullscreen"></i>
                </a>
            </div>

        </div>


        <div class="collapse navbar-collapse navbar-ex1-collapse">

            <!-- .nav -->
            <ul class="nav navbar-nav">

                <li><a href= <%=Util.fullPath("admin/index.jsp")%>class="navbar-brand"><img src= <%=Util.fullPath("admin/assets/img/logo.png")%> alt="logo" style="width: 120px; height: 50px;
                                    margin-left: 50px; border-radius: 5px;"></a></li>
                <li style="margin-left: 65px;"><a href= <%=Util.fullPath("AdLogoController")%>>HomePage management</a></li>
                <li><a href= <%=Util.fullPath("AdProductController")%>>Product management</a></li>
                <li><a href= <%=Util.fullPath("AdUserController")%>>User management</a></li>
                <li><a href= <%=Util.fullPath("AdBillController")%>>Bill management</a></li>


            </ul>
            <!-- /.nav -->
        </div>
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /.navbar -->
