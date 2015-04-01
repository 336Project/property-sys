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
	<!-- <link rel="stylesheet" href="../js/libs/select2/css/select2.min.css" type="text/css"></link> -->
</head>

<body>
	
<div id="wrapper">
	<jsp:include page="/admin/inc/header.jsp"></jsp:include>
	<div id="masthead">
		<div class="container">
			<div class="masthead-pad">
				<div class="masthead-text">
					<div class="row">
						<h2 class="span9">充值管理</h2>
						<div class="span3">
							<button class="btn btn-primary" type="button" id="btn-modal-addAccount">充值</button>
							<button class="btn btn-primary" type="button" id="btn-comfirm">充值确认</button>
							<button class="btn btn-primary" type="button" id="btn-delete">删除</button>
						</div>
					</div>
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<div class="row">
				<table id="table-chongzhi" class="hover order-column span12"></table>
			</div>
			<!-- /.row -->
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->
	<!-- 充值弹出框 start  -->
		<div class="modal fade" id="addAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
		        <h4 class="modal-title" id="myModalLabel">充值</h4>
		      </div>
		      <div class="modal-body row">
		        <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-4 control-label">用户名</label>
					    <div class="col-sm-8">
						     <select class="select2" id="userName" name="userName" ></select>
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">充值金额</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="money" name="money" placeholder="请输入要充值的金额">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">备注</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="remark" name="remark" placeholder="" value="后台充值">
				    </div>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button id="btn-addAccount" type="button" class="btn btn-primary">确认充值</button>
		      </div>
		    </div>
		  </div>
		</div>
</div> <!-- /#wrapper -->
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
	<!-- <script type="text/javascript" src="../js/libs/select2/js/i18n/zh-CN.js"></script>
	<script type="text/javascript" src="../js/libs/select2/js/select2.js"></script> -->
<script src="js/chongzhi.js"></script>
</body>
</html>