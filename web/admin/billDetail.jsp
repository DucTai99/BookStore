<%@ page import="java.util.ArrayList" %>

<%@ page import="java.lang.reflect.Array" %>

<%@ page import="BEAN.Bill" %>
<%@ page import="BEAN.Sach" %>
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
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <title>Room</title>
    <style>
        .td > p {
            font-weight: bold;
        }

        #invoice {
            padding: 30px;
        }

        .invoice {
            position: relative;
            background-color: #FFF;
            min-height: 680px;
            padding: 15px
        }

        .invoice header {
            padding: 10px 0;
            margin-bottom: 20px;
            border-bottom: 1px solid #3989c6
        }

        .invoice .company-details {
            text-align: right
        }

        .invoice .company-details .name {
            margin-top: 0;
            margin-bottom: 0
        }

        .invoice .contacts {
            margin-bottom: 20px
        }

        .invoice .invoice-to {
            text-align: left
        }

        .invoice .invoice-to .to {
            margin-top: 0;
            margin-bottom: 0
        }

        .invoice .invoice-details {
            text-align: right
        }

        .invoice .invoice-details .invoice-id {
            margin-top: 0;
            color: #3989c6
        }

        .invoice main {
            padding-bottom: 50px
        }

        .invoice main .thanks {
            margin-top: -100px;
            font-size: 2em;
            margin-bottom: 50px
        }

        .invoice main .notices {
            padding-left: 6px;
            border-left: 6px solid #3989c6
        }

        .invoice main .notices .notice {
            font-size: 1.2em
        }

        .invoice table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            margin-bottom: 20px
        }

        .invoice table td, .invoice table th {
            padding: 15px;
            background: #eee;
            border-bottom: 1px solid #fff
        }

        .invoice table th {
            white-space: nowrap;
            font-weight: 400;
            font-size: 16px
        }

        .invoice table td h3 {
            margin: 0;
            font-weight: 400;
            color: #3989c6;
            font-size: 1.2em
        }

        .invoice table .qty, .invoice table .total, .invoice table .unit {
            text-align: right;
            font-size: 1.2em
        }

        .invoice table .no {
            color: #fff;
            font-size: 1.6em;
            background: #3989c6
        }

        .invoice table .unit {
            background: #ddd
        }

        .invoice table .total {
            background: #3989c6;
            color: #fff
        }

        .invoice table tbody tr:last-child td {
            border: none
        }

        .invoice table tfoot td {
            background: 0 0;
            border-bottom: none;
            white-space: nowrap;
            text-align: right;
            padding: 10px 20px;
            font-size: 1.2em;
            border-top: 1px solid #aaa
        }

        .invoice table tfoot tr:first-child td {
            border-top: none
        }

        .invoice table tfoot tr:last-child td {
            color: #3989c6;
            font-size: 1.4em;
            border-top: 1px solid #3989c6
        }

        .invoice table tfoot tr td:first-child {
            border: none
        }

        .invoice footer {
            width: 100%;
            text-align: center;
            color: #777;
            border-top: 1px solid #aaa;
            padding: 8px 0
        }

        @media print {
            .invoice {
                font-size: 11px !important;
                overflow: hidden !important
            }

            .invoice footer {
                position: absolute;
                bottom: 10px;
                page-break-after: always
            }

            .invoice > div:last-child {
                page-break-before: always
            }
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
                    BillDetail
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
                                    <a id="print" data-toggle="modal" data-original-title="Print"
                                       data-placement="bottom" class="btn btn-default btn-sm" href="javascript:void(0)"
                                       onclick="printContent('div_print')">
                                        <i class="fa fa-print"></i>
                                    </a>
                                </div>
                            </header>


                            <% Bill bill = (Bill) request.getAttribute("bill");%>

                            <div class="invoice overflow-auto" id="div_print">
                                <div style="min-width: 600px">
                                    <main>
                                        <div class="row contacts">
                                            <div class="col invoice-to">
                                                <div class="text-gray-light">INVOICE TO:</div>
                                                <h2 class="to"><%= bill.getName()%>
                                                </h2>
                                                <div class="address">Email: <%=bill.getUseremail()%>
                                                </div>
                                                <div class="address">Phone - Address: <%= bill.getPhoneNumber()%>
                                                    - <%=bill.getAddress()%>
                                                </div>
                                            </div>
                                        </div>
                                        <table border="0" cellspacing="0" cellpadding="0">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th class="text-left">BOOK</th>
                                                <th class="text-right">DATE</th>
                                                <th class="text-right">PAYMENT</th>
                                                <th class="text-right">TOTAL</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <% ArrayList<Sach> sach = bill.getListSach();
                                                    String s = "";

                                                    for (int i = 0; i < sach.size(); i++) {
                                                        s += sach.get(i).getTenSach() + " : " + sach.get(i).getGia() + "000đ" + "<br>";

                                                    }%>
                                                <td class="no">01</td>
                                                <td class="text-left"><h3><%=s%>
                                                </h3></td>
                                                <td class="unit"><%=bill.getDate()%>
                                                </td>
                                                <td class="qty"><%=bill.getPayment()%>
                                                </td>
                                                <td class="total"><%=bill.getTotal()%>000đ</td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="3"></td>
                                                <td colspan="2">SALE</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3"></td>
                                                <td colspan="2">GRAND TOTAL</td>
                                                <td></td>
                                            </tr>
                                            </tfoot>
                                        </table>

                                    </main>

                                </div>

                                <div></div>
                            </div>


                        </div>
                        <a class="btn btn-primary" href=<%= Util.fullPath("AdBillController")%> role="button">Back</a>
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
<script>
    function printContent(element) {
        var printE = document.getElementById(element);

        var WindowPrint = window.open('', '', 'left=0;top=0;width=1100;height=560');
        WindowPrint.document.write(printE.innerHTML);
        WindowPrint.document.close();
        WindowPrint.focus();
        WindowPrint.print();

    }


</script>


</body>

</html>

