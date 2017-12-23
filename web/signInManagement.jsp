<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/11/30
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>科协OA - 签到记录</title>
    <%@ include file="checkUser.jsp" %>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<section id="container" >
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="CSTI"></div>
        </div>
        <!--logo start-->
        <a href="jumptoindex.jsp" class="logo"><b>科协 OA</b></a>

        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="user_logout.action">Logout</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href="#"><img src="assets/img/csti.png" class="img-circle" width="60"></a></p>
                <h5 class="centered">${sessionScope.user.name}</h5>

                <li class="mt">
                    <a href="jumptoindex.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;"  class="active">
                        <i class="fa fa-desktop"></i>
                        <span>签到管理</span>
                    </a>
                    <ul class="sub">
                        <li class="active"><a  href="signin_selectAllSignin.action">签到记录</a></li>
                        <li><a  href="signin_selectDoYouSignin.action">签到情况汇总</a></li>
                    </ul>
                </li>
                <%--<li class="sub-menu">--%>
                    <%--<a href="javascript:;" >--%>
                        <%--<i class="fa fa-book"></i>--%>
                        <%--<span>值日表</span>--%>
                    <%--</a>--%>
                <%--</li>--%>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-cogs"></i>
                        <span>系统设置</span>
                    </a>
                    <!--<ul class="sub">-->
                    <!--<li><a  href="calendar.html">Calendar</a></li>-->
                    <!--<li><a  href="gallery.html">Gallery</a></li>-->
                    <!--<li><a  href="todo_list.html">Todo List</a></li>-->
                    <!--</ul>-->
                </li>


            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->


    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i>签到记录</h3>
            <div class="row">


                <div class="col-md-12 mt">
                    <div class="content-panel">
                        <table class="table table-hover">
                            <h4><i class="fa fa-angle-right"></i>看看啥会来的实验室@#$</h4>
                            <hr>
                            <thead>
                            <tr>
                                <th>#</th>
                                <th style="min-width:50px">组别</th>
                                <th class="hidden-phone">学号</th>
                                <th style="min-width:80px">姓名</th>
                                <th>时间</th>
                                <th class="hidden-phone">IP</th>
                                <th class="hidden-phone">UA</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items = "${requestScope.signins}" var = "signin" varStatus="si">
                            <tr>
                                <td>${signin.signinID}</td>
                                <td>${signin.user.group.group}</td>
                                <td class="hidden-phone">${signin.user.studentNumber}</td>
                                <td style="min-width:70px">${signin.user.name}</td>
                                <td style="min-width:90px" >${signin.time}</td>
                                <td  class="hidden-phone">${signin.ip}</td>
                                <td  class="hidden-phone">${signin.ua}</td>
                            </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <%--<form name="f1" method="POST" action="signin_selectAllSignin.action" onSubmit="return checknum()">--%>

                        <%--<td>  <a href="signin_selectAllSignin.action?page=1">首页</a></td>--%>
                        <div class="btn-group " style=" margin: 0 auto  ">
                            <button type="button" class="btn btn-default">
                                <a href="signin_selectAllSignin.action?page=${requestScope.pages-1} ">&larr;上一页</a>
                            </button>
                            <button type="button" class="btn btn-default">
                                第${requestScope.pages}页 共${requestScope.totalpages}页
                            </button>
                            <button type="button" class="btn btn-default">
                                <a href="signin_selectAllSignin.action?page=${requestScope.pages+1} ">下一页 &rarr;</a>
                            </button>
                        </div>

                        <%--<td><a href="signin_selectAllSignin.action?page=${requestScope.totalpages}">尾页</a></td>--%>
                        <%--<td>转到第:<input type="text" name="page" size="8">页<input type="submit" value="GO" name="cndok"></td>--%>
                        <%--</form>--%>
                    </div><! --/content-panel -->

                </div><!-- /col-md-12 -->
            </div><!-- row -->


        </section><! --/wrapper -->
    </section><!-- /MAIN CONTENT -->

    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            Powered by <a href="http://www.zhjynet.cn">JingyuZhang!</a>
            <a href="signin_selectAllSignin.action#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="assets/js/common-scripts.js"></script>

<!--script for this page-->

<script>
    //custom select box

    $(function(){
        $('select.styled').customSelect();
    });

</script>

</body>
</html>
