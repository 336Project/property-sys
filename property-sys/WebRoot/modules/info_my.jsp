<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>

	<div class="row userMsg">
		<dl class="dl-horizontal col-xs-6">
			<dt>用户名</dt>
			<dd class="d-userName">${sessionScope.user.userName}</dd>
			<dt>邮箱地址</dt>
			<dd class="d-email">${sessionScope.user.email}</dd>
			<dt>手机号</dt>
			<dd class="d-tel">${sessionScope.user.tel}</dd>
			<dt>注册时间</dt>
			<dd>${sessionScope.user.registerTime}</dd>
		</dl>
		<dl class="dl-horizontal col-xs-6">
			<dt>账户余额</dt>
			<dd>￥${sessionScope.user.balance}</dd>
			<dt>上次登入时间</dt>
			<dd>${sessionScope.user.lastLoginTime}</dd>
			<dt>账户状态</dt>
			<dd>${sessionScope.user.status}</dd>
			<dt>账户来源</dt>
			<dd>${sessionScope.user.source}</dd>
		</dl>
	</div>
