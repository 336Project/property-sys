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
	<link rel="stylesheet" href="../js/libs/datepicker/css/datepicker.css" type="text/css"></link>
</head>

<body>
	
<div id="wrapper">
	<jsp:include page="/admin/inc/header.jsp"></jsp:include>
	<div id="masthead">
		<div class="container">
			<div class="masthead-pad">
				<div class="masthead-text">
					<div class="row">
					<h2 class="span9">缴费通知</h2>
						<div class="span3">
							<button class="btn btn-primary" type="button" id="btn_look_jiaofei">缴费明细</button>
							<button class="btn btn-primary" type="button" id="btn_add_jiaofei">缴费通知</button>
							<button class="btn btn-primary" type="button" id="btn_delete_jiaofei">删除</button>
						</div>
					</div>
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<blockquote>
			  <p>用户缴费情况</p>
			  <small>历史缴费记录</small>
			</blockquote>
			<div class="row-fluid">
				<div class="span12"><table id="table-jiaofei" class="hover order-column"></table></div>
			</div>
			
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->

</div> <!-- /#wrapper -->

<div id="add-jiaofei" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-4 control-label">用户名</label>
			    <div class="col-sm-8">
				     <select class="select2" id="userName" name="userName" ></select>
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">截止时间</label>
			    <div class="col-sm-8">
				    <input type="text" class="input-small" id="endTime" name="time" placeholder="yyyy-mm-dd">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">备注</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control"  placeholder="备注" name="remark">
			    </div>
		  </div>
		  <div class="control-group option" style="margin-top: 10px;">
		    <div class="col-sm-8 item" style="text-align: center;">
		    	<input type="text" name="itemName" placeholder="请输入缴费项"/>：
		        <input type="text" name="itemMoney" placeholder="请输入金额(元)"/>
		    </div>
		    <div id="otherItem"></div>
		  </div>
		</form>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-primary" id="addItem" >添加缴费项</button>
	<button type="button" class="btn btn-primary" id="btn-commit">确定</button>
  </div>
</div>
<div id="look-jiaofei" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">缴费明细</h3>
  </div>
  <div class="modal-body">
    <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-4 control-label">用户名</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control" id="look-userName" placeholder="" name="userName">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">创建时间</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control" id="look-createTime" placeholder="" name="createTime">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">总额</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control" id="look-money" placeholder="" name="money">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">截止时间</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control" id="look-endTime" placeholder="" name="endTime">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">完成时间</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control" id="look-payTime" placeholder="" name="payTime">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">状态</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control" id="look-status" placeholder="" name="status">
			    </div>
		  </div>
		  <div class="form-group" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">备注</label>
			    <div class="col-sm-8">
				    <input type="text" class="form-control"  placeholder="备注" id="look-remark" name="remark">
			    </div>
		  </div>
		  <div class="control-group option" style="margin-top: 10px;">
		    <label for="inputEmail3" class="col-sm-4 control-label">缴费明细：</label>
		  </div>
		  <div id="itemDetail"></div>
	</form>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
  </div>
</div>
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>

	<script type="text/javascript" src="../js/libs/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/jiaofei_tongzhi.js"></script>
</body>
</html>