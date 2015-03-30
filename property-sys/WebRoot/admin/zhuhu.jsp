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
	<jsp:include page="/admin/inc/commonheader.jsp"></jsp:include>
	<script src="../js/libs/modernizr-2.5.3.min.js"></script>
</head>

<body>
	
<div id="wrapper">
	<jsp:include page="/admin/inc/header.jsp"></jsp:include>
	<div id="masthead">
		<div class="container">
			<div class="masthead-pad">
				<div class="masthead-text">
					<div class="row">
						<h2 class="span9">住户管理<h2>
						<div class="span3">
							<button id="btn-addZhuhu" class="btn btn-primary" type="button">添加</button>
							<button id="btn-deleteZhuhu" class="btn btn-primary" type="button">删除</button>
							<button id="btn-edictZhuhu" class="btn btn-primary" type="button">编辑</button>
						</div>
					</div>
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<div class="row">
				<table id="table-zhuhu" class="hover order-column span12"></table>
			</div>
			<!-- /.row -->
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->

</div> <!-- /#wrapper -->
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>

<script src="js/zhuhu.js"></script>
</body>
</html>