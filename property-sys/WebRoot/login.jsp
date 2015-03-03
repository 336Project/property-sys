<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<title>社区物业管理系统</title>	
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="css/font-awesome.css">
	
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.css">

	<link rel="stylesheet" href="./css/ui-lightness/jquery-ui-1.8.21.custom.css">	
	
	<link rel="stylesheet" href="css/application.css">

	<script src="js/libs/modernizr-2.5.3.min.js"></script>

</head>

<body class="login">



<div class="account-container login stacked">
	
	<div class="content clearfix">
		
			<h1>登录</h1>		
			
			<div class="login-fields">
				
				<div class="field">
					<label for="username">用户名:</label>
					<input type="text" id="username" name="username" value="" placeholder="用户名" class="login username-field" />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">密码:</label>
					<input type="password" id="password" name="password" value="" placeholder="密码" class="login password-field"/>
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<!-- <span class="login-checkbox">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">保持登录</label>
				</span> -->
									
				<button class="button btn btn-primary btn-large" id="btn_login">登录</button>
				
			</div> <!-- .actions -->
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->


<!-- Text Under Box -->
<div class="login-extra">
	还没账号? <a href="./signup.jsp">注册</a><br/>
	忘记 <a href="javascript:alert('请联系管理员!')">密码</a>
</div> <!-- /login-extra -->




<script src="js/libs/jquery-1.7.2.min.js"></script>
<script src="js/libs/jquery-ui-1.8.21.custom.min.js"></script>
<script src="js/libs/jquery.ui.touch-punch.min.js"></script>

<script src="js/libs/bootstrap/bootstrap.min.js"></script>

<script src="js/signin.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn_login").click(
			 function() {
				$.ajax({
					type : "POST",
					url : "<%=path%>/property-sys/userAction!login.action",
					data : {
						username : $("#username").val(),
						password : $("#password").val(),
						type : "2"
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if(data.success){
							window.location.href ='<%=path%>'+data.msg;
						}else{
							alert(data.msg);
						}
					}
				}) ;
			});
	});
</script>
</body>
</html>
