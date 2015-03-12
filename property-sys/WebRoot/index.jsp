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
	
	<script type="text/javascript" src="js/ueditor/ueditor.config.js"></script>
</head>

<body>
<div class="l-container">
    <div class="l-b-row">
        <ul class="wgt-rainbow"><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>
    </div>
    <div class="l-b-row ta-c">
        <div class="l-b-col l-side">
            <div class="box-shadow">
                <div class="wgt-logo"><!-- 家园物业 --></div>
            </div>
            <div class="box-shadow">
                <div class="wgt-activityList sibar">
                    <div class="box-title">
                        <h3>品质服务</h3>
                        <a href="#" class="btn-more">更多</a>
                    </div>
                    <ul class="cst-services">
                        <li><a href="#/form/ruzhu">入住申请</a></li>
                        <li><a href="#/form/baoxiu">报修申请</a></li>
                        <li><a href="#/form/zhuangxiu">装修申请</a></li>
                        <li><a href="#/form/xinxi">信息发布</a></li>
                        <li><a href="#/form/toupiao">发起投票</a></li>
                        <li><a href="#/form/huodong">发起活动</a></li>
                        <li><a href="#/form/tousu">投诉</a></li>
                        <li><a href="#/form/zixun">咨询</a></li>
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
                        <a href="#/list/xinxi">物业公告</a>
                    </li>
                    <li>
                        <a href="#/list/huodong">社区活动</a>
                    </li>
                    <li>
                        <a href="#/list/toup">社区投票</a>
                    </li>
                    <li>
                        <a href="#/list/tousu">投诉</a>
                    </li>
                    <li>
                        <a href="#/list/zixun">咨询</a>
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
	// url路由功能，a标签的href="#/form/ruzhu" 则对应执行  /form :{"/ruzhu":...} 的方法，其中changeMainPanel()是切换主面板的内容，当然，也可以执行其他函数。
    var routes = {
        '/listAll':function(){changeMainPanel("list");},
        '/form':{ //表单页
            '/ruzhu':function(){changeMainPanel("form_ruzhu");}, //其中changeMainPanel()是切换主面板的内容，当然，也可以执行其他函数
            '/baoxiu': function(){changeMainPanel("form_baoxiu");},
            '/zhuangxiu': function(){changeMainPanel("form_zhuangxiu");},
            '/xinxi': function(){changeMainPanel("form_xinxi");},
            '/toupiao': function(){changeMainPanel("form_toupiao");},
            '/huodong': function(){changeMainPanel("form_huodong");},
            '/tousu': function(){changeMainPanel("list");},
            '/zixun': function(){changeMainPanel("list");}
        },
        '/list': { //列表页
			'/xinxi': function(){changeMainPanel("list_ruzhu");},
            '/toupiao': function(){changeMainPanel("list_ruzhu");},
            '/huodong': function(){changeMainPanel("list_huodong");}
        }
    };

    var router = Router(routes);
    router.init();
</script>
</body>
</html>