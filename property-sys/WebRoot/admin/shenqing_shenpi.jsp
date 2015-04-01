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
						<h2 class="span9">申请管理</h2>
						<div class="span3">
							<button class="btn btn-primary" type="button" id="btn_shenhe_apply">批量通过审核</button>
							<button class="btn btn-primary" type="button" id="btn_reply_apply">回复</button>
							<button class="btn btn-primary" type="button" id="btn_delete_apply">删除</button>
						</div>
					</div>
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span12"><table id="table-shenqing" class="hover order-column"></table></div>
				
			</div>
			<!-- /.row -->
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->
	<!-- 审批弹出框 start  -->
		<div class="modal fade" id="replyApply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
		        <h4 class="modal-title" id="myModalLabel">申请回复</h4>
		      </div>
		      <div class="modal-body row">
		        <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="updateRepairForm">
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">用户账号</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="update-userName" placeholder="" name="userName" disabled="disabled">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">真实姓名</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="update-realName" placeholder="" name="realName" disabled="disabled" >
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">联系电话</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="update-contactNumber" name="contactNumber" placeholder="" disabled="disabled" >
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">地址</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="update-address" name="address" placeholder="" disabled="disabled" >
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">申请时间</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="update-applyTime" name="applyTime" placeholder="" disabled="disabled" >
				    </div>
				  </div>
				   <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">申请类型</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="update-type" name="type" placeholder="" disabled="disabled" >
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">申请内容</label>
				    <div class="col-sm-8">
				      <textarea rows="8" class="form-control" id="update-content" name="content" placeholder="" disabled="disabled"></textarea>
				      <input type="text" class="form-control" id="update-id" placeholder="" name="id"  style="display: none;">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">回复内容</label>
				    <div class="col-sm-8">
				      <textarea rows="8" class="form-control" id="update-reply" name="reply" placeholder="请输入回复内容"></textarea>
				    </div>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button id="btn-pass" type="button" class="btn btn-primary">通过审核</button>
		        <button id="btn-no-pass" type="button" class="btn btn-primary">不通过审核</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 申请回复弹出框  end  -->
</div> <!-- /#wrapper -->
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
<script src="js/shenqing_shenpi.js"></script>
</body>
</html>