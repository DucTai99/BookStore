<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.TheLoaiSach" %>
<%@ page import="BEAN.Sach" %>
<%@ page import="BEAN.Logo" %>
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
                    Logo
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
                                    <h2><span class="label label-default">Logo </span></h2>
                                </div>
                            </header>
                            <% Logo logo = (Logo) request.getAttribute("logo");%>
                            <div id="collapse4" class="body">
                                <form method="post" action=<%=Util.fullPath("AdDoEditLogoController")%>>
                                    <div>
                                        <div class="td">
                                            <p id="">ID</p>
                                            <input readonly="readonly" type="number" name="idLogo" class="inp-form"  size="50" value=<%=logo.getIdLogo()%>>

                                        </div>
                                    </div>

                                    <div class="td">
                                        <p id="edit_id">Image</p>
                                        <input  type="file"  class="inp-form" name="imgEdit" size="50" value=<%=logo.getImg()%>>
                                        <input type="hidden" name="imgDefaut" value=<%=logo.getImg()%>>
                                    </div>
                                    <br>
                                    <div class="ac">
                                        <button type="reset" class="btn btn-default"  style="float: left"> Reset </button>
                                    </div>
                                    <div class="ac">
                                        <button type="submit" class="btn btn-default" value =""  style="margin-left: 15px" > OK </button>
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
</body>

</html>

