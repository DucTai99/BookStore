
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<div id="left">
    <div class="media user-media bg-dark dker">
        <div class="user-media-toggleHover">
            <span class="fa fa-user"></span>
        </div>
        <div class="user-wrapper bg-dark">
            <a class="user-link" href="">
                <img class="media-object img-thumbnail user-img" alt="User Picture" src=<%=Util.fullPath("admin/assets/img/Administrator.png")%> style="width: 80px; height: 80px;">

            </a>

            <div class="media-body">
                <h5 class="media-heading">Archie</h5>
                <ul class="list-unstyled user-info">
                    <li><a href="">Administrator</a></li>
                    <li>Last Access : <br>
                        <small><i class="fa fa-calendar"></i>&nbsp;16 Mar 16:32</small>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- #menu -->
    <ul id="menu" class="bg-blue dker">
        <li class="nav-header">Menu</li>
        <li class="nav-divider"></li>

        <li>
            <a href="">
                &nbsp;<i class="fa fa-dot-circle-o"></i>
                <span class="link-title"> Branch </span>
            </a>
        </li>



        <li>
            <a href="">
                <i class="fa fa-calendar"></i>
                <span class="link-title"> Calendar </span>
            </a>
        </li>

        <li>
            <a href="">
                <i class="fa fa-magic"></i>
                <span class="link-title"> Event </span>
            </a>
        </li>


        <li>
            <a href="">
                <i class="fa fa-bolt"></i><i class="fa fa-bolt"></i>
                <span class="link-title"> Plan </span>
            </a>
        </li>


        <li>
            <a href=<%=Util.fullPath("AdChartProductController")%>>
                <i class="fa fa-bar-chart-o"></i>
                <span class="link-title"> Statistics </span>

            </a>

        </li>


        <li class="nav-divider"></li>
        <li>
            <a href="/menu/left/groupdiary.jsp
                                ">
                <i class="fa fa-object-group"></i>
                <span class="link-title"> Group diary </span>
            </a>
        </li>

        <li class="nav-divider"></li>
        <li>
            <a  href=<%=Util.fullPath("shop")%>>
                &nbsp;<i class="fa fa-arrow-circle-o-left"></i>
                <span class="link-title">Back Home</span>
            </a>
        </li>

    </ul>

</div>
</body>
</html>
