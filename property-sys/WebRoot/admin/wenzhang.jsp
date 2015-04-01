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
						<h2 class="span9">文章管理</h2>
						<div class="span3">
							<button class="btn btn-primary" type="button" id="btn_look_wenzhang">查看</button>
							<button class="btn btn-primary" type="button" id="btn_delete_wenzhang">删除</button>
							<button class="btn btn-primary" type="button" id="btn_publish_gonggao">发布公告</button>
						</div>
					</div>
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<div class="row">
				<table id="table-wenzhang" class="hover order-column span12"></table>
			</div>
			<!-- /.row -->
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->
	<!-- 查看文章弹出框 start  -->
		<div class="modal fade" id="look-wenzhang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
		        <h4 class="modal-title" id="myModalLabel">文章信息</h4>
		      </div>
		      <div class="modal-body row">
		        <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">标题</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="look-title" name="title" placeholder="">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">发布内容</label>
				    <div class="col-sm-8">
				      <textarea rows="8" class="form-control" id="look-content" name="content" placeholder=""></textarea>
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">作者</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="look-author" name="author" placeholder="">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">发布时间</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="look-publishDate" name="publishDate" placeholder="">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">类型</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="look-type" name="type" placeholder="">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">访问人数</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="look-visitors" name="visitors" placeholder="">
				    </div>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- 发布公告弹出框 start  -->
		<div class="modal fade" id="publish-gonggao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
		        <h4 class="modal-title" id="myModalLabel">发布公告</h4>
		      </div>
		      <div class="modal-body row">
		        <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">标题</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="publish-title" name="title" placeholder="请输入标题">
				    </div>
				  </div>
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">发布内容</label>
				    <div class="col-sm-8">
				      <textarea rows="8" class="form-control" id="publish-content" name="content" placeholder="请输入公告内容"></textarea>
				    </div>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button id="btn-publish-gonggao" type="button" class="btn btn-primary">发布</button>
		      </div>
		    </div>
		  </div>
		</div>
</div> <!-- /#wrapper -->
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>

<script src="js/wenzhang.js"></script>
</body>
</html>