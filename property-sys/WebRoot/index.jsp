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
                        <li>入住申请</li>
                        <li>报修申请</li>
                        <li>装修申请</li>
                        <li>信息发布</li>
                        <li>发起投票</li>
                        <li>发起活动</li>
                        <li>投诉</li>
                        <li>咨询</li>
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
            <a class="box-shadow adshow-1" href="/pages/about">联系<strong>物业</strong>,请拨打<strong>1234567</strong></a>
        </div>
        <div class="l-b-col l-main">
          <div class="l-inner">
            <div class="l-header">         
                <ul class="wgt-topNav">
                    <li class="important">
                       <a href="#">首页</a>
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
                        <a href="login.jsp">注销</a>
                    </li>
                </ul>
            </div>
            <div class="l-b-row row-fluid">
                <div class="pagination pagination-right">
                    <ul>
                    </ul>
                </div>
                <div class="wgt-zpList row-fluid  ">
                    <ul class="thumbnails" id="MsgId">
                        <!-- 消息列表 -->
                    </ul>
                </div>
                <div class="pagination pagination-right">
                    <ul>
                    </ul>
                </div>
            </div>
          </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/common.js"></script>
</body>
</html>