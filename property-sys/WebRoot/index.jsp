<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<title>社区物业管理系统</title>
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.css">
	<link rel="stylesheet" href="css/pages/index.css" type="text/css"></link>
	<script type="text/javascript" src="js/libs/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/libs/director/director.min.js"></script>
</head>

<body>
<div class="l-container">
    <div class="l-b-row">
        <ul class="wgt-rainbow"><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>
    </div>
    <div class="l-b-row ta-c">
        <div class="l-b-col l-side">
            <div class="box-shadow">
                <div class="wgt-logo">家园物业</div>
            </div>
            <div class="box-shadow">
                <div class="wgt-activityList sibar">
                    <div class="box-title">
                        <h3>品质服务</h3>
                        <a href="#" class="btn-more">更多</a>
                    </div>
                    <ul class="cst-services">
                        <a href="#/form/ruzhu"><li>入住申请</li></a>
                        <a href="#/form/baoxiu"><li>报修申请</li></a>
                        <a href="#/form/zhuangxiu"><li>装修申请</li></a>
                        <a href="#/form/xinxi"><li>信息发布</li></a>
                        <a href="#/form/toupiao"><li>发起投票</li></a>
                        <a href="#/form/huodong"><li>发起活动</li></a>
                        <a href="#/form/tousu"><li>投诉</li></a>
                        <a href="#/form/zixun"><li>咨询</li></a>
                    </ul>
                    <div class="box-title">
                        <h3>与我相关</h3>
                        <a href="#" class="btn-more">更多</a>
                    </div>
                    <ul>
                        <li>账户信息</li>
                        <li>缴费</li>
                        <li>充值</li>
                        <li>申请结果</li>
                        <li>我发布的信息</li>
                        <li>我的投票</li>
                    </ul>
                </div>
            </div>
            <a class="box-shadow adshow-1" href="#">联系<strong>物业</strong>,请拨打<strong>1234567</strong></a>
        </div>
        <div class="l-b-col l-main">
          <div class="l-inner">
            <div class="l-header">         
                <ul class="wgt-topNav">
                    <li class="important">
                       <a href="#/listAll">首页</a>
                    </li>
                    <li>
                        <a href="#">物业公告</a>
                    </li>
                    <li>
                        <a href="#">社区活动</a>
                    </li>
                    <li>
                        <a href="#">社区投票</a>
                    </li>
                    <li>
                        <a href="#">投诉咨询</a>
                    </li>
                    <li>
                        <a href="admin/login.jsp">我是管理员</a><!-- 后台管理登入入口 -->
                    </li>
                    <li>
                        <a href="<%=path%>/property-sys/userAction!logout.action">注销</a>
                    </li>
                </ul>
            </div>
            <div class="l-b-row row-fluid" id="main-panel">
                
            </div>
          </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
    var author = function () { console.log("author"); },
      books = function () { console.log("books"); },
      viewBook = function(bookId) { console.log("viewBook: bookId is populated: " + bookId); };

    var routes = {
        '/listAll':function(){changeMainPanel("list")},
        '/form':{ //表单页
            '/ruzhu':function(){changeMainPanel("form_ruzhu")},
            '/baoxiu': function(){changeMainPanel("form_baoxiu")},
            '/zhuangxiu': function(){changeMainPanel("form_ruzhu")},
            '/xinxi': function(){changeMainPanel("form_ruzhu")},
            '/toupiao': function(){changeMainPanel("form_ruzhu")},
            '/huodong': function(){changeMainPanel("list")},
            '/tousu': function(){changeMainPanel("list")},
            '/zixun': function(){changeMainPanel("list")}
        },
        '/list': { //列表页

        }
    };

    var router = Router(routes);
    router.init();
</script>
</body>
</html>