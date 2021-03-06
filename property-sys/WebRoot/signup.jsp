<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>注册页面</title>
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link rel="stylesheet" href="css/font-awesome.css">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">

<link rel="stylesheet"
	href="./css/ui-lightness/jquery-ui-1.8.21.custom.css">

<link rel="stylesheet" href="css/application.css">

<script src="js/libs/modernizr-2.5.3.min.js"></script>

</head>

<body class="login">

	<div class="account-container register stacked">

		<div class="content clearfix">

			<h1>注册</h1>
			<div class="login-fields">
				<div class="field">
					<label for="username">用户名:</label> <input type="text" id="username"
						name="username" value="" placeholder="用户名" class="login" />
				</div>
				<!-- /field -->

				<div class="field">
					<label for="email">邮箱:</label> <input type="text" id="email"
						name="email" value="" placeholder="邮箱" class="login" />
				</div>
				<!-- /field -->
				<div class="field">
					<label for="tel">手机号码:</label> <input type="text" id="tel"
						name="tel" value="" placeholder="手机号码" class="login" />
				</div>
				<!-- /field -->
				<div class="field">
					<label for="password">密码:</label> <input type="password"
						id="password" name="password" value="" placeholder="密码"
						class="login" />
				</div>
				<!-- /field -->

				<div class="field">
					<label for="confirm_password">重复密码:</label> <input type="password"
						id="confirm_password" name="confirm_password" value=""
						placeholder="重复密码" class="login" />
				</div>
				<!-- /field -->

			</div>
			<!-- /login-fields -->

			<div class="login-actions">

				<!-- <span class="login-checkbox">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">我已阅读相关条款，并同意接受该条款.</label>
				</span> -->

				<button class="button btn btn-primary btn-large" type="button" id="btn_signup">注册</button>

			</div>
			<!-- .actions -->


		</div>
		<!-- /content -->

	</div>
	<!-- /account-container -->


	<!-- Text Under Box -->
	<div class="login-extra">
		已经有账号? <a href="./login.jsp">登录</a>
	</div>
	<!-- /login-extra -->


	<script src="js/libs/jquery-1.7.2.min.js"></script>
	<script src="js/libs/jquery-ui-1.8.21.custom.min.js"></script>
	<script src="js/libs/jquery.ui.touch-punch.min.js"></script>

	<script src="js/libs/bootstrap/bootstrap.min.js"></script>

	<script src="js/signin.js"></script>
</body>
</html>
