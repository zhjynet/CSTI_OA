<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/11/30
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="checkUser.jsp" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

  <title>科协OA - 首页</title>

  <!-- Bootstrap core CSS -->
  <link href="assets/css/bootstrap.css" rel="stylesheet">
  <!--external css-->
  <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
  <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

  <!-- Custom styles for this template -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/style-responsive.css" rel="stylesheet">
  <script src="assets/js/hmac-sha1.js"></script>
  <script src="assets/js/chart-master/Chart.js"></script>
  <script src="assets/js/jquery.js"></script>
  <script src="assets/js/jquery-1.8.3.min.js"></script>
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
          <a class="active" href="jumptoindex.jsp">
            <i class="fa fa-dashboard"></i>
            <span>首页</span>
          </a>
        </li>

        <li class="sub-menu">
          <a href="javascript:;" >
            <i class="fa fa-desktop"></i>
            <span>签到管理</span>
          </a>
          <ul class="sub">
            <li><a  href="signin_selectAllSignin.action">签到记录</a></li>
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

      <div class="row">
        <div class="col-lg-9 main-chart">
          <!-- TWITTER PANEL -->
          <div class="col-md-12 mb">
            <div class="darkblue-panel pn">
              <div class="darkblue-header">
                <h5>签到</h5>
              </div>
              <a href="javascript:void(0);" id="url"> <canvas id="serverstatus02" height="120" width="120"></canvas></a>
              <br>
              <p id="info"></p>
              <script>
                  var issignintoday = ${sessionScope.user.issignintoday};
                  var isincsti = ${requestScope.incsti};
                  if(isincsti==0&&issignintoday==0){
                      $("#info").text("您不在实验室");
                      var doughnutData = [
                          {
                              value: 0,
                              color:"#68dff0"
                          },
                          {
                              value : 100,
                              color : "#fdfdfd"
                          }
                      ];
                  }
                  else if(isincsti==1&&issignintoday==0){
                      $("#info").text("您今天还没有签到呢");
                      document.getElementById("url").href='/signin_insertSignin.action';
                      var doughnutData = [
                          {
                              value: 50,
                              color:"#68dff0"
                          },
                          {
                              value : 50,
                              color : "#fdfdfd"
                          }
                      ];
                  }
                  else{
                      $("#info").text("今日已签到，继续加油");
                      var doughnutData = [
                          {
                              value: 100,
                              color:"#68dff0"
                          },
                          {
                              value : 0,
                              color : "#fdfdfd"
                          }
                      ];
                  }

                  var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);

                  console.log(isincsti);
                  if(issignintoday == 0&& isincsti ==1){
                      document.getElementById("url").href='/signin_insertSignin.action';
                  }
                  console.log(issignintoday);
              </script>
              <script>
                  //获取当前时间并拼接放到div中的函数
                  function nowTime(){
                      var nowDate = new Date();
                      var year = nowDate.getFullYear();
                      var month = nowDate.getMonth()+1;
                      month = month>9 ? month : "0" + month;
                      var date = nowDate.getDate();
                      date = date>9 ? date : "0" + date;
                      var hour = nowDate.getHours();
                      hour = hour>9 ? hour : "0" + hour;
                      var miunte = nowDate.getMinutes();
                      miunte = miunte>9 ? miunte : "0" + miunte;
                      var second = nowDate.getSeconds();
                      second = second>9 ? second : "0" + second;

                      $("#time").text(year+"年"+month+"月"+date+"日"+hour+"时"+miunte+"分"+second+"秒");
                      $("#time1").text(hour+"时"+miunte+"分");
                  }
                  //加载后执行一次函数，以后每秒再执行
                  $(function(){
                      nowTime();
                      setInterval("nowTime()", 1000);
                  });
              </script>

              <p id="time"></p>
            </div><! -- /darkblue panel -->
          </div><!-- /col-md-12-->
          <div class="col-lg-12 col-md-12 col-sm-12 mb">
            <div class="steps pn">

              <input id='op1' name='op1' type='checkbox' checked  disabled="disabled"/>
              <label for='op1'>${requestScope.studentOnDuty.get(0).name}</label>
              <input id='op2' name='op2' type='checkbox' checked  disabled="disabled"/>
              <label for='op2'>${requestScope.studentOnDuty.get(1).name}</label>
              <input id='op3' name='op3' type='checkbox' checked  disabled="disabled"/>
              <label for='op3'>${requestScope.studentOnDuty.get(2).name}</label>
              <input type='submit' value='值日表!' id='submit'/>
              <script>
                  var student0OnDutyIsSigninToday = ${requestScope.studentOnDuty.get(0).issignintoday};
                  var student1OnDutyIsSigninToday = ${requestScope.studentOnDuty.get(1).issignintoday};
                  var student2OnDutyIsSigninToday = ${requestScope.studentOnDuty.get(2).issignintoday};
                  console.log(student0OnDutyIsSigninToday);
                  if(student0OnDutyIsSigninToday == 0)
                  {
                      document.getElementsByName("op1")[0].checked=false;
                  }
                  if(student1OnDutyIsSigninToday == 0)
                  {
                      document.getElementsByName("op2")[0].checked=false;
                  }
                  if(student2OnDutyIsSigninToday == 0)
                  {
                      document.getElementsByName("op3")[0].checked=false;
                  }
              </script>
            </div>
          </div><! --/row -->

          <div class="col-lg-12 col-md-12 col-sm-12 mb">
            <div class="weather-2 pn">
              <div class="weather-2-header">
                <div class="row">
                  <div class="col-sm-6 col-xs-6">
                    <p id="temperature">Weather</p>
                  </div>
                  <div class="col-sm-6 col-xs-6 goright">
                    <p class="small" id="date">Thu Apr 14, 2014</p>
                  </div>
                </div>
              </div><!-- /weather-2 header -->
              <div class="row centered">
                <img src="assets/img/ny.jpg" class="img-circle" width="120">
              </div>
              <div class="row data">
                <div class="col-sm-6 col-xs-6 goleft">
                  <h4><b id="location">Weather</b></h4>
                  <h6 id ="high">21º max</h6>
                  <h6 id="low">8º min</h6>
                </div>
                <div class="col-sm-6 col-xs-6 goright">
                  <h5><img id="code_day" src="assets/img/weather/1.png" style="height: 30px;width: 30px" alt=""></h5>
                  <h6><b id="text_day">Sunny</b></h6>
                  <h5 id="time1">7:15 am</h5>
                </div>
              </div>
            </div>
          </div><! --/col-md-4 -->


        </div><!-- /col-lg-9 END SECTION MIDDLE -->


        <!-- **********************************************************************************************************************************************************
        RIGHT SIDEBAR CONTENT
        *********************************************************************************************************************************************************** -->

        <div class="col-lg-3 ds">
          <!--COMPLETED ACTIONS DONUTS CHART-->


          <!-- CALENDAR-->
          <div id="calendar" class="mb">
            <div class="panel green-panel no-margin">
              <div class="panel-body">
                <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                  <div class="arrow"></div>
                  <h3 class="popover-title" style="disadding: none;"></h3>
                  <div id="date-popover-content" class="popover-content"></div>
                </div>
                <div id="my-calendar"></div>
              </div>
            </div>
          </div><!-- / calendar -->

        </div><!-- /col-lg-3 -->

      </div>
    </section>
  </section>

  <!--main content end-->
  <!--footer start-->
  <footer class="site-footer">
    <div class="text-center">
      Powered by <a href="http://www.zhjynet.cn">JingyuZhang!</a>
      <a href="jumptoindex.jsp#" class="go-top">
        <i class="fa fa-angle-up"></i>
      </a>
    </div>
  </footer>
  <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="assets/js/common-scripts.js"></script>

<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="assets/js/sparkline-chart.js"></script>
<script src="assets/js/zabuto_calendar.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Hello ${sessionScope.user.name}!',
            // (string | mandatory) the text inside the notification
            text: '欢迎来到计软科协',
            // (string | optional) the image to display on the left
            //image: 'assets/img/ui-sam.jpg',
            image: 'assets/img/csti.png',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return true ;
    });
</script>

<script type="application/javascript">
    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event", }
            ]
        });
    });


    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
</script>

<script>
    var jsonpCallback = function(data) {
        var code_day = document.getElementById('code_day');
        var date = document.getElementById('date');
        var text_day = document.getElementById('text_day');
        var high = document.getElementById('high');
        var low = document.getElementById('low');
        var location = document.getElementById('location');
        var daily = data.results[0];
        console.log(data);

        code_day.src = "assets/img/weather/"+daily.daily[0].code_day+".png"
        location.innerText = daily.location.name;
        date.innerText = daily.daily[0].date;
        text_day.innerText = daily.daily[0].text_day;
        high.innerText = daily.daily[0].high+"º Max";
        low.innerText = daily.daily[0].low+"º Min";
        // text.push("Weather: " + weather.now.text);
        // text.push("Temperature: " + weather.now.temperature);
    }

    //构造最终请求的 urlAPInow
    var urldaily = "${requestScope.weatherinfo}" + "&callback=jsonpCallback";
    //var url = API + "?location=" + LOCATION + "&" + str + "&callback=jsonpCallback";
    // console.log(urldaily);
    console.log(url);
    //向 HTML 中动态插入 script 标签，通过 JSONP 的方式进行调用
    var newScriptdaily = document.createElement('script');
    newScriptdaily.type = 'text/javascript';
    newScriptdaily.src = urldaily;
    $('body').append(newScriptdaily);


</script>
</body>
</html>
