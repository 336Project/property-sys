<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<h3 class="ptitle text-center" style="margin-top:0;">我的信息</h3>
<div class="row-fluid userMsg box-shadow my-msg" >
	<dl class="dl-horizontal span6">
		<dt>用户名</dt>
		<dd class="d-userName">${sessionScope.user.userName}</dd>
		<dt>邮箱地址</dt>
		<dd class="d-email">${sessionScope.user.email}</dd>
		<dt>手机号</dt>
		<dd class="d-tel">${sessionScope.user.tel}</dd>
		<dt>注册时间</dt>
		<dd>${sessionScope.user.registerTime}</dd>
	</dl>
	<dl class="dl-horizontal span6">
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
<script type="text/javascript">
$(function(){
	var alldd = $("dd");
	for(var i=0;i<alldd.length;i++){
	//console.log(alldd.eq(i).text());
		if(!alldd.eq(i).text()){alldd.eq(i).html("<span style='color:#ccc;font-size:14px;'>暂无数据</span>");}
	}
});
</script>
