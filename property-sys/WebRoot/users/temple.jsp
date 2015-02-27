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
	<title>物业后台管理系统模版</title>	
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<link rel="stylesheet" href="css/font-awesome.css">
	
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.css">

	<link rel="stylesheet" href="./css/ui-lightness/jquery-ui-1.8.21.custom.css">	
	
	<link rel="stylesheet" href="css/application.css">
	<link rel="stylesheet" href="css/pages/dashboard.css">

	<script src="js/libs/modernizr-2.5.3.min.js"></script>

</head>

<body>
	
<div id="wrapper">
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<div id="content">
		<div class="container">
			<div class="row">
			<!--  class='spanX' 将该行分为12列 这个div占了几个列，比如分为并排两列   即如下两个 span6  -->
				<div class="span6">
					<table id="table-account" class="hover order-column"></table>
				</div>
				<div class="span6"></div>
			</div> <!-- /.row -->
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->

</div> <!-- /#wrapper -->
<jsp:include page="/inc/footer.jsp"></jsp:include>
<script type="text/javascript" src="../js/libs/datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/temple.js"></script>
</body>
</html>