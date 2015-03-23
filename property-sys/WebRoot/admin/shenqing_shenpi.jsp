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
					<h2>申请审批</h2>
				<!-- 	<p>这里也可以不写任何内容</p> -->
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span12 ">
					 <button class="btn" type="button">通过审核</button>
				</div>
			</div>
			<div class="row">
				<div class="span12"><table id="table-shenqing" class="hover order-column"></table></div>
				
			</div>
			<!-- /.row -->
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->

</div> <!-- /#wrapper -->
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>

<script src="js/shenqing_shenpi.js"></script>
</body>
</html>