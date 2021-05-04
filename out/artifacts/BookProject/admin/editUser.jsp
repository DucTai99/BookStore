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


    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">

    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />
    <style>
        .td >p{
            font-weight: bold;
        }
    </style>
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
            <div class="main-bar">
                <h3>
                    <i class="fa fa-user"></i>&nbsp;
                    Edit User
                </h3>
            </div>
            <!-- /.main-bar -->
        </header>
        <!-- /.head -->
    </div>
    <!-- /#top -->
    <%@include file="leftMenu.jsp"%>
    <!-- content-right -->
    <div id="content">
        <div class="outer">
            <div class="inner bg-light lter">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="">
                            <header>
                                <div class="icons">
                                    <h2><span class="label label-default"> Edit user </span></h2>
                                </div>
                            </header>

                            <div id="collapse4" class="body" >
                                <form action="AdDoEditUserController" method="post">
                                    <% User user = (User) request.getAttribute("user");%>
                                    <input type="hidden" name="uid" value="">
                                    <div class="td">
                                        <p id="edit_id">ID</p>
                                        <input readonly type="text" class="inp-form" name="edit_id" size="50" value = <%=user.getId()%>>
                                    </div>


                                    <div class="td">
                                        <p id="edit_email">E-mail</p>
                                        <input type="email" class="inp-form" name="edit_email" size="50"
                                               value = "<%=user.getEmail()%>">


                                    </div>
                                    <div class="td">
                                        <p id="edit_level">Level</p>
                                        <input type="number" class="inp-form" name="edit_level" placeholder="" min="0" max="2" size="50"
                                               value = "<%=user.getLevel()%>">


                                    </div>

                                    <div class="td">
                                        <p id="edit_active">Active</p>
                                        <input type="number" class="inp-form" name="edit_active" placeholder="" min="0" max="1" size="50"
                                               value = "<%=user.getActive()%>">


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
<%@include file="footer.jsp"%>



</body>

</html>
