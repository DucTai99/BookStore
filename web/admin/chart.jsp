<%@ page import="java.util.ArrayList" %>
<%@ page import="BEAN.User" %>
<%@ page import="BEAN.Sach" %>
<%@ page import="BEAN.TheLoaiSach" %>
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

    <script type="text/javascript">
        window.onload = function () {
            var data = document.getElementById("dataChart").textContent;
            var dataTheLoai = document.getElementById("dataTheLoaiChart").textContent;
            var array = data.split(" ");
            var arrayTheLoai= dataTheLoai.split("*");

            var chart = new CanvasJS.Chart("chartContainer", {
                theme: "light1", // "light2", "dark1", "dark2"
                animationEnabled: true, // change to true
                title: {
                    text: "Product Colum Chart"
                },

                data: [
                    {

                        type: "column",

                        dataPoints:arrayData(),
                    }
                ]
            });
            chart.render();


            function arrayData() {
                var data = [];
                for (var i = 0; i < array.length; i++) {
                    var str =arrayTheLoai[i];
                    console.log(str);
                    data[i] = {label: str, y: Number(array[i])}
                }
                return data;
            }

        }

    </script>
</head>

<body>
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
                    <i class="fa fa-user"></i>&nbsp;
                    Chart Product
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
                                    <h2><span class="label label-default">Chart Product</span></h2>
                                </div>
                            </header>

                            <div id="collapse4" class="body">


                                <% ArrayList<Integer> list = (ArrayList<Integer>) request.getAttribute("listQuantity");
                                    ArrayList<TheLoaiSach> listTheLoai = (ArrayList<TheLoaiSach>) request.getAttribute("listTheLoai");
                                    String str = "";
                                    String theLoai = "";
                                    for (int i = 0; i < list.size(); i++) {
                                        str += list.get(i) + " ";
                                        theLoai += listTheLoai.get(i).getTenTheLoai() + "*";
                                    }
                                %>
                                <p id="dataChart" style="display: none"><%=str%>
                                </p>
                                <p id="dataTheLoaiChart"style="display: none"><%=theLoai%>
                                </p>
                                <div id="chartContainer" style="height: 600px; width: 100%;"></div>


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

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</body>

</html>
