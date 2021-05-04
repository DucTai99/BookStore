<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<!-- Bootstrap -->

<link rel="stylesheet" href=<%=Util.fullPath("admin/assets/lib/bootstrap/css/bootstrap.css")%>>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Metis core stylesheet -->
<link rel="stylesheet" href=<%=Util.fullPath("admin/assets/css/main.css")%>>

<!-- metisMenu stylesheet -->
<link rel="stylesheet" href=<%=Util.fullPath("admin/assets/lib/metismenu/metisMenu.css")%>>

<!-- onoffcanvas stylesheet -->
<link rel="stylesheet" href=<%=Util.fullPath("admin/assets/lib/onoffcanvas/onoffcanvas.css")%>>

<!-- animate.css stylesheet -->
<link rel="stylesheet" href=<%=Util.fullPath("admin/assets/lib/animate.css/animate.css")%>>



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--For Development Only. Not required -->
<script>
    less = {
        env: "development",
        relativeUrls: false,
        rootpath: "/assets/"
    };
</script>
<link rel="stylesheet" href=<%=Util.fullPath("admin/assets/css/style-switcher.css")%>>
<link rel="stylesheet/less" type="text/css" href=<%=Util.fullPath("admin/assets/less/theme.less")%>>
<script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>

<!--jQuery -->
<script src=<%=Util.fullPath("admin/assets/lib/jquery/jquery.js")%>></script>


<!--Bootstrap -->
<script src=<%=Util.fullPath("admin/assets/lib/bootstrap/js/bootstrap.js")%>></script>
<!-- MetisMenu -->
<script src=<%=Util.fullPath("admin/assets/lib/metismenu/metisMenu.js")%>></script>
<!-- onoffcanvas -->
<script src=<%=Util.fullPath("admin/assets/lib/onoffcanvas/onoffcanvas.js")%>></script>
<!-- Screenfull -->
<script src=<%=Util.fullPath("admin/assets/lib/screenfull/screenfull.js")%>></script>


<!-- Metis core scripts -->
<script src=<%=Util.fullPath("admin/assets/js/core.js")%>></script>
<!-- Metis demo scripts -->
<script src=<%=Util.fullPath("admin/assets/js/app.js")%>></script>


<script src=<%=Util.fullPath("admin/admin/assets/js/style-switcher.js")%>></script>
<script src="<%=Util.fullPath("admin/ckeditor/ckeditor.js")%>"></script>
</body>
</html>
