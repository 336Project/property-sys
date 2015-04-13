<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String timeTemp=System.currentTimeMillis()+"";
String money=request.getParameter("money");
%>

<div style="margin-top: 100px;margin-left: 100px;">
 	<h5>订单流水号：<%=timeTemp %></h5>
 	<h5>充值金额：<%=money %></h5>
 	<div style="margin-top: 50px;">
 		<h3>请选择支付方式</h3>
	</div>
	<div style="margin-top: 50px;">
 		<a target="_top" style="margin-left: 15px;" href="javascript:window.location.reload()"><img alt="银联在线支付" src="<%=path %>/img/pay_yinlian.jpg" height="100px;" width="180px;" ></a>
 		<a target="_top" style="margin-left: 15px;" href="javascript:window.location.reload()"><img alt="中国银行在线支付" src="<%=path %>/img/pay_zhongguo.jpg" height="100px;" width="180px;" ></a>
 		<a target="_top" style="margin-left: 15px;" href="javascript:window.location.reload()"><img alt="建设银行在线支付" src="<%=path %>/img/pay_jianhang.jpg" height="100px;" width="180px;" ></a>
	</div>
</div>
