<%@ page import="BEAN.Bill" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.User" %>
<%@ page import="BEAN.Payment" %>
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
        <!-- .navbar -->
        <%@include file="header.jsp" %>
        <header class="head">
            <div class="search-bar">
                <form class="main-search" action="" method="post">
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
                    <i class="fa fa-clone"></i>&nbsp;
                    Edit Bill
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
                                    <h2><span class="label label-default"> Edit Bill </span></h2>
                                </div>
                            </header>

                            <div id="collapse4" class="body">
                                <form action=<%=Util.fullPath("AdDoEditBillController")%> method="post">
                                    <input type="hidden" name="" value="">
                                    <% Bill bill = (Bill) request.getAttribute("bill");
                                        ArrayList<Payment> listPayment = (ArrayList<Payment>) request.getAttribute("listPayment");
                                        ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");

                                    %>
                                    <div class="td">
                                        <p id="edit_id">ID</p>
                                        <input readonly type="text" class="inp-form" name="edit_id" size="50"
                                               value="<%= bill.getId()%>">
                                    </div>


                                    <div class="td">
                                        <p>Detail</p>
                                        <input type="text" class="inp-form" name="edit_detail" size="50"
                                               value="<%= bill.getDetail()%>">


                                    </div>

                                    <div class="td">
                                        <p>Email</p>
                                        <select name="selectIdUserEmail">
                                            <%
                                                for (User user : listUser) {
                                            %>
                                            <option><%=user.getId()%>
                                            </option>
                                            <%}%>
                                        </select>

                                    </div>

                                    <div class="td">
                                        <p>Total</p>
                                        <input type="text" class="inp-form" name="edit_total" size="50"
                                               value="<%= bill.tongTien()%>">

                                    </div>
                                    <div class="td">
                                        <p>Address</p>
                                        <input type="text" class="inp-form" name="edit_address" size="50"
                                               value="<%= bill.getAddress()%>">
                                    </div>
                                    <div class="td">
                                        <p>Payment</p>
                                        <select name="edit_payment">
                                            <%
                                                for (int i = 0; i < listPayment.size(); i++)
                                                {
                                            %>

                                            <option value="<%=listPayment.get(i).getIdPayment()%>"><%=listPayment.get(i).getNamePayment()%></option>
                                            <% }
                                            %>
                                        </select>

                                    </div>

                                    <div class="td">
                                        <p>Date</p>
                                        <input type="date" class="inp-form" name="edit_date" size="50"
                                               value="<%= bill.getDate()%>">

                                    </div>
                                    <div class="td">
                                        <p>Quantity</p>
                                        <input type="text" class="inp-form" name="edit_quantity" size="50"
                                               value="<%= bill.getPayment()%>">

                                    </div>
                                    <br>


                                    <div class="ac">
                                        <button type="reset" class="btn btn-default" style="float: left"> Reset</button>
                                    </div>
                                    <div class="ac">

                                        <button type="submit" class="btn btn-default" value=""
                                                style="margin-left: 15px"> OK
                                        </button>
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
